<?php
header("content-type:text/html;charset=utf-8");
require_once("./connect.php");
mysqli_query($conn,"SET NAMES UTF8");
if(!$_POST['employeeNo']){
	$sql="SELECT employeeNo,firstName,middleName,lastName FROM  employee WHERE salary='0' ORDER BY employeeNo ASC";
	$res=mysqli_query($conn,$sql);
	while($row=mysqli_fetch_assoc($res)){
		$rows[]=$row;
	}
	echo json_encode($rows);
}else{
	$employeeNo=$_POST['employeeNo'];
	$sql="SELECT * FROM  employee WHERE employeeNo='$employeeNo' ORDER BY employeeNo ASC";
	$res=mysqli_query($conn,$sql);
	$rows=mysqli_fetch_assoc($res);
	echo json_encode($rows);
}
?>