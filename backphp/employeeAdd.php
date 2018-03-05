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
$sql0="SELECT * FROM employee WHERE employeeNo='$employeeNo'";
$res=mysqli_query($conn,$sql0);
$row=mysqli_fetch_assoc($res);
if($employeeNo != $row['employeeNo']){
	$sql="INSERT INTO employee (employeeNo, title,firstName,middleName,lastName,address,workTelExt,homeTelNo,empEmailAddress,socialSecurityNumber,DOB,position,sex,dateStarted) VALUES ('$employeeNo', '$title','$firstName','$middleName','$lastName','$address','$workTelExt','$homeTelNo','$empEmailAddress','$socialSecurityNumber','$DOB','$position','$sex','$dateStarted')";
	if(mysqli_query($conn,$sql)){
		echo json_encode(1);
	}else{
		echo json_encode(0);
	}
}else{
	echo json_encode(2);
}
?>