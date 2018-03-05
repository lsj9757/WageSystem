<?php
header("content-type:text/html;charset=utf-8");
require_once("./connect.php");
$employeeNo=$_POST['employeeNo'];
$bonusDate=$_POST['bonusDate'];
$bonusAmount=$_POST['bonusAmount'];
$bonusDescription=$_POST['bonusDescription'];
$deductDate=$_POST['deductDate'];
$deductAmount=$_POST['deductAmount'];
$deductDescription=$_POST['deductDescription'];
$holidaystartDate=$_POST['holidaystartDate'];
$holidayendDate=$_POST['holidayendDate'];
$routingNumber=$_POST['routingNumber'];
$accountType=$_POST['accountType'];
$bankName=$_POST['bankName'];
$bankAddress=$_POST['bankAddress'];
$payTypeDescription=$_POST['payTypeDescription'];
$payDate=$_POST['payDate'];
$checkNumber=$_POST['checkNumber'];
$payAmount=$_POST['payAmount'];
$sickstartDate=$_POST['sickstartDate'];
$sickendDate=$_POST['sickendDate'];
$reason=$_POST['reason'];
$bonusTypeNo=$_POST['bonusTypeNo'];
$deductTypeNo=$_POST['deductTypeNo'];
$payTypeNo=$_POST['payTypeNo'];
$payNo=$_POST['payNo'];


mysqli_query($conn,"SET NAMES UTF8");
$pre="SELECT * FROM employee WHERE employeeNo='$employeeNo'";
$res=mysqli_query($conn,$pre);
$row=mysqli_fetch_assoc($res);
if($employeeNo == $row['employeeNo']){
	$sql[0]="UPDATE employee SET salary = '$payAmount' WHERE employeeNo = '$employeeNo'";
	$sql[1]="INSERT INTO bonustype (bonusTypeNo,bonusDescription) VALUES ('$bonusTypeNo','$bonusDescription')";
	$sql[2]="INSERT INTO deducttype (deductTypeNo,deductDescription) VALUES ('$deductTypeNo','$deductDescription')";
	$sql[3]="INSERT INTO holiday (employeeNo,startDate,endDate) VALUES ('$employeeNo','$holidaystartDate','$holidayendDate')";
	$sql[4]="INSERT INTO paytype (payTypeNo,payTypeDescription) VALUES ('$payTypeNo','$payTypeDescription')";
	$sql[5]="INSERT INTO payhistory (payNo,employeeNo,payDate,checkNumber,payAmount) VALUES ('$payNo','$employeeNo','$payDate','$checkNumber','$payAmount')";
	$sql[6]="INSERT INTO sickleave (employeeNo,startDate,endDate,reason) VALUES ('$employeeNo','$sickstartDate','$sickendDate','$reason')";
	$sql[7]="INSERT INTO bonus (employeeNo,bonusDate,bonusAmount,bonusTypeNo) VALUES ('$employeeNo','$bonusDate','$bonusAmount','$bonusTypeNo')";
	$sql[8]="INSERT INTO deduction (employeeNo,deductDate,deductAmount,deductTypeNo) VALUES ('$employeeNo','$deductDate','$deductAmount','$deductTypeNo')";
	$sql[9]="INSERT INTO paydetails (employeeNo,startDate,routingNumber,accountType,bankName,bankAddress,payTypeNo) VALUES ('$employeeNo','$payDate','$routingNumber','$accountType','$bankName','$bankAddress','$payTypeNo')";
	$bool = true;

	for($i=0; $i<count($sql); $i++){
		if(!mysqli_query($conn, $sql[$i])){
			$bool = false;
		}
	}

	if($bool){
		echo json_encode("录入工资成功");
	}else{
		echo json_encode("操作失败");
	}

}else{
	echo json_encode("未找到该雇员！");
}