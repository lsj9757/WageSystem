<template>
  <div class="content">
    <div class="wageform" v-if="status">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>{{wagedata.name}}</span>
        </div>
        <el-collapse >
          <el-collapse-item>
            <template slot="title">
              <div class="battle">奖金详情</div>
            </template>
            <div class="diss">奖金日期：{{ wagedata.bonusDate}}<br>
            奖金数量：{{ wagedata.bonusAmount}}<br>
            奖金说明：{{ wagedata.bonusDescription}}</div>
          </el-collapse-item>
          <el-collapse-item>
            <template slot="title">
              <div class="battle">扣除详情</div>
            </template>
            <div class="diss">扣除日期：{{ wagedata.deductDate}}<br>
            扣除数量：{{ wagedata.deductAmount}}<br>
            扣除说明：{{ wagedata.deductDescription}}</div>
          </el-collapse-item>
          <el-collapse-item>
            <template slot="title">
              <div class="battle">假期详情</div>
            </template>
           <div class="diss">开始日期：{{ wagedata.holidaystartDate}}<br>
            结束日期：{{ wagedata.holidayendDate}}</div>
          </el-collapse-item>
          <el-collapse-item>
            <template slot="title">
              <div class="battle">病假详情</div>
            </template>
            <div class="diss">开始日期：{{ wagedata.sickstartDate}}<br>
            结束日期：{{ wagedata.sickendDate}}<br>
            原因：{{ wagedata.reason}}</div>
          </el-collapse-item>
          <el-collapse-item>
            <template slot="title">
              <div class="battle">支付说明</div>
            </template>
            <div class="diss">支付日期：{{ wagedata.payDate}}<br>
            汇款编码：{{ wagedata.routingNumber}}<br>
            帐户类型：{{ wagedata.accountType}}<br>
            银行名：{{ wagedata.bankName}}<br>
            银行地址：{{ wagedata.bankAddress}}<br>
            验证编码：{{ wagedata.checkNumber}}<br>
            支付详情：{{ wagedata.payTypeDescription}}<br>
            最终工资：{{ wagedata.payAmount}}</div>
          </el-collapse-item>
        </el-collapse>
      </el-card>
    </div> 
    <div class="empty" v-else>
      <br><span>该雇员还未录入工资资料!</span><img src="../assets/sur.png"><img src="../assets/sur.png">
       <div class="empty_go">马上去录：<router-link :to="{name:'wageadd'}"><img src="../assets/go.png"></router-link></div>
    </div>
  </div>
</template>

<script>
import qs from 'qs'
export default {
  name: 'wage',
  data () {
    return {
      employeeid:this.$route.params.id,
      status:this.$route.params.status,
      bonusTypeNo:'',deductTypeNo:'',payTypeNo:'',payNo:'',
      wagedata:{}
    }
  },
  methods:{
    getanyNo () {
      this.bonusTypeNo = 'b'+this.employeeid;
      this.deductTypeNo = 'd'+this.employeeid;
      this.payTypeNo = 'p'+this.employeeid;
      this.payNo = 'pN'+this.employeeid;
    },
    getdata (data) {
      var obj={
            name:data.name.firstName+"·"+data.name.middleName+"·"+data.name.lastName,
            bonusDate:data.bonus.bonusDate,
            bonusAmount:data.bonus.bonusAmount,
            bonusDescription:data.bonustype.bonusDescription,
            deductDate:data.deduction.deductDate,
            deductAmount:data.deduction.deductAmount,
            deductDescription:data.deducttype.deductDescription,
            holidaystartDate:data.holiday.startDate,
            holidayendDate:data.holiday.endDate,
            routingNumber:data.paydetails.routingNumber,
            accountType:data.paydetails.accountType,
            bankName:data.paydetails.bankName,
            bankAddress:data.paydetails.bankAddress,
            payTypeDescription:data.paytype.payTypeDescription,
            payDate:data.payhistory.payDate,
            checkNumber:data.payhistory.checkNumber,
            payAmount:data.payhistory.payAmount,
            sickstartDate:data.sickleave.startDate,
            sickendDate:data.sickleave.endDate,
            reason:data.sickleave.reason,
          }
      this.wagedata=Object.assign(obj);
    },
  },
  mounted () {
        this.getanyNo();
        this.$axios.post('http://139.199.2.100/backphp/wageShow.php',qs.stringify({
            employeeNo:this.employeeid,
            bonusTypeNo:this.bonusTypeNo,
            deductTypeNo:this.deductTypeNo,
            payTypeNo:this.payTypeNo,
            payNo: this.payNo,
          })).then((res) => {
          this.getdata(res.data)
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
    width: 80%;
    height: 89%;
    max-height: 800px;
    background-color: rgb(243, 243, 243);
    box-shadow:0px 7px 20px 5px #897c7c; 
    }
    .empty{
      .empty_go{
        display: flex;
        align-items:center;
        justify-content:center;
        margin-top: 40px;
        color:rgb(25, 170, 141);   
      }
    }
    .wageform{
      width: 100%;
      display: flex;
      justify-content:center;
      align-items:center;
      .box-card{
        width: 85%;
        height: 95%;
        overflow:auto;
        .clearfix:before,.clearfix:after {
          display: table;
          content: "";
        }
        .clearfix:after {
          clear: both
        }
        .clearfix{
          font-size: 2em;
          display: flex;
          justify-content:center;
        }
        .battle{
          font-size: 1.3em;
          color:rgb(25, 170, 141);         
        }
      }
        
    }
</style>
