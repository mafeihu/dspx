<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
 * curl_get请求
 * @param $url
 * @return mixed
 */
function curl_get($url){
        $ch = curl_init();
        //设置超时
        curl_setopt($ch,CURLOPT_TIMEOUT, "60");
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        //运行curl，结果以jason形式返回
        $res = curl_exec($ch);
        curl_close($ch);
        return $res;
}

//成功处理函数
function success($arr){
    $d = [
        'status' 	=> 'ok',
        'data'		=> $arr
    ];
    $d = json_encode($d,JSON_UNESCAPED_UNICODE);
    $d = str_replace('null','""',$d);
    echo $d;
    exit;
}

function error($arr){
    $data = [
        'status'    =>  'error',
        'data'      =>  $arr,
    ];
    echo  json_encode($data,JSON_UNESCAPED_UNICODE);
    exit();
}