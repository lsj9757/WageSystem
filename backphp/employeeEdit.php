<?php
header("content-type:text/html;charset=utf-8");
require_once("./connect.php");
$employeeNo=$_POST['employeeNo'];
$title=$_POST['title'];
$firstName=$_POST['firstName'];
$middleName=$_POST['middleName'];
$lastName=$_POST['lastName'];
$address=$_POST['address'];
$workTelExt=$_POST['workTelExt'];
$homeTelNo=$_POST['homeTelNo'];
$empEmailAddress=$_POST['empEmailAddress'];
$socialSecurityNumber=$_POST['socialSecurityNumber'];
$DOB=$_POST['DOB'];
$position=$_POST['position'];
$sex=$_POST['sex'];
$dateStarted=$_POST['dateStarted'];

mysqli_query($conn,"SET NAMES UTF8");
$sql="UPDATE employee SET title = '$title',firstName = '$firstName', middleName = '$middleName', lastName = '$lastName', address = '$address', workTelExt = '$workTelExt', homeTelNo = '$homeTelNo', empEmailAddress = '$empEmailAddress', socialSecurityNumber = '$socialSecurityNumber', DOB = '$DOB', position = '$position', sex = '$sex', dateStarted = '$dateStarted' WHERE employeeNo = '$employeeNo'";
if(mysqli_query($conn,$sql)){
	echo json_encode("修改成功");
}else{
	echo json_encode("操作失败");
}
?>