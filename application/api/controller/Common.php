<?php
namespace app\api\controller;
use think\Controller;
use think\View;
use think\Db;
use opensearch;
use \think\Session;
use \think\Request;

class Common extends Controller
{
    protected $member;
    protected $lawyer;

    public function _initialize(){
        header('Content-Type: application/json');
        header("Content-type:text/html;charset=utf-8");
    }
    public function get_guid(){
        mt_srand((double)microtime()*10000);
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);
        $uuid =  substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12) ;
        return strtolower($uuid);
    }
    public function api_return($code,$msg,$data=''){
        header('Content-Type: application/json');
        echo json_encode(array('code'=>$code?:'999','msg'=>$msg?:'未知错误','data'=>$data));
        exit();
    }

    public function _empty(){
        $this->api_return(404,'方法不存在');
    }

    protected function set_pages($page_data,$pageurl) {
        $this->assign('page_vars', $page_data);
        $this->assign('page_url', $pageurl);
        $pagehtml = $this->fetch('public:page');
        $this->assign('page', $pagehtml);
    }

    /**
     * @return array|false|mixed|\PDOStatement|string|\think\Model
     */
    function checklogin()
    {
        $param = Request::instance()->request();
        if(empty($param['uid']) || empty($param['token'])){
            error("token failed");
        }
        $data["member_id"] = $param["uid"];
        $data["app_token"] = $param["token"];
        $rel = DB::name("member")->where($data)->find();
        if (!$rel) {
            error("token failed");
        } else {
            if ($rel['is_del'] == 2) {
                error("账号被删除");
            } else {
                //如果是会员,判断会员是否到期,到期变成普通会员
                if ($rel['type'] == 2) {
                    if ($rel['expiration_time'] < time()) {
                        DB::name('member')->where(['member_id' => $param["uid"]])->update(['type' => 1, 'uptime' => time()]);
                    }
                }
                return $rel;
            }
        }
    }
}
