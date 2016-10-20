<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/9/22 0022
 * Time: 21:13
 */

namespace Multimedia\Controller;
use Common\Controller\AdminbaseController;
class BuildingController extends AdminbaseController {

    protected $building_model;
    protected $campus_model;

    function _initialize() {
        parent::_initialize();
        $this->building_model =D("Common/Building");
        $this->campus_model =D("Common/Campus");
    }


    /**
     *  显示
     */
    public function index() {
        $model=D('Building');
        $building=$model->relation(true)->select();
        $this->assign("building",$building);
        $this->display();
    }

    /**
     *  添加
     */
    public function add() {
        import("Tree");
        $tree = new \Tree();
        $campus=$this->campus_model->select();
        $str = "<option value='\$id' \$selected>\$spacer \$title</option>";
        $tree->init($campus);
        $select_campus = $tree->get_tree(0, $str);
        $this->assign("select_campus",$select_campus);
        $this->display();
    }

    /**
     *  添加
     */
    public function add_post() {
        if (IS_POST) {
            if ($this->building_model->create()) {
                if ($this->building_model->add()) {
                    $this->success("添加成功！", U("building/index"));
                } else {
                    $this->error("添加失败！");
                }
            } else {
                $this->error($this->building_model->getError());
            }
        }
    }

    /**
     * 编辑
     */
    function edit(){
        import("Tree");
        $tree = new \Tree();
        $id= intval(I("get.id"));
        $data=$this->building_model->where("id=$id")->find();
        $result = $this->campus_model->select();
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $data['campus_id'] ? 'selected' : '';
            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$title</option>";
        $tree->init($array);
        $select_campus = $tree->get_tree(0, $str);
        $this->assign("select_campus", $select_campus);
        $this->assign($data);
        $this->display();
    }

    /**
     * 编辑
     */
    function edit_post(){
        if (IS_POST) {
            if ($this->building_model->create()) {
                if ($this->building_model->save() !== false) {
                    $this->success("保存成功！", U("building/index"));
                } else {
                    $this->error("保存失败！");
                }
            } else {
                $this->error($this->building_model->getError());
            }
        }
    }


    function delete(){
        $id = intval(I("get.id"));
        if ($this->navcat_model->where("navcid=$id")->delete()!==false) {
            $nav_obj=D("Common/Nav");
            $nav_obj->where("cid=$id")->delete();
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }


}