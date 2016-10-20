const express = require('express');
const path = require('path');
const app = express();
const compression = require('compression');

app.use(compression());
app.use(express.static(path.resolve('./')));
app.get('/', function (req, res) {
  res.sendfile(path.resolve('./dist/html/index.html'));
});

var server = app.listen(10000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('app listening at http://%s:%s', host, port);
});
