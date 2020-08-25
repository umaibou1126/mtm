import Vue from 'vue'
import Vuex from 'vuex'
import router from '../router/router.js'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        signedIn: 'false'
    },
    mutations: {
        fetchSignedIn(state) {
            state.signedIn = !!localStorage.signedIn
        },
    },
    actions: {
        doFetchSignedIn({ commit }) {
            commit('fetchSignedIn')
        }
    }
})
