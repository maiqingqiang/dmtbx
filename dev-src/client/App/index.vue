<template>
  <div class="app-container">
    <transition name="slide-fade">
      <keep-alive>
        <router-view></router-view>
      </keep-alive>
    </transition>
  </div>
</template>

<style lang="sass">
  body {
    background: #fbf9fe;
  }

  .slide-fade-enter-active {
    transition: all .1s ease;
  }

  .slide-fade-leave-active {
    transition: all .1s cubic-bezier(1.0, 0.5, 0.8, 1.0);
  }

  .slide-fade-enter, .slide-fade-leave-active {
    margin-left: 100px;
    opacity: 0;
  }
</style>
