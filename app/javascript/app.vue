<template>
  <div id="app">
    <!-- <header>
      <h1 class="headline">
        <router-link to="/" class="link">Index</router-link>
      </h1>
      <nav id="gnav">
      <ul class="nav-list">
        <li class="nav-item">
          <router-link to="/" class="link">Index</router-link>
        </li>
        <li class="nav-list-item">
          <router-link to="/menu/new" class="link">New</router-link>
        </li>
      </ul>
      </nav>
    </header>-->
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
import Signup from "Signup.vue";
import Signin from "Signin.vue";

const router = new VueRouter({
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
