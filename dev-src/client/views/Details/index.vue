<template>
  <div id="details">
    <mt-header fixed title="报修详情">
      <mt-button icon="back" slot="left" @click.native="toBack()">返回</mt-button>
    </mt-header>
    <div class="container">
      <div>
        <mt-cell title="姓名：" :value="list.name"></mt-cell>
        <mt-cell title="手机号码：" :value="list.phone"></mt-cell>
        <mt-cell title="校区：" :value="list.campus_title"></mt-cell>
        <mt-cell title="区域：" :value="list.building_title"></mt-cell>
        <mt-cell title="教室：" :value="list.room_number"></mt-cell>
        <mt-cell title="故障设备：" :value="list.device_title"></mt-cell>
        <mt-cell title="故障描述：" :value="list.description"></mt-cell>
        <mt-cell title="报修时间：" :value="time_filter(list.createtime)"></mt-cell>
      </div>
      <br>
      <div>
        <mt-cell title="状态：" :value="orders_status(list.order_status)"></mt-cell>
        <mt-cell title="接单时间：" :value="time_filter(list.order_time)"></mt-cell>
        <mt-cell title="维护人员：" :value="list.username"></mt-cell>
        <mt-cell title="维护情况：" :value="list.status"></mt-cell>
        <mt-cell title="处理时间：" :value="time_filter(list.fix_time)"></mt-cell>
      </div>
    </div>
  </div>
</template>

<script>
  import './index.scss';
  import querystring from 'querystring';
  import router from '../../router';
  import Api from '../../api/config';
  import axios from 'axios';

  function add0(m) {
    return m < 10 ? '0' + m : m
  }

  export default {
    data(){
      return{
        list:[]
      }
    },
    methods: {
      toBack(){
        router.go(-1);
      },
      time_filter(value){
        if (value == null || value == undefined || value == ''){
          return '';
        }else {
          var time = new Date(value * 1000);
          var y = time.getFullYear();
          var m = time.getMonth() + 1;
          var d = time.getDate();
          var h = time.getHours();
          var mm = time.getMinutes();
          var s = time.getSeconds();
          return y + '-' + add0(m) + '-' + add0(d) + ' ' + add0(h) + ':' + add0(mm) + ':' + add0(s);
        }
      },
      orders_status($id){
        switch ($id){
          case "0":
            return "未接单";
            break;
          case "1":
            return "未处理";
            break;
          case "2":
            return "已处理";
            break;
          default:
            return "无法显示正常状态"
        }
      }
    },
    beforeCreate(){
      let self =this;
      let params = querystring.stringify({
        id: self.$route.params.id,
      });
      axios.post(Api.API_GET_DETAILS, params)
        .then(function (response) {
          self.list=response.data.data;
          console.log(response.data.data);
        })
        .catch(function (error) {
          console.log(error);
        });
    }
  }
</script>
