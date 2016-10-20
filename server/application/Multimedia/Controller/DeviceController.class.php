<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/10/17
 * Time: 17:41
 */

namespace Multimedia\Controller;

use Common\Controller\AdminbaseController;

class DeviceController extends AdminbaseController {

    protected $device_model;

    function _initialize() {
        parent::_initialize();
        $this->device_model =D("Common/device");
    }


    /**
     *  显示
     */
    public function index() {
        $device=$this->device_model->select();
        $this->assign("device",$device);
        $this->display();
    }

    /**
     *  添加
     */
    public function add() {
        $this->display();
    }

    /**
     *  添加
     */
    public function add_post() {
        if (IS_POST) {
            if ($this->device_model->create()) {
                if ($this->device_model->add()) {
                    $this->success("添加成功！", U("Device/index"));
                } else {
                    $this->error("添加失败！");
                }
            } else {
                $this->error($this->device_model->getError());
            }
        }
    }

    /**
     * 编辑
     */
    function edit(){
        $id= intval(I("get.id"));
        $campus=$this->device_model->where("id=$id")->find();
        $this->assign($campus);
        $this->display();
    }

    /**
     * 编辑
     */
    function edit_post(){
        if (IS_POST) {
            if ($this->device_model->create()) {
                if ($this->device_model->save() !== false) {
                    $this->success("保存成功！", U("Device/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->device_model->getError());
            }
        }
    }


    function delete(){
        $id = intval(I("get.id"));
        if ($this->device_model->where("id=$id")->delete()!==false) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }


}