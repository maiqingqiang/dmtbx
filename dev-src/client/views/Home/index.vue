<template>
  <div id="index">
    <div class="page-tabbar">
      <div class="page-wrap">
        <mt-tab-container class="page-tabbar-container" v-model="selected">
          <mt-tab-container-item id="Home-i">
            <div class="page-title">多媒体教室报修</div>
            <index></index>
          </mt-tab-container-item>

          <mt-tab-container-item id="Home-s">
            <div class="page-title">查询报修详情</div>
            <search></search>
          </mt-tab-container-item>
        </mt-tab-container>
      </div>

      <mt-tabbar v-model="selected" fixed>
        <mt-tab-item id="Home-i">
          <i class="tab-iconfont iconfont icon-home3 "></i>
          首页
        </mt-tab-item>
        <mt-tab-item id="Home-s">
          <i class="tab-iconfont iconfont icon-searchlist "></i>
          查询
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>

<style lang="sass">
  .tab-iconfont {
    display: block;
    font-size: 1.5rem;
    margin-bottom: 5px;
  }

  .page-tabbar {
    overflow: hidden;
  }

  .page-wrap {
    overflow: auto;
    height: 100%;
    padding-bottom: 100px;
  }

  .page-title {
    font-size: 20px;
    margin: 20px auto;
    text-align: center;
    display: block;
    line-height: 1;
    color: #26a2ff;
  }
</style>

<script>

  import 'mint-ui/lib/style.css';
  import Index from '../../components/Index/index';
  import Search from '../../components/Search/index';

  export default {
    data() {
      return {
        selected: 'Home-i'
      };
    },
    components: {
      Index,
      Search
    }
  }
</script>
