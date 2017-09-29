<?php
/**
 * Created by PhpStorm.
 * User: ljy
 * Date: 17/9/27
 * Time: 上午10:11
 */

namespace app\admin\model;


use think\Session;

class Banner extends Common
{
    //protected $table = 'sys_member';
    //新增时自动添加字段
    //protected $insert = ['password','regip','lastip'];
    //更新时自动添加字段
    //protected $update = ['lastip'];
    //只读字段
    protected $readonly = ['b_id'];

    /**
     *新增或编辑
     */
    public function edit_banner($data){
        $validate = validate('Banner');
        $valid = $validate->check($data,'');
        if(!$valid){
            return error($validate->getError());
        }

        if($data['b_type'] == 2){
            if(empty($data['content'])){
                return error('跳转内容不能为空！');
            }
        }
        $user = $data['user'];
        $good = $data['good'];
        if($data['b_type'] == 3){
            $re = model('User')->where(['user_id'=>$user])->find();
            if(!$re){
                return error('不存在该导师！');
            }
            $data['value'] = $user;
        }

        if($data['b_type'] == 4){
            $re = model('Goods')->where(['goods_id'=>$good])->find();
            if(!$re){
                return error("商品库不存在该商品!");
            }
            $data['value'] = $good;
        }
        $banner = new Banner;
        if(empty($data['b_id'])){
            $data['b_intime'] = date("Y-m-d h:i:s",time());
            $action = '新增';
            $result = $banner->allowField(true)->save($data);
        }else{
            $data['uptime'] = date("Y-m-d h:i:s",time());
            $action = '编辑';
            $result = $banner->allowField(true)->save($data,['b_id'=>$data['b_id']]);
        }
        $url = Session::get('url');
        if($result){
            return success(['info'=>$action.'轮播banner图成功','url'=>$url]);
        }else{
            return error($action.'轮播banner图失败');
        }
    }

    /**
     * 软删除
     */
    public function soft_del($id){
        $data = [
            'is_del'        => '2',
            'delete_time'   => date("Y-m-d H:i:s")
            ];
        $result = $this->save($data,['b_id'=>['in',$id]]);
        return $result;
    }

    /**
     * 真实删除
     */
    public function del($id){
        $result = $this->where(['b_id'=>['in',$id]])->delete();
        return $result;
    }

    /**
     *恢复数据
     */
    public function restore($id){
        $data = [
            'is_del'        => '1',
            'delete_time'   => date("Y-m-d H:i:s")
        ];
        $result = $this->save($data,['b_id'=>['in',$id]]);
        return $result;
    }

    /**
     *修改banner状态
     */
    public function change_status($id){
        $status = $this->where(['b_id'=>$id])->value('status');
        if(!$status)     return false;
        $abs = 3 - $status;
        //$arr = ['默认状态','开启状态'];
        $result = $this->save(['status'=>$abs],['b_id'=>$id]);
        if($result){
            return $abs;
        }else{
            return false;
        }
    }

}