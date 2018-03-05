<?php
header("content-type:text/html;charset=utf-8");
require_once("./connect.php");

$type=$_POST['search']['type'];
$content=json_encode($_POST['search']['content'], JSON_UNESCAPED_UNICODE);

if($type==1){
	 mysqli_query($conn,"SET NAMES UTF8");

	$sql="SELECT * FROM employee,paydetails,payhistory WHERE employee.employeeNo=payhistory.employeeNo AND employee.employeeNo=paydetails.employeeNo AND paydetails.employeeNo=payhistory.employeeNo AND payhistory.employeeNo LIKE CONCAT('%',$content,'%') ORDER BY employee.employeeNo ASC";
	$res=mysqli_query($conn,$sql);
	while($row=mysqli_fetch_assoc($res)){
		$rows[]=$row;
	}
	echo json_encode($rows);
}elseif ($type==2) {
	mysqli_query($conn,"SET NAMES UTF8");

	$sql="SELECT * FROM employee,paydetails,payhistory WHERE employee.employeeNo=payhistory.employeeNo AND employee.employeeNo=paydetails.employeeNo AND paydetails.employeeNo=payhistory.employeeNo AND paydetails.accountType LIKE CONCAT('%',$content,'%') ORDER BY employee.employeeNo ASC";
	$res=mysqli_query($conn,$sql);
	while($row=mysqli_fetch_assoc($res)){
		$rows[]=$row;
	}
	echo json_encode($rows);
}elseif ($type==3) {
	mysqli_query($conn,"SET NAMES UTF8");

	$sql="SELECT * FROM employee,paydetails,payhistory WHERE employee.employeeNo=payhistory.employeeNo AND employee.employeeNo=paydetails.employeeNo AND paydetails.employeeNo=payhistory.employeeNo AND payhistory.payAmount>$content ORDER BY employee.employeeNo ASC";
	$res=mysqli_query($conn,$sql);
	while($row=mysqli_fetch_assoc($res)){
		$rows[]=$row;
	}
	echo json_encode($rows);
}elseif ($type==4) {
	mysqli_query($conn,"SET NAMES UTF8");

	$sql="SELECT * FROM employee,paydetails,payhistory WHERE employee.employeeNo=payhistory.employeeNo AND employee.employeeNo=paydetails.employeeNo AND paydetails.employeeNo=payhistory.employeeNo AND payhistory.payAmount<$content ORDER BY employee.employeeNo ASC";
	$res=mysqli_query($conn,$sql);
	while($row=mysqli_fetch_assoc($res)){
		$rows[]=$row;
	}
	echo json_encode($rows);
}elseif ($type==5) {
	mysqli_query($conn,"SET NAMES UTF8");

	$sql="SELECT * FROM employee,paydetails,payhistory WHERE employee.employeeNo=payhistory.employeeNo AND employee.employeeNo=paydetails.employeeNo AND paydetails.employeeNo=payhistory.employeeNo AND payhistory.payDate>$content ORDER BY employee.employeeNo ASC";
	$res=mysqli_query($conn,$sql);
	while($row=mysqli_fetch_assoc($res)){
		$rows[]=$row;
	}
	echo json_encode($rows);
}

?>