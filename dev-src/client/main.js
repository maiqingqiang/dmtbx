import Vue from 'vue';
import FastClick from 'fastclick';
import { sync } from 'vuex-router-sync';
import 'normalize.css';
import 'mint-ui/lib/style.css';
import Mint from 'mint-ui';
Vue.use(Mint);

import App from './App';
import store from './store';
import router from './router';

sync(store, router);
FastClick.attach(document.body);

const app = new Vue({
  router,
  store,
  ...App,
});

export { app, router, store };
