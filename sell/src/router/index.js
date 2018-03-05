import Vue from 'vue'
import Router from 'vue-router'
import Resource from 'vue-resource'
import $ from 'jquery'
import wage from '@/components/wage'
import employeeadd from '@/components/employeeadd'
import employee from '@/components/employee'
import wageadd from '@/components/wageadd'
import wagehistory from '@/components/wagehistory'
import axios from 'axios'
import qs from 'qs'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'

Vue.prototype.$axios=axios

Vue.use(Router)
Vue.use(ElementUI)
Vue.use(Resource)

export default new Router({
  routes: [
    {
      path: '/employee',
      name: 'employee',
      component: employee
    },
    {
      path: '/wagehistory',
      name: 'wagehistory',
      component: wagehistory
    },
    {
      path: '/employeeadd/:id',
      name: 'employeeadd',
      component: employeeadd
    },
    {
      path: '/wageadd',
      name: 'wageadd',
      component: wageadd
    },
    {
      path: '/wage/:id/:status',
      name: 'wage',
      component: wage
    }
  ]
})
