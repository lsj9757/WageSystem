<template>
  <div class="content">
    <div class="search">
     <el-form ref="searchdata" :model="searchdata" label-width="80px" size="mini">
       <el-form-item label="搜索类型">
        <el-col :span="6">
          <el-form-item prop="type">
           <el-select v-model="searchdata.type" placeholder="请选择搜索类型">
            <el-option label="雇员编号" value="1"></el-option>
            <el-option label="帐户类型" value="2"></el-option>
            <el-option label="大于输入工资" value="3"></el-option>
            <el-option label="小于输入工资" value="4"></el-option>
            <el-option label="输入的支付日期之后" value="5"></el-option>
          </el-select>
        </el-form-item>
      </el-col>
      <el-col :span="9">
        <el-form-item  label="搜索内容" prop="content">
        <el-date-picker v-model="searchdata.content"type="date"placeholder="支付日期"
            value-format="yyyy-MM-dd" style="width:100%;" v-if="dateshow">
          </el-date-picker>                              
          <el-input v-model="searchdata.content" v-else="dateshow"></el-input>
        </el-form-item>
      </el-col>
      <el-col :span="1" style="text-align: center;" >=></el-col>
      <el-col :span="7">
        <el-form-item>
          <el-button  size="mini" type="primary"  @click="search('searchdata')">搜索</el-button>
          <el-button  size="mini" type="warning"  @click="reset()">重置</el-button>
        </el-form-item>
      </el-col>
    </el-form-item>
  </el-form>
  </div> 
    <el-table :data="wagehistorydata"style="width: 100%;"stripe 
     max-height="800px" height="600px" border empty-text="暂无数据">
    <el-table-column align="center" header-align="center"prop="employeeNo"label="雇员编号"width="130" sortable >  
    </el-table-column>
    <el-table-column align="center" header-align="center" prop="name"label="姓名" width="170">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="payDate"label="支付日期"width="120" show-overflow-tooltip>
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="payAmount"label="工资"width="170" cell-click >
    <template slot-scope="scope">
       <el-popover trigger="hover" placement="left">
          <span><router-link style="text-decoration: none;color:rgb(25, 170, 141)" :to="{name:'wage', params: { id:scope.row.employeeNo,status:scope.row.status }}">工资资料查看</router-link></span>
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.payAmount }}</el-tag>
          </div>
        </el-popover>
    </template>
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="routingNumber"label="汇款编码"width="120">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="accountType"label="帐户类型"width="130">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="bankName"label="银行名"width="160">
    </el-table-column>
    <el-table-column align="center" header-align="center"prop="bankAddress"label="银行地址"width="230">
    </el-table-column>
  </el-table>
  </div>
</template>

<script>
import qs from 'qs'
export default {
  name: 'wagehistory',
  data() {
      return {
        wagehistorydata:[],searchdata:{},dateshow:false
      }
    },
  methods: {   
    getdata (data) {
      this.wagehistorydata.push({
          employeeNo:data.employeeNo,
          name:data.firstName+"·"+data.middleName+"·"+data.lastName,
          payDate:data.payDate,
          checkNumber:data.checkNumber,
          payAmount:data.payAmount,
          routingNumber:data.routingNumber,
          accountType:data.accountType,
          bankName:data.bankName,
          bankAddress:data.bankAddress,
          status:true
        });
    },
    search (formName) {
      this.$axios.post('http://139.199.2.100/backphp/search2.php',qs.stringify({
        search:this.searchdata
      })).then((res) => {
        if(res.data!=null){
          this.wagehistorydata=[];
          for(let i=0;i<res.data.length;i++){
            this.getdata(res.data[i])         
          }
        }else{
          alert("搜索值还是不存在噢");
        }
       }).catch((err) => {
        console.log(err);})
    },
    reset () {
      this.$axios.post('http://139.199.2.100/backphp/wagehistoryShow.php').then((res) => {
          this.wagehistorydata=[];
          this.searchdata={};
          for(let i=0;i<res.data.length;i++){
            this.getdata(res.data[i])         
          }
       }).catch((err) => {
        console.log(err);})
    },
    res () {
      console.log(222);
    }
  },
  mounted () {
    this.$axios.post('http://139.199.2.100/backphp/wagehistoryShow.php').then((res) => {
      for(let i=0;i<res.data.length;i++){
        this.getdata(res.data[i])         
      }
    }).catch((err) => {
      console.log(err);})
  },
  watch:{
    sdType:function(val,oldval){
      if(val==5){
        this.dateshow=!this.dateshow;
      }else{
        this.dateshow=false;           
      }
    }
  },
  computed: {
    sdType(){
      return this.searchdata.type;
    }
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
