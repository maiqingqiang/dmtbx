<?php
/**
 * Created by PhpStorm.
 * User: xiaom
 * Date: 2016/10/17
 * Time: 17:44
 */

namespace Common\Model;
use Common\Model\CommonModel;
class DeviceModel extends CommonModel {

    //自动验证
    protected $_validate = array(
        //array(验证字段,验证规则,错误提示,验证条件,附加规则,验证时间)
        array('title', 'require', '故障设备名称不能为空！', 1, 'regex', CommonModel:: MODEL_BOTH ),
    );

    protected function _before_write(&$data) {
        parent::_before_write($data);
    }

}