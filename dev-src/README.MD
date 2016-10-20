# vue2-template-webapp


## 技术栈

- vue2
- vue-router
- vuex
- Fetch
- mobi.css
- webpack2
- SCSS
- BEM

## 规范

- ESLint Airbnb ES6 base

- 尽量写上注释

- 保持mounted(){} 内代码清爽

- 请保持import from 的文件名和from后文件名大小写一致

## 组件维护方案

- components/ 全局公用组件 （为进一步全局组件库做准备），在main.js进行全局注册

- 业务组件 跟随页面组件，完成特定的业务 （暂且基本上一个页面会代表一个功能的情况下，可以这么做）

- 页面组件放 views/

- 抽离的组件内资源 如js文件， 放组件目录下,(组件为什么要用文件夹，而不是.vue来的简洁，考虑到文件夹可以包含更多文件来更好地整理组件内部内容，所以还是用文件夹方式来对应组件)

- 务必保障除页面组件之外组件的 纯度 （只使用 props 和 $emit），所有异步操作方页面组件中进行

- 组件都以文件夹形式存在 ，index.vue为入口

- 组件命名小驼峰，避开HTML本身标签名，组件引入后命名保持一致

- 在vue生命周期 `created() {}` 进行数据初始化， 如果涉及模板更新请使用 `mounted() {}` 进行初始化。

- 组件逻辑代码分离，使用`mixins`,首要分离`init.js`,即数据初始化代码

- 尽量避免使用 slot name ，如果需要请使用 props传递字符串模板后，用render function渲染，（vue2不支持同一个template中出现多个相同的slot name）

## SCSS方案

- 基于 mobi.css进行css初始化，仍然需要自行添加reset以及init

- 布局全用Flex布局

- 目前在scss index.scss中@import 应用所需要的样式，基于 reset.css (100px = 1rem),目标实现主题替换

- 组件中尽量不留存样式，交给style文件夹中统一管理，便于实现themes 主题切换

## 注意事项

- 自定义组件绑定原生DOM事件 如 `@click` 是无效的，需要通过自定义事件进行响应，在组件 `HeaderBar`的时候注意到了这一点，进行了修正。

- 推荐统一按照Vue生命周期排列实例函数
