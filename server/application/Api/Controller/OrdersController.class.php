<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/10/17
 * Time: 13:35
 */

namespace Api\Controller;

class OrdersController extends CommonController {

    protected $order_model;
    protected $order_m;

    function _initialize() {
        $this->order_model =D("Common/Orders");
        $this->order_m =D("Orders");
    }

    public function search(){
        if (IS_POST){
            $now_month=mktime(0, 0 , 0,date("m"),1,date("Y"));
            $next_month=mktime(23,59,59,date("m"),date("t"),date("Y"));
            $where['name']=I('post.name');
            $where['phone']=I('post.phone');
            $where['createtime']=array(array('egt',$now_month),array('elt',$next_month));

            $result=$this->order_model->where($where)->field('id,description,createtime')->order('createtime desc')->select();
//            $result=$this->order_model->field('id,description,createtime')->order('createtime desc')->select();
            if ($result){
                $this->return_ajax(200,'查询成功',$result);
            }else{
                $this->return_ajax(400,'查询失败');
            }
        }else{
            $this->return_ajax(500,'error');
        }
    }

    public function te(){
        $now_month=mktime(0, 0 , 0,date("m"),1,date("Y"));
        $next_month=mktime(23,59,59,date("m"),date("t"),date("Y"));

//            $where['name']=I('post.name');
//            $where['phone']=I('post.phone');
        $where['createtime']=array(array('egt',$now_month),array('elt',$next_month));

        $result=$this->order_model->where($where)->field('id,description,createtime')->select();
        dump($result);
    }

    public function save(){
        if (IS_POST){
            $data['name']=I('post.name');
            $data['phone']=I('post.phone');
            $data['campus_id']=I('post.campus_id');
            $data['building_id']=I('post.building_id');
            $data['room_number']=I('post.room_number');
            $data['device_id']=I('post.device_id');
            $data['description']=I('post.description');
            $data['createtime']=time();
            $result=$this->order_model->add($data);
            if ($result){
                $this->return_ajax(200,'提交成功');
            }else{
                $this->return_ajax(400,'提交失败');
            }
        }else{
            $this->return_ajax(500,'error');
        }
    }

    function return_ajax($code,$message,$data=null){
        if ($data==null){
            $this->ajaxReturn(array('code'=>$code,'message'=>$message));
        }else{
            $this->ajaxReturn(array('code'=>$code,'message'=>$message,'data'=>$data));
        }
    }

    public function details(){
        $id = intval(I("id"));
        $result=$this->order_m->where('Orders.id='.$id)->find();
        if ($result){
            $this->return_ajax(200,'提交成功',$result);
        }else{
            $this->return_ajax(400,'提交失败');
        }
    }

}