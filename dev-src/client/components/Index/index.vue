<template>
  <div class="index">
    <mt-field label="姓名" placeholder="请输入姓名" v-model.trim="name"></mt-field>
    <mt-field label="手机号码" placeholder="请输入手机号码" v-model.trim="phone"></mt-field>
    <mt-field label="区域" @click.native="popupVisible1 = true" placeholder="请选择区域" readonly="true"
              v-model="building_name"></mt-field>
    <mt-field label="故障教室" @click.native="selectRoom(status)" placeholder="请选择故障教室" readonly="true"
              v-model="room"></mt-field>
    <mt-field label="故障设备" @click.native="popupVisible3 = true" placeholder="请选择故障设备" readonly="true"
              v-model="device_name"></mt-field>
    <mt-field label="故障描述" placeholder="请填写故障简要描述" type="textarea" rows="4" v-model.trim="description"></mt-field>
    <div style="padding: 15px">
      <mt-button size="large" type="primary" @click.native="save()">提交报修</mt-button>
    </div>
    <mt-popup v-model="popupVisible1" position="bottom" class="mint-popup">
      <mt-picker :slots="buildingSlots" @change="onBuildingChange" :visible-item-count="5"
                 :show-toolbar="true">
        <span class="mint-datetime-action mint-datetime-cancel" @click="cancelBuildingChange()">取消</span>
        <span class="mint-datetime-action mint-datetime-confirm" @click="popupVisible1 = false">确定</span>
      </mt-picker>
    </mt-popup>
    <mt-popup v-model="popupVisible2" position="bottom" class="mint-popup">
      <mt-picker :slots="room_number" @change="onRoomNumberChange" :visible-item-count="5"
                 :show-toolbar="true">
        <span class="mint-datetime-action mint-datetime-cancel" @click="cancelRoomNumberChange()">取消</span>
        <span class="mint-datetime-action mint-datetime-confirm" @click="popupVisible2 = false">确定</span>
      </mt-picker>
    </mt-popup>
    <mt-popup v-model="popupVisible3" position="bottom" class="mint-popup">
      <mt-picker :slots="deviceSlots" @change="onDeviceChange" :visible-item-count="5"
                 :show-toolbar="true">
        <span class="mint-datetime-action mint-datetime-cancel" @click="cancelDeviceChange()">取消</span>
        <span class="mint-datetime-action mint-datetime-confirm" @click="popupVisible3 = false">确定</span>
      </mt-picker>
    </mt-popup>
  </div>

</template>

