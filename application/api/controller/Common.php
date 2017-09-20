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
        $this->assign('page_title','看法');
        $this->assign('page_keywords','法律大数据平台');
        if(Session::get('member')){
            $this->member = Session::get('member');
        }
        if(Session::get('lawyer')){
            $this->lawyer = Session::get('lawyer');
        }
        define('CONTROLLER_NAME',Request::instance()->controller());
        define('MODULE_NAME',Request::instance()->module());
        define('ACTION_NAME',Request::instance()->action());
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
}
