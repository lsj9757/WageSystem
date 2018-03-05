<?php
header("content-type:text/html;charset=utf-8");
require_once("./connect.php");
$employeeNo=$_POST['employeeNo'];
$bonusTypeNo=$_POST['bonusTypeNo'];
$deductTypeNo=$_POST['deductTypeNo'];
$payTypeNo=$_POST['payTypeNo'];
$payNo=$_POST['payNo'];

mysqli_query($conn,"SET NAMES UTF8");

$sql1="SELECT * FROM  bonus WHERE employeeNo='$employeeNo' ORDER BY employeeNo ASC";
$res1=mysqli_query($conn,$sql1);
$rows1=mysqli_fetch_assoc($res1);

$sql2="SELECT * FROM  bonustype WHERE bonusTypeNo='$bonusTypeNo' ORDER BY bonusTypeNo ASC";
$res2=mysqli_query($conn,$sql2);
$rows2=mysqli_fetch_assoc($res2);

$sql3="SELECT * FROM  deduction WHERE employeeNo='$employeeNo' ORDER BY employeeNo ASC";
$res3=mysqli_query($conn,$sql3);
$rows3=mysqli_fetch_assoc($res3);

$sql4="SELECT * FROM  deducttype WHERE deductTypeNo='$deductTypeNo' ORDER BY deductTypeNo ASC";
$res4=mysqli_query($conn,$sql4);
$rows4=mysqli_fetch_assoc($res4);

$sql5="SELECT * FROM  holiday WHERE employeeNo='$employeeNo' ORDER BY employeeNo ASC";
$res5=mysqli_query($conn,$sql5);
$rows5=mysqli_fetch_assoc($res5);

$sql6="SELECT * FROM  paydetails WHERE employeeNo='$employeeNo' ORDER BY employeeNo ASC";
$res6=mysqli_query($conn,$sql6);
$rows6=mysqli_fetch_assoc($res6);

$sql7="SELECT * FROM  paytype WHERE payTypeNo='$payTypeNo' ORDER BY payTypeNo ASC";
$res7=mysqli_query($conn,$sql7);
$rows7=mysqli_fetch_assoc($res7);

$sql8="SELECT * FROM  payhistory WHERE payNo='$payNo' ORDER BY employeeNo ASC";
$res8=mysqli_query($conn,$sql8);
$rows8=mysqli_fetch_assoc($res8);

$sql9="SELECT * FROM  sickleave WHERE employeeNo='$employeeNo' ORDER BY employeeNo ASC";
$res9=mysqli_query($conn,$sql9);
$rows9=mysqli_fetch_assoc($res9);

$sql10="SELECT firstName,middleName,lastName FROM  employee WHERE employeeNo='$employeeNo' ORDER BY employeeNo ASC";
$res10=mysqli_query($conn,$sql10);
$rows10=mysqli_fetch_assoc($res10);


$data= array('bonus' => $rows1,'bonustype' => $rows2,'deduction' => $rows3,'deducttype' => $rows4,'holiday' => $rows5,'paydetails' => $rows6,'paytype' => $rows7,'payhistory' => $rows8,'sickleave' => $rows9,'name' => $rows10);

echo json_encode($data);
?>