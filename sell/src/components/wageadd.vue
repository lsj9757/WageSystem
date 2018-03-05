<template>
  <div class="content">
    <div class="wageform">
      <el-form ref="wageform" :model="wageform" label-width="80px" style="width: 90%;"  status-icon :rules="rules">
        <el-form-item label="雇员选择" prop="employeeNo">
          <el-select v-model="wageform.employeeNo" placeholder="请选择一个雇员进行录入" style="width:35%;">
            <el-option v-for="item in namedata" :label="item.name" :value="item.employeeNo"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="奖金日期">
          <el-col :span="8">
            <el-form-item prop="bonusDate">
              <el-date-picker type="date" placeholder="选择日期" v-model="wageform.bonusDate" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="奖金金额" prop="bonusAmount">
              <el-input v-model="wageform.bonusAmount"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="奖金说明" prop="bonusDescription">
          <el-input type="textarea" v-model="wageform.bonusDescription"></el-input>
        </el-form-item>
        <el-form-item label="扣除日期">
          <el-col :span="8">
            <el-form-item prop="deductDate">
              <el-date-picker type="date" placeholder="选择日期" v-model="wageform.deductDate" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="扣除金额" prop="deductAmount">
              <el-input v-model="wageform.deductAmount"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="扣除说明" prop="deductDescription">
          <el-input type="textarea" v-model="wageform.deductDescription"></el-input>
        </el-form-item>
        <el-form-item label="假期时间">
          <el-col :span="8">
            <el-form-item prop="holidaystartDate">
              <el-date-picker type="date" placeholder="开始日期" v-model="wageform.holidaystartDate" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col class="line" :span="1" style="text-align: center;" >-</el-col>
          <el-col :span="8">
            <el-form-item prop="holidayendDate">
              <el-date-picker type="date" placeholder="结束日期" v-model="wageform.holidayendDate" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="病假时间">
          <el-col :span="8">
            <el-form-item prop="sickstartDate">
              <el-date-picker type="date" placeholder="开始日期" v-model="wageform.sickstartDate" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col class="line" :span="1" style="text-align: center;" >-</el-col>
          <el-col :span="8">
            <el-form-item prop="sickendDate">
              <el-date-picker type="date" placeholder="结束日期" v-model="wageform.sickendDate" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="病假原因" prop="reason">
          <el-input type="textarea" v-model="wageform.reason"></el-input>
        </el-form-item>
        <el-form-item label="汇款编码">
          <el-col :span="8">
            <el-form-item prop="routingNumber">
              <el-input v-model="wageform.routingNumber"placeholder="Routing Transit Number(9位)"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="帐户类型" prop="accountType">
              <el-input v-model="wageform.accountType"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="银行名">
          <el-col :span="8">
            <el-form-item prop="bankName">
              <el-input v-model="wageform.bankName" placeholder=""></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="银行地址" prop="bankAddress">
              <el-input v-model="wageform.bankAddress"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="验证编码">
          <el-col :span="8">
            <el-form-item prop="checkNumber">
              <el-input v-model="wageform.checkNumber" placeholder="Check Number(4位)"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="10">
            <el-form-item  label="支付日期" prop="payDate">
              <el-date-picker type="date" placeholder="选择日期" v-model="wageform.payDate" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="支付说明"  prop="payTypeDescription">
          <el-input type="textarea" v-model="wageform.payTypeDescription"  placeholder="综合之前的信息填写最终的结果"></el-input>
        </el-form-item>
        <el-form-item label="最终工资" prop="payAmount">
          <el-col :span="10">
           <el-input v-model="wageform.payAmount"></el-input>
         </el-col>
       </el-form-item>
       <el-form-item>
        <el-button type="primary"  @click="submitForm('wageform')">确定录入</el-button>
        <el-button @click="resetForm('wageform')">取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</div>
</template>

<script>
  import qs from 'qs'
