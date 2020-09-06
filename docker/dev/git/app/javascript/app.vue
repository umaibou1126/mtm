<template>
  <router-view></router-view>
</template>

<script>
import Vue from "vue";
import VueRouter from "vue-router";
import Index from "Index.vue";
import Detail from "Detail.vue";
import New from "New.vue";
import Edit from "Edit.vue";
import Signup from "Signup.vue";
import Signin from "Signin.vue";

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", name: "Index", component: Index },
    { path: "/menu/:id(\\d+)", name: "Detail", component: Detail },
    { path: "/menu/new", name: "New", component: New },
    { path: "/menu/:id(\\d+)/edit", name: "Edit", component: Edit },
    { path: "/signup", name: "Signup", component: Signup },
    { path: "/signin", name: "Signin", component: Signin }
  ]
});
Vue.use(VueRouter);
export default {
  router
};
</script>

<style scoped>
/* #gnav {
  background-color: gray;
}
#gnav ul {
  overflow: hidden;
}

#gnav li {
  float: left;
  width: 200px;
} */
</style>
