<?php
/**
 * Created by PhpStorm.
 * User: ljy
 * Date: 17/9/22
 * Time: 下午3:51
 */

namespace app\admin\controller;


use think\Controller;

class login extends Controller
{
    public function signin(){
        $system = M("system")->where(['id'=>"1"])->getField('title');
        if (Request::instance()->isAjax()){
            print_r(1);
            $data = $_POST;
            if (empty($data['uname']) || empty($data['password'])){
                echo json_encode(['status'=>'error','info'=>'用户名或者密码不能为空','class'=>'']);
                return;
            }
            if(empty($data['verify_code'])){
                echo json_encode(['status'=>'error','info'=>'验证码不能为空','class'=>'']);
                return;
            }

            if(!check_verify($data['verify_code'])){
                echo json_encode(['status'=>'error','info'=>'验证码错误啦，请再输入吧','class'=>'']);
                return;
            }

            $data['password']	= myencrypt($data['password']);
            $user = M('Member')->where(['username'=>$data['uname'],'password'=>$data['password']])->find();
            if (!empty($user)){
                $data['last_login_date'] = date("Y-m-d H:i:s");
                $data['last_login_ip'] = getIP();
                $user['login_times'] ++;
                $data['login_times'] = $user['login_times'];
                M('Member')->where(['id'=>$user['id']])->save($data);
                $group = M('AuthGroupAccess')->alias('a')
                    ->field("b.title")
                    ->join("LEFT JOIN __AUTH_GROUP__ b on a.group_id = b.id")
                    ->where(['a.uid'=>$user['id']])
                    ->find();
                unset($user['password']);
                $user['title'] = $group['title'];
                session::set('user',$user);
                echo json_encode(['status'=>'ok','info'=>$system.'管理系统登陆成功','url'=>U('Index/index')]);
                die;
            } else {
                echo json_encode(['status'=>'error','info'=>'用户名或者密码不正确','class'=>'']);
                die;
            }
            return;
        } else {
            print_r(1);
            layout(false);
            $user = session::get('user');
            if(!empty($user)){
                $this->redirect('Index/index');
            }
            $this->assign("system", $system);
            return $this->fetch('common/login-1');
        }
    }

    public function _empty(){
        return $this->redirect('login/error');
    }
}