export default {
  name: 'wageadd',
  data () {
     var routingNumber = (rule, value, callback) => {
       var reg = new RegExp("^[0-9]{9}$");
        if (!reg.test(value)) {
          callback(new Error('请输入9位汇款编码'));
        } else {
          callback();
        }
      };
      var checkNumber = (rule, value, callback) => {
       var reg = new RegExp("^[0-9]{4}$");
        if (!reg.test(value)) {
          callback(new Error('请输入4位验证编码'));
        } else {
          callback();
        }
      };
      var BeNumber = (rule, value, callback) => {
        if(!value){
          callback("不能为空");
        }else{
         var reg = new RegExp(/^\d+$|^\d+\.\d+$/g);
         if (!reg.test(value)) {
          callback(new Error('必须为数字值'));
        } else {
          callback();
        }
      }
    };
      var BeContent = (rule, value, callback) => {
        if(!value){
          callback("不能为空");
        }else {
          callback();
        }
      };
    return {
      namedata: [],bonusTypeNo:'',deductTypeNo:'',payTypeNo:'',payNo:'',
      wageform: {
        employeeNo:'',
        bonusDate:'',bonusAmount:'',bonusDescription:'',deductDate:'',deductAmount:'',deductDescription:'',
        holidaystartDate:'',holidayendDate:'',
        routingNumber:'',accountType:'',bankName:'',bankAddress:'',payTypeDescription:'',
        payDate:'',checkNumber:'',payAmount:'',
        sickstartDate:'',sickendDate:'',reason:''
      },
      rules: {
        employeeNo:[{ validator: BeContent}],
        routingNumber: [{validator: routingNumber}],
        checkNumber: [{ validator: checkNumber}],
        payAmount: [{ validator: BeNumber}],
        bonusAmount: [{ validator: BeNumber}],
        deductAmount: [{ validator: BeNumber}],
        bonusDate: [{ validator: BeContent}],
        deductDate: [{ validator: BeContent}],
        payDate: [{ validator: BeContent}],
        deductDescription: [{ validator: BeContent}],
        bonusDescription: [{ validator: BeContent}],
        holidaystartDate: [{ validator: BeContent}],
        holidayendDate: [{ validator: BeContent}],
        bankName: [{ validator: BeContent}],
        accountType: [{ validator: BeContent}],
        bankAddress: [{ validator: BeContent}],
        payTypeDescription: [{ validator: BeContent}],
        sickstartDate: [{ validator: BeContent}],
        sickendDate: [{ validator: BeContent}],
        reason: [{ validator: BeContent}],
      }
    }
  },
  methods: {
    getname (name) {
      this.namedata.push({
        name:name.firstName+"·"+name.middleName+"·"+name.lastName,
        employeeNo:name.employeeNo
      })
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.getanyNo();
          this.$axios.post('http://139.199.2.100/backphp/wageAdd.php', qs.stringify({
            bonusTypeNo:this.bonusTypeNo,
            deductTypeNo:this.deductTypeNo,
            payTypeNo:this.payTypeNo,
            payNo:this.payNo,
            employeeNo:this.wageform.employeeNo,
            bonusDate:this.getdate(this.wageform.bonusDate),
            bonusAmount:this.wageform.bonusAmount,
            bonusDescription:this.wageform.bonusDescription,
            deductDate:this.getdate(this.wageform.deductDate),
            deductAmount:this.wageform.deductAmount,
            deductDescription:this.wageform.deductDescription,
            holidaystartDate:this.getdate(this.wageform.holidaystartDate),
            holidayendDate: this.getdate(this.wageform.holidayendDate),
            routingNumber:this.wageform.routingNumber,
            accountType:this.wageform.accountType,
            bankName:this.wageform.bankName,
            bankAddress:this.wageform.bankAddress,
            payTypeDescription:this.wageform.payTypeDescription,
            payDate:this.getdate(this.wageform.payDate),
            checkNumber:this.wageform.checkNumber,
            payAmount:this.wageform.payAmount,
            sickstartDate:this.getdate(this.wageform.sickstartDate),
            sickendDate:this.getdate(this.wageform.sickendDate),
            reason:this.wageform.reason,
          })).then((res) => {
           alert(res.data);
           this.$router.push({name:'wagehistory'});
         }).catch((err) => {
          console.log(err);})
       } else {
        alert ("又不按格式来啊");
        return false;
      }
    });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    getdate (ti) {
      var d = new Date(ti);  
      var STdate=d.getFullYear() + '-' + this.add0(d.getMonth() + 1) + '-' + this.add0(d.getDate()); 
      return STdate;
    },
    add0 (time) {
      if(time<10) time = '0'+time; 
      return time;
    },
    getanyNo () {
      this.bonusTypeNo = 'b'+this.wageform.employeeNo;
      this.deductTypeNo = 'd'+this.wageform.employeeNo;
      this.payTypeNo = 'p'+this.wageform.employeeNo;
      this.payNo = 'pN'+this.wageform.employeeNo;
    }
  },
  mounted () {
        this.$axios.post('http://139.199.2.100/backphp/getEmployee.php').then((res) => {
           for(let i=0;i<res.data.length;i++){
            this.getname(res.data[i])          
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
    width: 80%;
    height: 89%;
    background-color: rgb(243, 243, 243);
    box-shadow:0px 7px 20px 5px #897c7c; 
    max-height: 800px;
    }
    .wageform{
      flex-direction:row;
      justify-content:space-around;
      display: flex;
      width: 100%;
      padding-top: 40px;
      overflow:auto;
    }

</style>
