var path = require('path');
var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var autoprefixer = require('autoprefixer');

module.exports = {
  entry: {
    app: path.resolve(__dirname, '../client/entry-client.js'),
    vendor: [
      'vue',
      'vue-router',
      'vuex',
      'fastclick',
    ],
  },
  output: {
    path: path.resolve(__dirname, '../dist'),
    filename: '[name].js',
    publicPath: '',
  },
  resolve: {
    alias: {
      vue: 'vue/dist/vue.min.js',
      client: path.resolve(__dirname, '../client'),
      views: path.resolve(__dirname, '../client/views'),
      components: path.resolve(__dirname, '../client/components'),
      utils: path.resolve(__dirname, '../client/App/utils'),
    },
    extensions: ['.js', '.vue'],
  },
  module: {
    loaders: [
      {
        test: /\.vue$/,
        loader: 'vue',
      },
      {
        test: /\.js$/,
        loader: 'babel',
        exclude: /node_modules/,
      },
      {
        test: /\.(png|jpg|jpeg|gif)$/,
        loader: 'url?limit=10000&name=images/[name].[ext]',
      }, {
        test: /\.(woff|svg|ttf|eot)$/,
        loader: 'url?limit=10000&name=iconfont/[name].[ext]',
      }, {
        test: /\.json$/,
        loader: 'json',
      }, {
        test: /\.html$/,
        loader: 'html-loader',
      },
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract({
          fallbackLoader: 'style-loader',
          loader: 'css-loader',
        }),
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract({
          fallbackLoader: 'style-loader',
          loader: 'css-loader!sass-loader',
        }),
      },
    ],
  },
  plugins: [
    new webpack.LoaderOptionsPlugin({
      options: {
        eslint: {
          configFile: '.eslintrc',
        },
        vue: {
          loaders: {
            scss: 'style!css!sass',
          },
        },
        postcss: [
          autoprefixer({
            browsers: ['last 3 versions'],
          }),
        ],
      },
    }),
  ],
};

if (process.env.NODE_ENV === 'dev') {
  // 配置开发服务器
  module.exports.devServer = {
    historyApiFallback: true,
    hot: true,
    progress: false,
    colors: true,
    proxy: {},
  };
  module.exports.devtool = '#cheap-module-eval-source-map';

  module.exports.plugins = [
    // 抽离公共js
    new webpack.optimize.CommonsChunkPlugin({
      name: 'vendor',
      filename: 'vendor_vue.js',
    }),
    new ExtractTextPlugin({
      filename: 'app.css',
      allChunks: true,
    }),
    // 自动注入 html
    new HtmlWebpackPlugin({
      filename: 'index.html',
      template: path.resolve(__dirname, '../client/index.html'),
    }),
  ];
}
