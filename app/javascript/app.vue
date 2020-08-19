<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from "vue";
import VueRouter from "vue-router";
import Index from "Index.vue";
import Detail from "Detail.vue";
import New from "New.vue";
import Edit from "Edit.vue";

const router = new VueRouter({
  routes: [
    { path: "/", component: Index },
    { path: "/menu/:id(\\d+)", name: "Detail", component: Detail },
    { path: "/menu/new", name: "New", component: New },
    { path: "/menu/:id(\\d+)/edit", name: "Edit", component: Edit }
  ]
});

Vue.use(VueRouter);
export default {
  router
};
</script>
