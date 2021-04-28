<?php
	
include("connect.php");

if ($connect) {
	echo json_encode("Connect to create table");
}


	$fname = mysqli_real_escape_string($connect, $_POST['user_name']);
	$sname= mysqli_real_escape_string($connect, $_POST['user_surname']);
	$email= mysqli_real_escape_string($connect, $_POST['user_mail']);
	$phone= mysqli_real_escape_string($connect, $_POST['user_phone']);
	$adresss= mysqli_real_escape_string($connect, $_POST['user_adress']);
	$password= mysqli_real_escape_string($connect, $_POST['user_password']);
		

// $stmt=$connect->prepare("INSERT INTO users(`user_name`,`user_surname`,`user_mail`,`user_phone`,`user_adress`,`user_password`) VALUES (?,?,?,?,?,?)");
// 	$stmt->execute(array($fname,$sname,$email,$phone,$adresss,$password)) ;

$sql="INSERT INTO users(user_name,user_surname,user_mail,user_phone,user_adress,user_password) 
	VALUES('$fname','$sname','$email','$phone','$adresss','$password') ";
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