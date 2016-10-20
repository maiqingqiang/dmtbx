<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/9/22 0022
 * Time: 23:34
 */

namespace Multimedia\Model;
use Think\Model\RelationModel;

class BuildingModel extends RelationModel{
    protected $_link=array(
        'campus'=>array(
            'mapping_type'=>self::BELONGS_TO,
            'foreign_key'=>'campus_id',
            'as_fields'=>'title:campus_title'
        )
    );
}