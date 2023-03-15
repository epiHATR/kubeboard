import App from './App.vue'

import * as Vue from 'vue' // in Vue 3
import axios from 'axios'
import VueAxios from 'vue-axios'

axios.defaults.baseURL = "/api/v1"

const app = Vue.createApp(App)

app.use(VueAxios, axios)

app.mount('#app')
