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
        'uname'  =>  'require|max:25|token',
        'password' =>  'require',
    ];

$msg = [
'name.require' => '名称必须',
'name.max'     => '名称最多不能超过25个字符',
'age.number'   => '年龄必须是数字',
'age.between'  => '年龄只能在1-120之间',
'email'        => '邮箱格式错误',
];
}