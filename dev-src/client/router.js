import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from 'views/Home/index.vue';
import Details from 'views/Details/index.vue';

Vue.use(VueRouter);
/*
 const Home = r =>
 const Details = r => require.ensure([], () => r(require('views/Details')), 'details');*/
// const Home = resolve => require(['./views/Home/index.vue'], resolve);
// const Details = resolve => require(['./views/Details/index.vue'], resolve);

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/dmt/client/html/',
      component: Home
    },
    {
      path: '/dmt/client/html/details/:id',
      name: 'details',
      component: Details,
    },
    // {
    //   path: '/',
    //   component: function (r) {
    //     require.ensure([], () => r(require('views/Home')), 'home');
    //   },
    // },
    // {
    //   path: '/details',
    //   component: function (r) {
    //     require.ensure([], () => r(require('views/Details')), 'details');
    //   },
    // },
  ],
});
