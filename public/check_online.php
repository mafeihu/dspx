<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用入口文件
$_GET['m']='api';
$_GET['c']='Cli';
$_GET['a']='check_online';
// 定义应用目录
define('APP_PATH', __DIR__ . '/../application/');
define("WEB_ROOT", dirname(__FILE__) . "/application/");
// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
