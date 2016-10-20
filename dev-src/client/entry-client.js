import { app } from './main';

require('es6-promise').polyfill();

// prime the store with server-initialized state.
// the state is determined during SSR and inlined in the page markup.
// store.replaceState(window.__INITIAL_STATE__);

app.$mount('#app');
