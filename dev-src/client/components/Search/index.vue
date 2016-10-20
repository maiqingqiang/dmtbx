<template>
  <div class="search">
    <mt-field label="姓名" placeholder="请输入姓名" v-model.trim="name"></mt-field>
    <mt-field label="手机号码" placeholder="请输入手机号码" v-model.trim="phone"></mt-field>
    <div style="padding: 15px">
      <mt-button size="large" type="primary" @click.native="search()">查询</mt-button>
    </div>
    <div class="search-list">
      <ul class="page-infinite-list">
        <!--<mt-cell v-for="item in list" :title="time_filter(item.createtime)" :label="item.description" :to="/dmt/client/html/details/19" is-link></mt-cell>-->
        <mt-cell v-for="item in list" :title="time_filter(item.createtime)" :label="item.description" :to="{ name: 'details', params: { id: item.id }}" is-link></mt-cell>
      </ul>
    </div>
  </div>
  </div>
</template>

<script>
  import axios from 'axios';
  import querystring from 'querystring';
  import {Toast,Indicator} from 'mint-ui';
  import Api from '../../api/config';

  function add0(m) {
    return m < 10 ? '0' + m : m
  }

  export default {
    data() {
      return {
        name: '',
        phone: '',
        list: []
      }
    },
    methods: {
      search(){
        let self = this;
        let params = querystring.stringify({
          name: self.name,
          phone: self.phone
        });
        Indicator.open({
          text: '查询中...',
          spinnerType: 'fading-circle'
        });
        axios.post(Api.API_GET_SEARCH, params)
          .then(function (response) {
            Indicator.close();
            if (response.data.code==200){
              self.list = response.data.data;
            }else {
              Toast({
                message: '没有找到~~',
                iconClass: 'iconfont icon-shibai',
                duration: 3000
              });
            }
          })
          .catch(function (error) {
            Indicator.close();
            Toast({
              message: '网络错误',
              iconClass: 'iconfont icon-shibai',
              duration: 3000
            });
            console.log(error);
          });
      },
      time_filter(value){
        var time = new Date(value * 1000);
        var y = time.getFullYear();
        var m = time.getMonth() + 1;
        var d = time.getDate();
        var h = time.getHours();
        var mm = time.getMinutes();
        var s = time.getSeconds();
        return y + '-' + add0(m) + '-' + add0(d) + ' ' + add0(h) + ':' + add0(mm) + ':' + add0(s);
      }
    }
  }
</script>

<style>
  .search-list {
    background-color: #ffffff;
  }

  ul {
    list-style: none outside none;
    padding-left: 0px;
  }

  .page-infinite-listitem {
    height: 50px;
    line-height: 50px;
  }

  .page-infinite-listitem:first-child {
    border-top: 1px solid #eee;
  }

  .page-infinite-desc, .page-infinite-listitem {
    text-align: center;
    border-bottom: 1px solid #eee;
  }

  .mint-cell {
    text-decoration: none;
  }

  .mint-cell-title {
    width: 100%;
  }

  .mint-cell-label {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 80%;
  }
</style>
