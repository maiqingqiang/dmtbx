import baseURL from 'src/config.js';

require('isomorphic-fetch');

const defaultOptions = {
  credentials: 'include',
};

const isNeedLogin = (res) => {
  if (res.code === 2) {
    location.replace(`${baseURL}login?url=${encodeURIComponent(location.href)}`);
  }
};

export default (method, url, params) => {
  switch (method) {
    case 'get':
      defaultOptions.method = 'get';
      if (params) {
        url += '?' + Object.keys(params).map(v => v + '=' + params[v]).join('&');
      }
      return fetch(baseURL + url, defaultOptions)
      .then(res => res.json())
      .then(data => {
        isNeedLogin(data);
        return data;
      });
    case 'post':
      const formData = new FormData();
      Object.keys(params).forEach(v => {
        formData.append(v, params[v]);
      });
      defaultOptions.method = 'post';
      defaultOptions.body = formData;
      return fetch(baseURL + url, defaultOptions)
      .then(res => res.json())
      .then(data => {
        isNeedLogin(data);
        return data;
      });
    default:
      return 'unexpected method';
  }
};
