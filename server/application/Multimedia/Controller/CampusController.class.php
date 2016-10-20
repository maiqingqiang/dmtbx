<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/9/22 0022
 * Time: 21:13
 */

namespace Multimedia\Controller;

use Common\Controller\AdminbaseController;

class CampusController extends AdminbaseController  {

    protected $campus_model;

    function _initialize() {
        parent::_initialize();
        $this->campus_model =D("Common/Campus");
    }


    /**
     *  显示
     */
    public function index() {
        $campus=$this->campus_model->select();
        $this->assign("campus",$campus);
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
            if ($this->campus_model->create()) {
                if ($this->campus_model->add()) {
                    $this->success("添加成功！", U("campus/index"));
                } else {
                    $this->error("添加失败！");
                }
            } else {
                $this->error($this->campus_model->getError());
            }
        }
    }

    /**
     * 编辑
     */
    function edit(){
        $id= intval(I("get.id"));
        $campus=$this->campus_model->where("id=$id")->find();
        $this->assign($campus);
        $this->display();
    }

    /**
     * 编辑
     */
    function edit_post(){
        if (IS_POST) {
            if ($this->campus_model->create()) {
                if ($this->campus_model->save() !== false) {
                    $this->success("保存成功！", U("campus/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->campus_model->getError());
            }
        }
    }


    function delete(){
        $id = intval(I("get.id"));
        if ($this->campus_model->where("id=$id")->delete()!==false) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }


}