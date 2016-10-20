var ExtractTextPlugin = require('extract-text-webpack-plugin');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var webpack = require('webpack');
var merge = require('webpack-merge');
var dev = require('./webpack.dev');
var path = require('path');
var CompressionWebpackPlugin = require('compression-webpack-plugin');

module.exports = merge(dev, {
  output: {
    path: path.resolve(__dirname, '../../client'),
    filename: 'js/app.[hash].js',
    chunkFilename: 'js/[id].[chunkhash].js',
    publicPath: '../',
  },
  // 可以在这里配置对应的输出CDN路径如 http://localhost:8080/
});

if (process.env.NODE_ENV === 'prod') {
  module.exports.devtool = false;
  module.exports.plugins = [
    new ExtractTextPlugin({
      filename: 'css/app.[contenthash].css',
      allChunks: true,
    }),
    new webpack.LoaderOptionsPlugin({
      minimize: true,
    }),
    // 抽离公共js
    new webpack.optimize.CommonsChunkPlugin({
      name: 'vendor',
      filename: 'js/vendor_vue.js',
    }),
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: true,
      },
      output: {
        comments: false,
      },
      sourceMap: false,
    }),
    new webpack.optimize.OccurrenceOrderPlugin(),
    // 自动注入 html
    new HtmlWebpackPlugin({
      filename: 'html/index.html',
      template: path.resolve(__dirname, '../client/index.html'),
    }),
    // Gzip
    new CompressionWebpackPlugin({
      asset: "[path].gz[query]",
      algorithm: 'gzip',
      test: /\.js$|\.css$|\.html$/,
      threshold: 10240,
      minRatio: 0.8,
    }),
  ];
}
