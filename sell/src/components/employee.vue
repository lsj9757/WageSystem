<template>
  <div class="content">
    <div class="search">
     <el-form ref="searchdata" :model="searchdata" label-width="80px" size="mini">
       <el-form-item label="搜索类型">
        <el-col :span="6">
          <el-form-item prop="type">
           <el-select v-model="searchdata.type" placeholder="请选择搜索类型">
            <el-option label="雇员编号" value="1"></el-option>
            <el-option label="职位" value="2"></el-option>
            <el-option label="大于输入工资" value="3"></el-option>
            <el-option label="小于输入工资" value="4"></el-option>
            <el-option label="性别" value="5" ></el-option>
          </el-select>
        </el-form-item>
      </el-col>
      <el-col :span="9">
        <el-form-item  label="搜索内容" prop="content">
          <el-input v-model="searchdata.content"></el-input>
        </el-form-item>
      </el-col>
      <el-col :span="1" style="text-align: center;">=></el-col>
      <el-col :span="7">
        <el-form-item>
          <el-button  size="mini" type="primary"  @click="search('searchdata')">搜索</el-button>
          <el-button  size="mini" type="warning"  @click="reset()">重置</el-button>
        </el-form-item>
      </el-col>
    </el-form-item>
  </el-form>
  </div> 
  <el-table :data="employeedata"style="width: 100%;"stripe 
  max-height="800px" height="600px" border empty-text="暂无数据">
  <el-table-column align="center" header-align="center"prop="employeeNo"label="雇员编号"width="110" sortable>  
  </el-table-column>
  <el-table-column label="操作" width="180" align="center" header-align="center">
      <template slot-scope="scope">
        <el-button size="mini"><router-link style="text-decoration: none;color:rgb(25, 170, 141)" :to="{name:'employeeadd', params: { id:scope.row.employeeNo }}">
        编辑</router-link></el-button>
        <el-button size="mini" type="danger" @click="employeeDelete(scope.row.employeeNo)">删除</el-button>
      </template>
    </el-table-column>
    <el-table-column align="center" header-align="center" prop="name"label="姓名" width="150">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="title"label="职位"width="100">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="address"label="家庭住址"width="210" show-overflow-tooltip>
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="salary"label="工资"width="130" cell-click >
    <template slot-scope="scope">
       <el-popover trigger="hover" placement="left">
          <span><router-link style="text-decoration: none;color:rgb(25, 170, 141)" :to="{name:'wage', params: { id:scope.row.employeeNo,status:scope.row.status }}">工资资料查看</router-link></span>
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.salary }}</el-tag>
          </div>
        </el-popover>
    </template>
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="dateStarted"label="工作开始日期"width="120">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="workTelExt"label="工作电话"width="120">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="homeTelNo"label="家庭电话"width="120">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="empEmailAddress"label="Email地址"width="180">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="socialSecurityNumber"label="社会安全号码"width="120">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="DOB"label="出生日期"width="120">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="position"label="出生地点"width="210">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="sex"label="性别"width="120">
    </el-table-column>

  </el-table>
  </div>
</template>

<script>
import qs from 'qs'
export default {
  name: 'employee',
  data() {
      return {
        employeedata:[],bonusTypeNo:'',deductTypeNo:'',payTypeNo:'',payNo:'',searchdata:{}
      }
    },
  methods: {   
    getdata (data) {
      this.employeedata.push({
          employeeNo:data.employeeNo,
          title:data.title,
          name:data.firstName+"·"+data.middleName+"·"+data.lastName,
          address:data.address,
          workTelExt:data.workTelExt,
          homeTelNo:data.homeTelNo,
          empEmailAddress:data.empEmailAddress,
          socialSecurityNumber:data.socialSecurityNumber,
          DOB:data.DOB,
          position:data.position,
          sex:data.sex,
          salary:this.getsalary(data.salary),
          dateStarted:data.dateStarted,
          status:this.getstatus(data.salary)
        });
    },
    getstatus (el) {
      if(el==0){return false}else{return true}
    },
    getsalary (el) {
      if(el==0){return "未录入"}else{return el}
    },
    getanyNo (id) {
      this.bonusTypeNo = 'b'+id;
      this.deductTypeNo = 'd'+id;
      this.payTypeNo = 'p'+id;
      this.payNo = 'pN'+id;
    },
    employeeDelete (id) {
      this.getanyNo(id),
      this.$axios.post('http://139.199.2.100/backphp/employeeDel.php',qs.stringify({
            employeeNo:id,
            bonusTypeNo:this.bonusTypeNo,
            deductTypeNo:this.deductTypeNo,
            payTypeNo:this.payTypeNo,
            payNo: this.payNo,
          })).then((res) => {
          alert(res.data);
          this.Refresh();
       }).catch((err) => {
        console.log(err);})
    },
    search (formName) {
      this.$axios.post('http://139.199.2.100/backphp/search1.php',qs.stringify({
        search:this.searchdata
      })).then((res) => {
        if(res.data!=null){
          this.employeedata=[];
          for(let i=0;i<res.data.length;i++){
            this.getdata(res.data[i])         
          }
        }else{
          alert("搜索值不存在噢");
        }
       }).catch((err) => {
        console.log(err);})
    },
    reset () {
      this.$axios.post('http://139.199.2.100/backphp/employeeShow.php').then((res) => {
          this.employeedata=[];
          this.searchdata={};
          for(let i=0;i<res.data.length;i++){
            this.getdata(res.data[i])         
          }
       }).catch((err) => {
        console.log(err);})
    },
    Refresh () {
      this.employeedata=[];
      this.$axios.post('http://139.199.2.100/backphp/employeeShow.php').then((res) => {
       for(let i=0;i<res.data.length;i++){
        this.getdata(res.data[i])         
      }
    }).catch((err) => {
      console.log(err);})
    }
  },
  mounted () {
        this.$axios.post('http://139.199.2.100/backphp/employeeShow.php').then((res) => {
           for(let i=0;i<res.data.length;i++){
            this.getdata(res.data[i])         
           }
       }).catch((err) => {
        console.log(err);})
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="less" scoped>
  .content{
    display: flex;
    justify-content:center;
    flex-direction:column;
    width: 80%;
    height: 89%;
    padding: 0 2% 2% 2%;
    box-sizing: border-box;
    max-height: 800px;
    box-shadow:0px 7px 20px 5px #897c7c; 
    .search{
      height: 8%;
      width: 100%;
      padding: 10px;
      display: flex;
      flex-direction:row;
      margin:0 auto;
      justify-content:center;
      box-sizing: border-box;
    }
  }

</style>
