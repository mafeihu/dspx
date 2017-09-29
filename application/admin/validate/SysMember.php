<?php
/**
 * Created by PhpStorm.
 * User: ljy
 * Date: 17/9/25
 * Time: 下午2:30
 */

namespace app\admin\validate;


use think\Validate;

class SysMember extends Validate
{
    protected $rule = [
        'uname'  =>  'require|max:16',
        'password' =>  'require',
    ];

    protected  $msg = [
    'uname.require' => '名称必须',
    'uname.max'     => '名称最多不能超过16个字符',
    ];
}