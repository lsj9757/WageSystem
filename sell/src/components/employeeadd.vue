<template>
  <div class="content">
    <div class="employeeform" v-if="id">
      <div class="form_two">
        <div class="label">该雇员编号：{{employeeNo}}</div>
        <input type="text" v-model="firstName" placeholder="首名">
        <span class="err"></span>
        <input type="text" v-model="middleName" placeholder="中名">
        <span class="err"></span>
        <input type="text" v-model="lastName" placeholder="姓">
        <span class="err"></span>
        <input type="text" v-model="address" placeholder="家庭住址">
        <span class="err"></span>     
        <input type="text" v-model="workTelExt" placeholder="工作电话(11位)">
        <span class="err">{{ workTelExterr.errtext }}</span>
        <input type="text" v-model="homeTelNo" placeholder="家庭电话(11位)">
        <span class="err">{{ homeTelNoerr.errtext }}</span>
      </div>
      <div class="form_two">
        <input type="text" v-model="title" placeholder="职位">
        <span class="err"></span>       
        <input type="text" v-model="empEmailAddress" placeholder="Email地址">
        <span class="err">{{ empEmailAddresserr.errtext }}</span>
        <input type="text" v-model="socialSecurityNumber" placeholder="社会安全号码(9位)">
        <span class="err">{{ socialSecurityNumbererr.errtext }}</span>
        <div class="box">
          <div class="block">
            <el-date-picker v-model="DOB"type="date"placeholder="出生日期"format="yyyy 年 MM 月 dd 日"
            value-format="yyyy-MM-dd" style="width:100%;">
          </el-date-picker>
        </div>
      </div>
      <span class="err"></span>
        <input type="text" v-model="position" placeholder="出生地点">
        <span class="err"></span>
        <div class="box" >
          <el-radio border v-model="sex" label="男">男</el-radio>
          <el-radio border v-model="sex" label="女">女</el-radio>
        </div>
        <span class="err"></span>
        <div class="box">
          <div class="block">
            <el-date-picker v-model="dateStarted"type="date"placeholder="工作开始日期"format="yyyy 年 MM 月 dd 日"
            value-format="yyyy-MM-dd" style="width:100%;">
          </el-date-picker>
        </div>
      </div>
        <button type="button" @click="Edit()" style="margin-top:10px">确定修改</button>
      </div>
    </div>
    <div class="employeeform" v-else>
      <div class="form_two">
        <input type="text" v-model="employeeNo" placeholder="雇员编号(4位)">
        <span class="err">{{ employeeNoerr.errtext }}</span>
        <input type="text" v-model="firstName" placeholder="首名">
        <span class="err"></span>
        <input type="text" v-model="middleName" placeholder="中名">
        <span class="err"></span>
        <input type="text" v-model="lastName" placeholder="姓">
        <span class="err"></span>
        <input type="text" v-model="address" placeholder="家庭住址">
        <span class="err"></span>     
        <input type="text" v-model="workTelExt" placeholder="工作电话(11位)">
        <span class="err">{{ workTelExterr.errtext }}</span>
        <input type="text" v-model="homeTelNo" placeholder="家庭电话(11位)">
        <span class="err">{{ homeTelNoerr.errtext }}</span>
      </div>
      <div class="form_two">
        <input type="text" v-model="title" placeholder="职位">
        <span class="err"></span>       
        <input type="text" v-model="empEmailAddress" placeholder="Email地址">
        <span class="err">{{ empEmailAddresserr.errtext }}</span>
        <input type="text" v-model="socialSecurityNumber" placeholder="社会安全号码(9位)">
        <span class="err">{{ socialSecurityNumbererr.errtext }}</span>
        <div class="box">
          <div class="block">
            <el-date-picker v-model="DOB"type="date"placeholder="出生日期"format="yyyy 年 MM 月 dd 日"
            value-format="yyyy-MM-dd" style="width:100%;">
          </el-date-picker>
        </div>
      </div>
      <span class="err"></span>
        <input type="text" v-model="position" placeholder="出生地点">
        <span class="err"></span>
        <div class="box" >
          <el-radio border v-model="sex" label="男">男</el-radio>
          <el-radio border v-model="sex" label="女">女</el-radio>
        </div>
        <span class="err"></span>
        <div class="box">
          <div class="block">
            <el-date-picker v-model="dateStarted"type="date"placeholder="工作开始日期"format="yyyy 年 MM 月 dd 日"
            value-format="yyyy-MM-dd" style="width:100%;">
          </el-date-picker>
        </div>
      </div>
        <button type="button" @click="go()" style="margin-top:10px">确定录入</button>
      </div>
    </div>
  </div>
