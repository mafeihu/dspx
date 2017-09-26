<?php
namespace app\api\controller;
use Qiniu\QiniuPili;
use lib\Easemob;
use lib\Upload;
use think\Controller;
use think\View;
use think\Db;
use opensearch;
use \think\Session;
use \think\Request;
use \think\model;
class Live extends Common{
    private $domain = 'http://oc3pwoyhb.bkt.clouddn.com/';
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }
    /**
     * @param lag
     * @param log
     * @param t
     * @开启直播
     */
    public function start_live(){
        $user = $this->checklogin();
        $param = Request::instance()->request();
        $log = empty($param["log"]) ? '116.42669': $param["log"];
        $lag = empty($param["lag"]) ? '39.917149': $param["lag"];
        $title = empty($param["title"]) ? '': $param["title"];
        $img = empty($param["img"]) ? '' : $param["img"];
        $lebel =empty($param["goods_id"]) ?  1 : $param["goods_id"];
        if($log && $lag){
            $gwd = $lag.','.$log;
            $baidu_apikey = DB::name('System')->value('baidu_apikey');
            $file_contents = file_get_contents('http://api.map.baidu.com/geocoder/v2/?ak='.$baidu_apikey.'&location='.$gwd.'&output=json');
            $rs = json_decode($file_contents,true);
            $sheng = $rs['result']['addressComponent']['province'];
            $shi = $rs['result']['addressComponent']['city'];
            $qu = $rs['result']['addressComponent']['district'];
            $address = $rs['result']['formatted_address'];
        }
        $user = DB::name('member')->where(['member_id' =>$user["member_id"]])->find();
        $user['username'] ? $name = $user['username'].rand(100,999) : $name = "直播间" . rand(100, 999);
        $options = [
            'name' => $name,
            'description' => $name,
            'maxusers' => 3000,
            'owner' => $user['hx_username']
        ];
        $hx = new Easemob();
        $create = $hx->createChatRoom($options);
        (!empty($create['error'])) ? error('创建聊天室失败!') : true;
        //七牛生成流地址
        $qn = new QiniuPili();
        $play_address = $qn->push_address();
        $qiniu_room_id = time().rand(100, 999);
        $qiniu_room_name = "主播".rand(10000,99999);
        $create_room = $qn->creatroom($qiniu_room_id,$qiniu_room_name);    //七牛创建房间
        $time = time();
        $data = [
            'user_id'=>$user['member_id'],
            'play_img'=>$img,
            'title'=>$title,
            'lebel'=>$lebel,
            'push_flow_address'=>$play_address['url'],
            'play_address'=>$play_address['url2'],
            'play_address_m3u8'=>$play_address['m3u8'],
            'start_time'=>$time,
            'stream_key'=>$play_address['streamKey'],
            'live_status'=>1,
            'live_time'=>0,
            'room_id'=>$create['data']['id'],
            'intime'=>$time,
            'date'=>date('Y-m-d',$time),
            'log'=>$log,
            'lag'=>$lag,
            'sheng'=>$sheng,
            'shi'=>$shi,
            'qu'=>$qu,
            'address'=>$address,
            'qiniu_room_id'=>$create_room['room_id'],
            'qiniu_room_name'=>$create_room['room_name'],
            'qiniu_token'=>$create_room['token'],
            "livewindow_type"  => 1,
        ];
        if ( $live_id = Db::name('Live')->insertGetId($data)) {
//            //二维码
//            $url = C('IMG_PREFIX')."/App/Index/share_live/live_id/" . base64_encode($live_id);
//            $qrcode_path = "./Public/upload/qrcode/" . time() . rand(100, 999) . '_qrcode.png';
//            qrcode($url, $qrcode_path, 3, 4);
//            M('Live')->where(['live_id'=>$live_id])->save(['qrcode_path' => $qrcode_path,'uptime' => time()]);
            //$get_gradeinfo = get_gradeinfo($u['title_id']);
            $result = [
                'nums' => '0',
                'push_flow_address' => $play_address['url'],
                'play_address'=>$play_address['url2'],
                'room_id' => $create['data']['id'],
                'ID' => $user['ID'],
                'e_ticket' => $user['e_ticket'],
                'start_time' =>(string)$time,
                'url' => 'baidu.com',
                'live_id'=>$live_id,
                'time'=>date('Y.m.d',$time),
                'qiniu_room_id'=>$create_room['room_id'],
                'qiniu_room_name'=>$create_room['room_name'],
                'qiniu_token'=>$create_room['token'],
                'is_wheat'=>$user['is_wheat'],
//                'grade_img'=>$get_gradeinfo['img'],
//                'name'=>$get_gradeinfo['name']
            ];
            success($result);
        } else {
            error('开启失败!');
        };
    }
    /**
     * @进入直播间
     */
    public function into_live(){
        $user = $this->checklogin();
        $param = Request::instance()->request();
        $live_id = empty($param["live_id"]) ?  error("无法进入直播间") : $param["live_id"];
        //判断是否被踢
        DB::name('Live_kicking')->where(['live_id'=>$live_id,'user_id'=>$user["member_id"]])->find() ? error('你已被踢出直播间，无法进入!') : true;
        //进入直播间,把进入的其他正在直播的记录删除

        //object join ( mixed join [, mixed $condition = null [, string $type = 'INNER']] )
        $live = DB::name('Live')
            ->alias('a')
            ->field('a.live_id,b.user_id2')
            ->join('__LIVE_NUMBER__ b', 'a.live_id=b.live_id',"right")
            ->where(['a.live_status'=>1])
            ->select();
        if ($live){
            $ids = array_map(function($v){ return $v['user_id2'];},$live);
            if (in_array($user["member_id"],$ids)){
                $live_number = DB::name('Live_number')->where(['live_id'=>$live_id,'user_id2'=>$user["member_id"]])->find();
                if ($live_number){DB::name('Live_number')->where(['live_number_id'=>$live_number['live_number_id']])->delete();}
            }
        }
        $user_id2 = DB::name('Live')->where(["live_id"=>$live_id])->value('user_id');
        if (DB::name('Live_number')->insert(['live_id'=>$live_id,'user_id'=>$user_id2,'user_id2'=>$user["member_id"],'intime'=>time()])){
            DB::name('Live')->comment('观看总人数加1')->where(['live_id'=>$live_id])->setInc('nums');
            DB::name('Live')->comment('观看人数加1')->where(['live_id'=>$live_id])->setInc('watch_nums');
            $is_follow = DB::name('Follow')->comment("判断是否关注")->where(['user_id' => $user["member_id"], 'user_id2' => $user_id2])->find();
            $is_follow ? $is_follow = "2" : $is_follow = "1";
            $lignt_up = DB::name('Live_light_up')->comment("判断是否点亮")->where(['live_id'=>$live_id,'user_id'=>$user["member_id"],'user_id2'=>$user_id2])->find();
            $lignt_up ? $is_lignt_up = "2" : $is_lignt_up = "1";
            $result = ['is_follow'=>$is_follow,'is_lignt_up'=>$is_lignt_up];
        }else{
            error('失败!');
        }
        success($result);
    }
    /**
     * @获取主播信息
     * @param  header_img头像
     * @param  follow_count关注人数
     * @param  fans_count 粉丝数量
     * @param  give_count 送礼数量
     */
    public function get_live_info(){
        $user = $this->checklogin();
        $params = Request::instance()->request();
        $user_id = empty($params["user_id"]) ? error("参数错误") : $params["user_id"];

        $info = DB::name('member')->where(['member_id'=>$user_id])->find();
        $info['header_img'] = $info['header_img'];
        $info['follow_count'] = DB::name('Follow')->comment('关注数')->where(['user_id' =>$user_id])->count();
        $info['fans_count']  = DB::name('Follow')->comment('粉丝数')->where(['user_id2' =>$user_id])->count();
        $info['give_count'] = DB::name('Give_gift')->comment('送礼数')->where(['user_id'=>$user_id])->count();
        $is_follow = DB::name('Follow')->where(['user_id'=>$user["member_id"],'user_id2'=>$user_id])->find();
        $is_follow ? $info['is_follow'] = "2" : $info['is_follow'] = "1";
        success($info);
    }
    /**
     *
     * @直播间用户列表
     */
    public function show_viewer(){
        $user = $this->checklogin();
        $params = Request::instance()->request();
        $live_id = empty($params["live_id"]) ? error("无法获取直播间信息") : $params["live_id"];
        $page = empty($params["page"]) ? 1 : $params["page"];
        $pageSize = empty($params["pagesize"]) ? 50 : $params["pagesize"];
        //获取直播总的僵尸粉数量(包括观看人数)
        $count  = DB::name('Live_number')
            ->alias('a')
            ->join('__MEMBER__ b', 'a.user_id2=b.member_id')
            ->where(['a.live_id'=>$live_id])
            ->count();
        //获取僵尸粉信息
        $list = DB::name('Live_number')
            ->alias('a')
            ->field('a.user_id2,b.member_id,b.header_img,b.username,b.grade,b.ID,b.hx_username,b.hx_password,b.b_diamond,b.e_ticket,b.sex,b.province,b.city,b.area')
            ->join('__MEMBER__ b' , 'a.user_id2=b.member_id')
            ->where(['a.live_id'=>$live_id])
            ->order('a.intime desc')
            ->page($page,$pageSize)
            ->select();
        if ($list){
            foreach ($list as $k=>$v) {
                $list[$k]['header_img'] = $v['header_img'];
                $list[$k]['follow_count'] = DB::name('Follow')->comment('关注数')->where(['user_id' =>$v['user_id2']])->count();
                $list[$k]['fans_count']  = DB::name('Follow')->comment('粉丝数')->where(['user_id2' =>$v['user_id2']])->count();
                $is_follow = DB::name('Follow')->where(['user_id'=>$user["member_id"],'user_id2'=>$v['user_id2']])->find();
                $is_follow ? $list[$k]['is_follow'] = "2" : $list[$k]['is_follow'] = "1";
                //查询是否被禁言
                $is_banned = DB::name('Banned')->comment("判断是否禁言")->where(['live_id'=>$live_id,'user_id2'=>$v['user_id2']])->find();
                $is_banned ? $list[$k]['is_banned'] = "2" : $list[$k]['is_banned'] = "1";
                //查询是否是管理
                $is_management = DB::name('Live_management')->comment("判断是否为管理员")->where(['user_id'=>$v['member_id'],'user_id'=>$v['user_id2']])->find();
                $is_management ? $list[$k]['is_management'] = "2" : $list[$k]['is_management'] = "1";
                $list[$k]['give_count'] = DB::name('Give_gift')->comment('送礼数')->where(['user_id'=>$v['member_id']])->count();
            }
        }else{
            $list=[];
        }
        if(count($list)==0){
                $count =0;
        }
            success(["list" =>$list,"count"=>$count]);
    }
    /**
     * @点亮
     */
    public function lignt_up(){
        $user =$this->checklogin();
        $params = Request::instance()->request();
        $live_id = empty($params["live_id"]) ? error("无法获取直播间信息") : $params["live_id"];
        $user_id2 = DB::name('Live')->where(["live_id" =>$live_id])->value('user_id');
        $lignt_up = DB::name('Live_light_up')->where(['live_id'=>$live_id,'user_id'=>$user["member_id"],'user_id2'=>$user_id2])->find();
        if($lignt_up){
            error('已点亮!');
        }else{
            if (DB::name('Live_light_up')->insert(['live_id'=>$live_id,'user_id'=>$user["member_id"],'user_id2'=>$user_id2,'intime'=>time()])){
                DB::name('Live')->comment('点亮数加1')->where(['live_id'=>$live_id])->setInc('light_up_count');
                success('点亮成功!');
            }else{
                error('点亮失败!');
            }
        }
    }

    /**
    * @关注（取消关注）
    * @type  1:关注   2：取消关注
    */
    public function follow(){
        $user = $this->checklogin();
        $params = Request::instance()->request();
        $user_id2 = empty($params["user_id2"]) ? error("参数错误") : $params["user_id2"];
        $type = empty($params["type"]) ? error("参数错误") : $params["type"];
        ($type == 1 || $type == 2) ? true : error('传值错误!');
        if ($user["member_id"] == $user_id2) error("传值错误");
        $check = DB::name('Follow')->where(['user_id' => $user["member_id"], 'user_id2' => $user_id2])->find();
        if ($type == 1) {
            if ($check) error("已关注");
            if (DB::name('Follow')->insert(['user_id' => $user["member_id"], 'user_id2' => $user_id2, 'intime' => time()])){
                success('关注成功!');
            } else {
                error('关注失败!');
            }
        } else {
            if (!$check) error("未关注");
            if (DB::name('Follow')->where(['user_id' => $user["member_id"], 'user_id2' => $user_id2])->delete()) {
                success('成功!');
            } else {
                error('失败!');
            }
        }
    }
    /**
     * 踢人
     */
    public function kicking(){
        $user = $this->checklogin();
        $param = Request::instance()->request();
        $live_id = empty($param["live_id"]) ?  error("无法进入直播间") : $param["live_id"];
        $user_id = empty($param["user_id"]) ?  error("无法获取用户信息") : $param["user_id"];
        // 启动事务
        Db::startTrans();
        try{
            DB::name('live_kicking')->insert(['live_id'=>$live_id,'user_id'=>$user_id,'intime'=>time(),'date'=>date('Y-m-d',time())]);
            DB::name('live_number')->where(['live_id'=>$live_id,'user_id2'=>$user_id])->delete();
            // 提交事务
            Db::commit();
            success('成功!');
        } catch (\Exception $e) {
            Db::rollback();
            error('失败!');
        }
    }
    /**
     * @判断是否被禁言
     */
    public function is_banned(){
        $user = $this->checklogin();
        $params = Request::instance()->request();
        $live_id = empty($params["live_id"]) ? error("无法获取直播间信息") : $params["live_id"];
        if (DB::name('Banned')->where(['live_id'=>$live_id,'user_id2'=>$user["member_id"]])->find()){
            $result = "2";
        }else{
            $result = "1";
        }
        success($result);
    }

    /**
     * @禁言(取消禁言)
     */
    public function do_banned(){
        $user = $this->checklogin();
        $params = Request::instance()->request();
        $user_id2 = empty($params["user_id"]) ? error("无法获取用户的信息") : $params["user_id"];
        $live_id = empty($params["live_id"]) ? error("无法获取直播间信息") : $params["live_id"];
        $type = empty($params["type"]) ? error("参数错误") : $params["type"];
        $uid = DB::name('Live')->where(["live_id" =>$live_id])->value('user_id');   //主播id
        $ba = DB::name('Banned')->where(['live_id'=>$live_id,'user_id'=>$uid,'user_id2'=>$user_id2])->find();
        switch ($type){
            case 1:
                if ($ba){
                    error('已被禁言!');
                }else{
                    if (DB::name('Banned')->insert(['live_id'=>$live_id,'user_id'=>$uid,'user_id2'=>$user_id2,'intime'=>time()])){
                        success('禁言成功!');
                    }else{
                        error('失败!');
                    }
                }
                break;
            case 2:
                if ($ba){
                    if (DB::name('Banned')->where(['banned_id'=>$ba['banned_id']])->delete()){
                        success('成功!');
                    }else{
                        error('取消成功!');
                    }
                }else{
                    error('还未被禁言!');
                }
            break;
        }
    }
    /**
     * @获取用户是否开启连麦功能
     */
    public function is_wheat(){
        $user = $this->checklogin();
        $params = Request::instance()->request();
        $user_id = empty($params["user_id"]) ? error("无法获取用户的信息") : $params["user_id"];
        $is_wheat = DB::name('member')->where(['member_id'=>$user_id])->value('is_wheat');
        if($is_wheat==1){
            $is_wheat = 1;
        }else{
            $is_wheat = 2;
        }
        success($is_wheat);
    }

    /**
     * @开启连麦(关闭连麦)
     * @type  1:开启   2:关闭
     */
    public function do_wheat(){
        $user = $this->checklogin();
        $params = Request::instance()->request();
        $type = empty($params["type"]) ? error("无法进行连麦操作") : $params["type"];
        if (DB::name('member')->where(['member_id'=>$user['member_id']])->update(['is_wheat'=>$type,'uptime'=>time()])){
            success('成功!');
        }else{
            error('失败!');
        }
    }


    /**
     *退出直播间
     */
    public function out_live(){
       $user = $this->checklogin();
        $param = Request::instance()->request();
        $live_id = empty($param["live_id"]) ?  error("无法获取直播间信息") : $param["live_id"];
        $user_id2 = DB::name('Live')->where(["live_id"=>$live_id])->value('user_id');
        if (DB::name('Live')->where(['live_id' =>$live_id])->setDec('watch_nums')){
            DB::name('Live_number')->comment('删除记录')->where(['live_id'=>$live_id,'user_id'=>$user_id2,'user_id2'=>$user["member_id"]])->delete();
            success('成功退出!');
        }else{
            error('退出失败!');
        }
    }

    /**
     * 结束直播(主播端)
     */
    public function end_live(){
        $user = $this->checklogin();
        $param = Request::instance()->request();
        $live_id = empty($param["live_id"]) ?  error("无法进入直播间") : $param["live_id"];
        if (DB::name('live')->where(['live_id'=>$live_id])->update(['end_time'=>time(),'live_status'=>2,'is_normal_exit'=>1])){
            $live = Db::name('Live')->alias('a')
                ->field('a.live_id,a.user_id,a.play_img,a.title,a.start_time,a.end_time,a.watch_nums,a.share,a.stream_key,a.room_id,a.lebel,b.header_img,b.username,b.ID')
                ->join('__MEMBER__ b','a.user_id=b.member_id')
                ->where(['live_id'=>$live_id])
                ->find();
            if (time()-$live['start_time']>120){
                $streamKey = $live['stream_key'];
                $qn = new QiniuPili();
                $fname = $qn->save_vido($streamKey);
                if ($fname['fname']) {
                    $url = $this->domain . $fname['fname'];
                    $live['url'] = $url;
                    $data =[
                        'stream_key'=>$streamKey,
                        'live_id'=>$live_id,
                        'user_id'=>$live['user_id'],
                        'play_img'=>$live['play_img'],
                        'title'=>$live['title'],
                        'url'=>$url,
                        'intime'=>time(),
                        'room_id'=>$live['room_id'],
                        'date'=>date('Y-m-d',time()),
                        'lebel'=>$live['lebel'],
                        'livewindow_type' => 1,
                        'live_time' => $live["start_time"],

                    ];
                    DB::name('Live_store')->insert($data);

                }
            }
            $url ? $live['url'] = $url : $live['url'] = "";
            $list = DB::name('Live')->where(['date'=>date('Y-m-d',time())])->order('nums desc')->select();
//            foreach ($list as $k=>$v){
//                if ($v['live_id']==$live_id){
//                    $aa = $k;
//                }
//            }
//            var_dump($aa);exit;
//            $cout = count($list);
//            $live['beat'] = (string)(floor((($cout-$aa)/$cout)*100));
            $live['play_img'] = $live['play_img'];
//            $live['img'] = $live['img'];
            $timediff = $live['end_time']-$live['start_time'];
            //计算小时数
            $remain = $timediff%86400;
            $hours = intval($remain/3600);
            //计算分钟数
            $remain = $remain%3600;
            $mins = intval($remain/60);
            //计算秒数
            $secs = $remain%60;
            $live['time'] = $hours.":".$mins.":".$secs;
            $get_fire = DB::name('Give_gift')->where(['live_id'=>$live_id])->sum('jewel');
            $get_fire ? $live['get_fire'] = $get_fire : $live['get_fire'] = "0";
            success($live);
        }else{
            error('失败!');
        }
    }
    /**
     * @param  price价格
     * @param img图片
     * @礼物列表
     */
    public function gift_list(){
        $user = $this->checklogin();
        $list = DB::name('Gift')->order('price desc')->select();
        if ($list){
            foreach($list as $k=>$v){
                $list[$k]['img'] = $v['img'];
            }
        }else{$list=[];}
        success($list);
    }

    /**
     * @送礼
     */
    public function give_gift(){
        $user = $this->checklogin();
        $param = Request::instance()->request();
        $live_id = empty($param["live_id"]) ?  error("无法获取直播间信息") : $param["live_id"];
        $gift_id = empty($param["gift_id"]) ?  error("礼物获取失败") : $param["gift_id"];
        // 启动事务
        Db::startTrans();
        $gift = DB::name("gift")->where(['gift_id' => $gift_id])->find();
        $user['b_diamond'] - $gift['price'] < 0 ? error('余额不足!') : true;
        $user_money = $user['b_diamond']-$gift['price'];       //用户扣除之后的金额
        $user_experience = $user['experience'] + $gift['experience'];   //计算用户经验
        $up_mebinfo = DB::name("member")->where(['member_id' =>$user['member_id']])->update(['b_diamond' => $user_money,'experience'=>$user_experience,'uptime' => time()]);
        if ($up_mebinfo) {
            $user_id2 = DB::name("live")->where(["live_id"=>$live_id])->value('user_id');    //主播id
            //有bug待处理
            $gift_price = $gift['price']*10;
            $get_money = DB::name("member")->where(["member_id"=>$user_id2])->value('e_ticket') + $gift_price;
            $up_live_info = DB::name("member")->where(['member_id' => $user_id2])->update(['e_ticket' => $get_money,'uptime' => time()]);
            if (!$up_live_info){
                Db::rollback();
                error('点击太快!');
            }
            $data = [
                'user_id' => $user['member_id'],
                'live_id'=>$live_id,
                'user_id2' => $user_id2,
                'gift_id' => $gift_id,
                'intime' => time(),
                'date' => date('Y-m-d', time()),
                'jewel' => $gift['price'],
                'experience' => $gift['experience']
            ];
            $add_give_gift = DB::name('give_gift')->insert($data);
            if (!$add_give_gift){
                DB::rollback();
                error('点击太快!');
            }
            //等级提升
           // ascension_grade($user['user_id'],$user_experience);
            DB::commit();
            success('送礼成功!');
        } else {
            Db::rollback();
            error('送礼失败!');
        }
    }
    /**
     * @获取用户火力（直播间的收益）
     */
    public function get_get_money(){
        $user = $this->checklogin();
        $params = Request::instance()->request();
        if (empty($param["user_id"])){
            $money = $user['e_ticket'];
        }else{
            $money = DB::name('member')->where(["member_id"=>$user["member_id"]])->value('e_ticket');
        }
        success($money);
    }
    /**
     * @当前登录用户的钻石余额
     */
    public function get_diamond(){
        $user =$this->checklogin();
        $result = ['money'=>$user['b_diamond']];
        success($result);
    }
}