<?php
/**
 * Created by PhpStorm.
 * User: ljy
 * Date: 17/9/22
 * Time: 下午5:41
 */

namespace app\admin\controller;


class MyError
{
    public function _empty(){
        $this->redirect('login/error');
    }
}