<?php
	
include("connect.php");

if ($connect) {
	echo json_encode("Connect to create table");
}
    $userid = mysqli_real_escape_string($connect, $_POST['user_id']);
	$fname = mysqli_real_escape_string($connect, $_POST['user_name']);
	$sname= mysqli_real_escape_string($connect, $_POST['user_surname']);

		

// $stmt=$connect->prepare("INSERT INTO users(`user_name`,`user_surname`,`user_mail`,`user_phone`,`user_adress`,`user_password`) VALUES (?,?,?,?,?,?)");
// 	$stmt->execute(array($fname,$sname,$email,$phone,$adresss,$password)) ;

$sql="UPDATE users user_name ='$fname' and user_surname='$sname' WHERE user_id='$userid' ";
	$query=mysqli_query($connect,$sql);
	if ($query) {
		echo json_encode("NO Errors");
	}else
	{
		echo $query;
		echo "nooo";
	}
//	header("Location: ../index.php?signup=success");

// $sql="INSERT INTO users(user_name,user_surname,user_mail,user_phone,user_adress,user_password) 
// 	VALUES('ziyadasdzz','deniz','mail','525252', 'adresss', '123456789')";
// 	mysqli_query($connect,$sql);
	//header("Location: ../index.php?signup=success");

?>