<script>

  import axios from 'axios';
  import querystring from 'querystring';
  import {Toast,Indicator} from 'mint-ui';
  import Api from '../../api/config';

  export default {
    data() {
      return {
        name: '',
        phone: '',
        description: '',
        popupVisible1: false,
        popupVisible2: false,
        popupVisible3: false,
        buttonBottom: 0,
        campus: {},
        campus_id: '',
        building: [],
        building_name: '',
        building_id: '',
        room: '',
        device: '',
        device_name: '',
        device_id: '',
        status: false,
        buildingSlots: [
          {
            flex: 1,
            values: [],
            className: 'slot1',
            textAlign: 'right',
          }, {
            divider: true,
            content: '-',
            className: 'slot2'
          }, {
            flex: 1,
            values: [],
            className: 'slot3',
            textAlign: 'left'
          }
        ],
        room_number: [
          {
            flex: 1,
            values: [],
            className: 'slot4',
            textAlign: 'center'
          }
        ],
        deviceSlots: [
          {
            flex: 1,
            values: [],
            className: 'slot5',
            textAlign: 'center'
          }
        ]
      };
    },
    beforeCreate() {
      var self = this;
      axios.get(Api.API_GET_CAMPUS)
        .then(function (response) {
          if (response.data.code == 200) {
            self.campus = response.data.data;
            self.buildingSlots[0]['values'] = Object.keys(response.data.data);
            self.buildingSlots[0]['values'].unshift('');
          }
        })
        .catch(function (error) {
          console.log(error);
        });

      axios.get(Api.API_GET_DEVICE)
        .then(function (response) {
          if (response.data.code == 200) {
            self.device = response.data.data;
            self.deviceSlots[0]['values'] = Object.keys(response.data.data);
            self.deviceSlots[0]['values'].unshift('');
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    methods: {
      onBuildingChange(picker, values){
        var self = this;
        self.campus_name = values[0];
        self.campus_id = self.campus[values[0]];
        self.building_name = values[1];
      },
      cancelBuildingChange(){
        var self = this;
        self.popupVisible1 = false;
        self.building_name = '';
      },
      onRoomNumberChange(picker, values){
        var self = this;
        self.room = values[0];
      },
      cancelRoomNumberChange(){
        var self = this;
        self.popupVisible2 = false;
        self.room = '';
      },
      onDeviceChange(picker, values){
        var self = this;
        self.device_name = values[0];
        self.device_id=self.device[values[0]];
      },
      cancelDeviceChange(){
        var self = this;
        self.popupVisible3 = false;
        self.device_name = '';
      },
      selectRoom(status){
        var self = this;
        if (status) {
          self.popupVisible2 = true;
        } else {
          Toast({
            message: '请先选择【区域】',
            position: 'bottom',
            duration: 3000
          });
        }
      },
      save(){
        var self = this;
        if (self.name == null || self.name == undefined || self.name == '') {
          Toast({
            message: '请输入姓名',
            position: 'bottom',
            duration: 3000
          });
          return false;
        }

        if (self.phone == null || self.phone == undefined || self.phone == '') {
          Toast({
            message: '请输入手机号码',
            position: 'bottom',
            duration: 3000
          });
          return false;
        }


        var reg = /^1[0-9]{10}$/; //验证规则

        if (!reg.test(self.phone)) {
          Toast({
            message: '手机号码不正确',
            position: 'bottom',
            duration: 3000
          });
          return false;
        }

        if (self.building_id == null || self.building_id == undefined || self.building_id == '') {
          Toast({
            message: '选择区域',
            position: 'bottom',
            duration: 3000
          });
          return false;
        }

        if (self.room == null || self.room == undefined || self.room == '') {
          Toast({
            message: '选择故障教室',
            position: 'bottom',
            duration: 3000
          });
          return false;
        }

        if (self.device_id == null || self.device_id == undefined || self.device_id == '') {
          Toast({
            message: '选择故障设备',
            position: 'bottom',
            duration: 3000
          });
          return false;
        }

        if (self.description == null || self.description == undefined || self.description == '') {
          Toast({
            message: '请输入故障描述',
            position: 'bottom',
            duration: 3000
          });
          return false;
        }

        var params = querystring.stringify({
          name: self.name,
          phone: self.phone,
          campus_id: self.campus_id,
          building_id: self.building_id,
          room_number: self.room,
          device_id: self.device_id,
          description: self.description,
        });
        Indicator.open({
          text: '提交中...',
          spinnerType: 'fading-circle'
        });
        axios.post(Api.API_SAVE, params)
          .then(function (response) {
            Indicator.close();
            if (response.data.code == 200) {
              self.name = '';
              self.phone = '';
              self.room = '';
              self.device_id = '';
              self.description = '';
              self.status = false;
              Toast({
                message: response.data.message,
                iconClass: 'iconfont icon-xiaolian',
                duration: 3000
              });
            } else {
              Toast({
                message: '提交失败',
                iconClass: 'iconfont icon-shibai',
                duration: 3000
              });
            }
          })
          .catch(function (error) {
            Indicator.close();
            Toast({
              message: '提交失败',
              iconClass: 'iconfont icon-shibai',
              duration: 3000
            });
            console.log(error);
          });
      }
    },
    watch: {
      campus_id: function (newCampus_id) {
        var self = this;

        let params = querystring.stringify({
          campus_id: newCampus_id
        });

        axios.post(Api.API_GET_BUILDING, params)
          .then(function (response) {
            self.buildingSlots[2]['values'] = [];
            if (response.data.code == 200) {
              self.building = response.data.data;
              self.buildingSlots[2]['values'] = Object.keys(response.data.data);
              self.buildingSlots[2]['values'].unshift('');
            }
          })
          .catch(function (error) {
            console.log(error);
          });
      },
      building_name: function (newBuildingName) {
        var self = this;
        if (newBuildingName == null || newBuildingName == undefined || newBuildingName == '') {
          self.status = false;
          self.room_number[0]['values'] = []
        } else {
          self.status = true;
          self.building_id = self.building[newBuildingName]['id'];
          self.room_number[0]['values'] = JSON.parse(self.building[newBuildingName]['room_number']||'[]');
          self.room_number[0]['values'].unshift('');
        }
      }
    }
  }
</script>

<style>

  .mint-popup {
    width: 100%;
  }

  .picker-slot-wrapper, .picker-item {
    backface-visibility: hidden;
    text-align: center;
  }

  .mint-cell-value {
    padding-right: 20px;
  }

</style>
