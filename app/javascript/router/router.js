import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from 'Index.vue'
import Signup from 'Signup.vue'
import Signin from 'Signin.vue'

Vue.use(VueRouter)

const routes = [
    { path: '/', name: 'Index', component: Index },
    { path: '/signup', name: 'Signup', component: Signup },
    { path: '/signin', name: 'Signin', component: Signin }
];
export default new VueRouter({ routes });
