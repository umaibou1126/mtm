import Vue from 'vue'
import Vuex from 'vuex'
//import router from '../router/router.js'
//import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        likeNumber: 0
    },
    getters: {
        count: state => state.likeNumber + 1
    },
    mutations: {
        increment(state, number) {
            state.likeNumber += number;
        }
    }
});
