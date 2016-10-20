<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/10/19
 * Time: 19:48
 */

namespace Api\Model;
use Think\Model\RelationModel;
use Think\Model\ViewModel;

class OrdersModel extends ViewModel {

    public $viewFields=array(
        'Orders'=>array('*','_type'=>'LEFT'),
        'Building'=>array('title'=>'building_title','_on'=>'Orders.building_id=Building.id','_type'=>'LEFT'),
        'Campus'=>array('title'=>'campus_title','_on'=>'Building.campus_id=Campus.id','_type'=>'LEFT'),
        'device'=>array('title'=>'device_title','_on'=>'Orders.device_id=device.id','_type'=>'LEFT'),
        'Users'=>array('user_login'=>'username','_on'=>'Orders.user_id=Users.id','_type'=>'LEFT'),
    );

//    protected $_link=array(
//        'campus'=>array(
//            'mapping_type'=>self::BELONGS_TO,
//            'foreign_key'=>'campus_id',
//            'as_fields'=>'title:campus_title'
//        ),
//        'building'=>array(
//            'mapping_type'=>self::BELONGS_TO,
//            'foreign_key'=>'building_id',
//            'as_fields'=>'title:building_title'
//        ),
//        'device'=>array(
//            'mapping_type'=>self::BELONGS_TO,
//            'foreign_key'=>'device_id',
//            'as_fields'=>'title:device_title'
//        ),
//        'users'=>array(
//            'mapping_type'=>self::BELONGS_TO,
//            'foreign_key'=>'user_id',
//            'as_fields'=>'user_login:username'
//        ),
//    );
}