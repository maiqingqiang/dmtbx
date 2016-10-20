<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/10/17
 * Time: 18:02
 */

namespace Api\Controller;

use Think\Controller;

class CommonController extends Controller {
    function return_ajax($code,$message,$data=null){
        if ($data==null){
            $this->ajaxReturn(array('code'=>$code,'message'=>$message));
        }else{
            $this->ajaxReturn(array('code'=>$code,'message'=>$message,'data'=>$data));
        }
    }
}