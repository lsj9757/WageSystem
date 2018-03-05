<template>
  <div id="app">
    <div class="header">
      <img class="nav_back" src="./assets/house.png">
      <div class="nav_content">
        <div class="nav_left"><img src="./assets/logo.png"></div>
        <div class="nav_right"><span class="nav_chi">{{ band }}</span><br><span class="nav_eng">{{ eband }}</span></div>
      </div>
    </div>
    <div class="content">
      <div class="con_left">
        <router-link :to="{name:'employeeadd', params: { id:false}}">雇员资料录入</router-link>
        <router-link :to="{name:'employee'}">雇员资料查看</router-link>
        <router-link :to="{name:'wageadd'}">工资资料录入</router-link>
        <router-link :to="{name:'wagehistory'}">历史工资查看</router-link>
      </div>
      <div class="con_right">
        <router-view></router-view>
      </div>
    </div>
    <div class="footer">
      <span>龟龟，这么真实吗</span>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
     return {
        band:"工资管理",
        eband:"Wage management"
     }
  }
}
</script>

<style lang="less">
  @import '../static/cssReset.css';
      html,body{
        width: 100%;
        height: 100%;
      }
      #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        width: 100%;
        height:100%;
        min-width: 856px;
        min-height: 768px;
      }
      .header{
        width: 100%;
        height: 100px;
        display: flex;
        background-color: rgb(25, 170, 141);
        box-shadow:0px 7px 10px #897c7c;
        margin-bottom: 15px;
        border-radius: 0 0 7px 7px;
        .nav_back{
          margin-top: 0px;
          position:fixed;
          top:0px;
          height: 100px;
          width: 100%;
        }
        .nav_content{
          width: 25%;
          height: 100px;
          display: flex;
          margin:auto;
          flex-direction:row;
          justify-content:space-around;
          .nav_left,.nav_right{
            width: 35%;
            display: flex;
            justify-content:center;
            align-items:center;
          }
          .nav_right{
            width: 65%;
            color:#fff;
            display: flex;
            flex-direction:column;
            .nav_chi{
              font-size: 32px;
            }
            .nav_eng{
              font-size: 16px;
            }
          }
        }
      }
      .content{
        width: 100%;
        height:90%;
        display: flex;
        flex-direction:row;
        .con_left{
          display: flex;
          flex-direction:column;
          width: 20%;
          height: 95%;
          max-height: 900px;
          background-color: rgb(35, 54, 70);
          max-width: 310px;
          box-shadow:10px 0px 10px #897c7c;
          padding-top: 20px;
          border-radius: 7px 7px 7px 7px;
          a{
            color:#fff;
            height: 70px;
            width: 100%;
            display: flex;
            justify-content:center;
            align-items:center;
            text-decoration: none;
            font-size: 1.2em;
          }
          a:hover{
            background-color: rgb(79, 94, 107);
            font-size: 1.4em;
          }
        }
        .con_right{
          width: 80%;
          padding-top: 20px;
          justify-content:center;
          display: flex;
        }
      }
      .footer{
        width: 100%;
        min-height: 50px;
        position: fixed;
        bottom: 0px;
        z-index: 10px;
        filter:alpha(opacity=30);
        background:rgba(6,6,11,0.3);
        color: #fff;
        text-align: center;
        line-height: 40px;
      }
</style>