</template>

<script type="text/javascript">
  import qs from 'qs'
  export default {
    name: 'employeeadd',
    data () {
      return {
        employeeNo: '',title: '',
        firstName:'',middleName:'',lastName:'',address:'',
        workTelExt:'',homeTelNo:'',empEmailAddress:'',socialSecurityNumber:'',
        DOB:'',position:'',sex:'',dateStarted:'',
        errtext:'',status:'',id:this.$route.params.id
      }
    },
    computed:{
      employeeNoerr () {
        let errtext,status;
        var reg = new RegExp("^[0-9]{4}$");
        if(!reg.test(this.employeeNo)){
          status = false
          errtext = "不是4位编号"
          if(!this.employeeNoflag){
            errtext = ""
            this.employeeNoflag = true
          }         
        }else{
          status = true
          errtext = ""
        }
        return{
          status,errtext
        }
      },
      empEmailAddresserr () {
        let errtext,status;
        var reg = new RegExp("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+");
        if(!reg.test(this.empEmailAddress)){
          status = false
          errtext = "不是正确的邮箱格式"
          if(!this.empEmailAddressflag){
            errtext = ""
            this.empEmailAddressflag = true
          }         
        }else{
          status = true
          errtext = ""
        }
        return{
          status,errtext
        }
      },
      workTelExterr () {
        let errtext,status;
        var reg = new RegExp("^[0-9]{11}$");
        if(!reg.test(this.workTelExt)){
          status = false
          errtext = "不是11位号码"
          if(!this.workTelExtflag){
            errtext = ""
            this.workTelExtflag = true
          }         
        }else{
          status = true
          errtext = ""
        }
        return{
          status,errtext
        }
      },
      homeTelNoerr () {
        let errtext,status;
        var reg = new RegExp("^[0-9]{11}$");
        if(!reg.test(this.homeTelNo)){
          status = false
          errtext = "不是11位号码"
          if(!this.homeTelNoflag){
            errtext = ""
            this.homeTelNoflag = true
          }         
        }else{
          status = true
          errtext = ""
        }
        return{
          status,errtext
        }
      },
      socialSecurityNumbererr () {
        let errtext,status;
        var reg = new RegExp("^[0-9]{9}$");
        if(!reg.test(this.socialSecurityNumber)){
          status = false
          errtext = "不是9位数字"
          if(!this.socialSecurityNumberflag){
            errtext = ""
            this.socialSecurityNumberflag = true
          }         
        }else{
          status = true
          errtext = ""
        }
        return{
          status,errtext
        }
      }
    },
    methods:{
      go:function(){
       var qs = require('qs');
       if(!this.employeeNoerr.status||!this.empEmailAddresserr.status||!this.workTelExterr.status||!this.homeTelNoerr.status
        ||!this.socialSecurityNumbererr.status||!this.DOB||!this.dateStarted||!this.sex||!this.title||!this.firstName||!this.middleName||!this.lastName||!this.address||!this.position){
        alert("老铁别不按规矩来啊")
      }else{
        this.$axios.post('http://139.199.2.100/backphp/employeeAdd.php', qs.stringify({
            employeeNo:this.employeeNo,
            title:this.title,
            firstName:this.firstName,
            middleName:this.middleName,
            lastName: this.lastName,
            address: this.address,
            workTelExt:this.workTelExt,
            homeTelNo:this.homeTelNo,
            empEmailAddress: this.empEmailAddress,
            socialSecurityNumber: this.socialSecurityNumber,
            DOB:this.DOB,
            position: this.position,
            sex:this.sex,
            dateStarted:this.dateStarted,
          })).then((res) => {
             if(res.data==1){
              alert("录入成功");
              this.$router.push({name:'employee'});
            }
            if(res.data==2){
              alert("该雇员已录入");
            }
            if(res.data==0){
              alert("操作失败");
            }        
       }).catch((err) => {
        console.log(err);})
      }
    },
    putdata (data) {
      this.employeeNo=data.employeeNo,
      this.title=data.title,
      this.firstName=data.firstName,
      this.middleName=data.middleName,
      this.lastName=data.lastName,
      this.address=data.address,
      this.workTelExt=data.workTelExt,
      this.homeTelNo=data.homeTelNo,
      this.empEmailAddress=data.empEmailAddress,
      this.socialSecurityNumber=data.socialSecurityNumber,
      this.DOB=data.DOB,
      this.position=data.position,
      this.sex=data.sex,
      this.dateStarted=data.dateStarted
    },
    Edit () {
      var qs = require('qs');
       if(!this.empEmailAddresserr.status||!this.workTelExterr.status||!this.homeTelNoerr.status
        ||!this.socialSecurityNumbererr.status||!this.DOB||!this.dateStarted||!this.sex||!this.title||!this.firstName||!this.middleName||!this.lastName||!this.address||!this.position){
        alert("老铁别不按规矩来啊")
      }else{
        this.$axios.post('http://139.199.2.100/backphp/employeeEdit.php', qs.stringify({
            employeeNo:this.employeeNo,
            title:this.title,
            firstName:this.firstName,
            middleName:this.middleName,
            lastName: this.lastName,
            address: this.address,
            workTelExt:this.workTelExt,
            homeTelNo:this.homeTelNo,
            empEmailAddress: this.empEmailAddress,
            socialSecurityNumber: this.socialSecurityNumber,
            DOB:this.DOB,
            position: this.position,
            sex:this.sex,
            dateStarted:this.dateStarted,
          })).then((res) => {
         alert(res.data);
         this.$router.push({name:'employee'});
       }).catch((err) => {
        console.log(err);})
      }
    }
  },
   mounted () {
    if(this.id!=false){
        this.$axios.post('http://139.199.2.100/backphp/getEmployee.php',qs.stringify({
            employeeNo:this.id})).then((res) => {
          this.putdata(res.data)
       }).catch((err) => {
        console.log(err);})
     }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="less" scoped>
  .content{
    display: flex;
    width: 80%;
    height: 89%;
    max-height: 800px;
    background-color: rgb(243, 243, 243);
    box-shadow:0px 7px 20px 5px #897c7c; 
    .employeeform{
      flex-direction:row;
      justify-content:space-around;
      display: flex;
      width: 100%;
      margin-top: 20px;
      .form_two{
        display: flex;
        width: 50%;
        flex-direction:column;
        align-items:center;
        margin-top: 15px;
        .box{
          width: 60%;
          min-width: 200px;
        }
        input{
          width: 60%;
          min-width: 200px;
          height: 40px;  
          border-radius: 4px;
          padding: 0 15px;
          font-size: inherit;
          border: 1px solid #d8dce5;
          box-sizing: border-box;
          line-height: 1;
        } 
        button{
          border-style: none;
          height: 40px;
          width: 100px;
          background:  rgb(25, 170, 141);
          color: #fff;
          font-size: 1em;
          border-radius: 4px;
        }
        .err{
          width: 50%;
          text-overflow:ellipsis;
          overflow: hidden;
          margin:5px;
          height: 25px;
          font-size: 14px;
          color: red;
          line-height: 20px;
        }
        .label{
          width: 60%;
          min-width: 200px;
          margin-top: 20px;
          padding: 0 15px;
          height: 50px;  
          font-size: inherit;
          box-sizing: border-box; 
          line-height: 1;
        }
      }
    }
  }
</style>
 