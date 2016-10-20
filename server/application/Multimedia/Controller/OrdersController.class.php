<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/9/22 0022
 * Time: 21:13
 */

namespace Multimedia\Controller;
use Common\Controller\AdminbaseController;
class OrdersController extends AdminbaseController {

    protected $orders_model;
    protected $orders_m;

    function _initialize() {
        parent::_initialize();
        $this->orders_model =D("Orders");
        $this->orders_m =M("Orders");
    }


    /**
     *  显示
     */
    public function index() {
        $count=$this->orders_model->count();
        $page = $this->page($count, 10);
        $orders=$this->orders_model->limit($page->firstRow . ',' . $page->listRows)->order('createtime desc')->select();
        $this->assign("page", $page->show('Admin'));
        $this->assign("orders",$orders);
        $this->display('index');
    }

    public function notOrder(){
        $where['order_status']=0;
        $count=$this->orders_model->where($where)->count();
        $page = $this->page($count, 10);
        $orders=$this->orders_model->where($where)->limit($page->firstRow . ',' . $page->listRows)->order('createtime desc')->select();
        $this->assign("page", $page->show('Admin'));
        $this->assign("orders",$orders);
        $this->display('index');
    }

//    public function ordered(){
//        $where['order_status']=1;
////        $where['fix_status']=0;
//        $count=$this->orders_model->where($where)->count();
//        $page = $this->page($count, 10);
//        $orders=$this->orders_model->where($where)->limit($page->firstRow . ',' . $page->listRows)->order('createtime desc')->select();
//        $this->assign("page", $page->show('Admin'));
//        $this->assign("orders",$orders);
//        $this->display('index');
//    }

    public function notFix(){
//        $where['fix_status']=0;
        $where['order_status']=1;
        $count=$this->orders_model->where($where)->count();
        $page = $this->page($count, 10);
        $orders=$this->orders_model->where($where)->limit($page->firstRow . ',' . $page->listRows)->order('createtime desc')->select();
        $this->assign("page", $page->show('Admin'));
        $this->assign("orders",$orders);
        $this->display('index');
    }

    public function fixed(){
//        $where['fix_status']=1;
        $where['order_status']=2;
        $count=$this->orders_model->where($where)->count();
        $page = $this->page($count, 10);
        $orders=$this->orders_model->where($where)->limit($page->firstRow . ',' . $page->listRows)->order('createtime desc')->select();
        $this->assign("page", $page->show('Admin'));
        $this->assign("orders",$orders);
        $this->display('index');
    }
//
//    /**
//     *  添加
//     */
//    public function add() {
//        import("Tree");
//        $tree = new \Tree();
//        $campus=$this->campus_model->select();
//        $str = "<option value='\$id' \$selected>\$spacer \$title</option>";
//        $tree->init($campus);
//        $select_campus = $tree->get_tree(0, $str);
//        $this->assign("select_campus",$select_campus);
//        $this->display();
//    }
//
//    /**
//     *  添加
//     */
//    public function add_post() {
//        if (IS_POST) {
//            if ($this->building_model->create()) {
//                if ($this->building_model->add()) {
//                    $this->success("添加成功！", U("building/index"));
//                } else {
//                    $this->error("添加失败！");
//                }
//            } else {
//                $this->error($this->building_model->getError());
//            }
//        }
//    }
//
//    /**
//     * 编辑
//     */
//    public function edit(){
//        import("Tree");
//        $tree = new \Tree();
//        $id= intval(I("get.id"));
//        $data=$this->building_model->where("id=$id")->find();
//        $result = $this->campus_model->select();
//        foreach ($result as $r) {
//            $r['selected'] = $r['id'] == $data['campus_id'] ? 'selected' : '';
//            $array[] = $r;
//        }
//        $str = "<option value='\$id' \$selected>\$spacer \$title</option>";
//        $tree->init($array);
//        $select_campus = $tree->get_tree(0, $str);
//        $this->assign("select_campus", $select_campus);
//        $this->assign($data);
//        $this->display();
//    }

//    /**
//     * 编辑
//     */
//    function edit_post(){
//        if (IS_POST) {
//            if ($this->building_model->create()) {
//                if ($this->building_model->save() !== false) {
//                    $this->success("保存成功！", U("building/index"));
//                } else {
//                    $this->error("保存失败！");
//                }
//            } else {
//                $this->error($this->building_model->getError());
//            }
//        }
//    }


    function delete(){
        $id = intval(I("get.id"));
        if ($this->orders_m->where("id=$id")->delete()!==false) {
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

    function orders_ok(){
        $id = intval(I("get.id"));
        $data['order_status'] = 1;
        $data['order_time'] = time();
        $data['user_id'] = get_current_admin_id();
        if ($this->orders_m->where("id=$id")->save($data)!==false) {
            $this->success("接单成功！");
        } else {
            $this->error("接单失败！");
        }
    }


    public function fix(){
        $id = intval(I("get.id"));
        $result=$this->orders_model->where("Orders.id=$id")->find();
        $this->assign($result);
        $this->display();
    }

    public function fix_save(){
        $id = intval(I("post.id"));
        $data['order_status'] = 2;
        $data['fix_time'] = time();
        $data['status'] = I('post.status');
        if ($this->orders_m->where("id=$id")->save($data)!==false) {
            $this->success("保存成功！", U("orders/fixed"));
        } else {
            $this->error("保存失败！");
        }
    }

    public function edit(){
        $id = intval(I("get.id"));
        $result=$this->orders_model->where("Orders.id=$id")->find();
        $this->assign($result);
        $this->display();
    }

    public function fix_edit(){
        $id = intval(I("post.id"));
        $data['status'] = I('post.status');
        if ($this->orders_m->where("id=$id")->save($data)!==false) {
            $this->success("保存成功！", U("orders/fixed"));
        } else {
            $this->error("保存失败！");
        }
    }

}