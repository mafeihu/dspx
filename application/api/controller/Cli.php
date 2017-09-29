<?php
namespace app\api\controller;
use \Qiniu\QiniuPili;
use \lib\Easemob;
use \lib\Upload;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\model;
class Cli extends  Common{
    public function check_online(){
        echo "nihao";
    }
}