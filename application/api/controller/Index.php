<?php
namespace app\api\controller;
use think\Controller;
use think\View;
use think\Db;
use opensearch;
use \think\Session;
use \think\Request;

class Index extends Common
{
    /**
     * bannber
     */
   public function banner_list(){
       $data["is_del"] =1;
       $list = DB::name('Banner')->field("b_img,b_id,url,b_type,title")->where($data)->order('sort desc')->select();
       if (!$list){
           $list =[];
       }
       success($list);
   }
}
