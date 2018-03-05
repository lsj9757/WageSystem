<?php
header("content-type:text/html;charset=utf-8");
require_once("./connect.php");
$employeeNo=$_POST['employeeNo'];
$bonusTypeNo=$_POST['bonusTypeNo'];
$deductTypeNo=$_POST['deductTypeNo'];
$payTypeNo=$_POST['payTypeNo'];
$payNo=$_POST['payNo'];

mysqli_query($conn,"SET NAMES UTF8");


$sql[0]="DELETE FROM sickleave WHERE employeeNo='$employeeNo' ";
$sql[1]="DELETE FROM holiday WHERE employeeNo='$employeeNo' ";
$sql[2]="DELETE FROM paydetails WHERE employeeNo='$employeeNo' ";
$sql[3]="DELETE FROM paytype WHERE payTypeNo='$payTypeNo' ";

$sql[4]="DELETE FROM payhistory WHERE payNo='$payNo' ";

$sql[5]="DELETE FROM bonus WHERE employeeNo='$employeeNo' ";
$sql[6]="DELETE FROM bonustype WHERE bonusTypeNo='$bonusTypeNo' ";
$sql[7]="DELETE FROM deduction WHERE employeeNo='$employeeNo' ";
$sql[8]="DELETE FROM deducttype WHERE deductTypeNo='$deductTypeNo' ";

$sql[9]="DELETE FROM employee WHERE employeeNo='$employeeNo' ";


$bool = true;
for($i=0; $i<count($sql); $i++){
	if(!mysqli_query($conn, $sql[$i])){
		$bool = false;
	}
}

if($bool){
	echo json_encode("删除成功");
}else{
	echo json_encode("操作失败");
}

?>