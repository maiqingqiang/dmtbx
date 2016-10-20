<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/10/17
 * Time: 18:00
 */

namespace Api\Controller;

class DeviceController extends CommonController  {

    protected $device_model;

    function _initialize() {
        $this->device_model =D("Common/Device");
    }

    public function getDevice(){
        $result=$this->device_model->select();
        if ($result){
            foreach ($result as $v){
                $data[$v['title']]=$v['id'];
            }
            $this->return_ajax(200,'获取成功',$data);
        }else{
            $this->return_ajax(400,'获取失败');
        }
    }
}