<?php
 //if it is admin echo admin else user

include("connect.php");

 header("Access-Control-Allow-Origin: *");

 $table='users';
 // Getting User email from JSON $obj array and store into $email.
	$user_mail= mysqli_real_escape_string($connect, $_POST['user_mail']);
	$user_password= mysqli_real_escape_string($connect, $_POST['user_password']);
 
 //Applying User Login query with email and password.
 $loginQuery = "SELECT * FROM users WHERE user_mail = '$user_mail' and user_password = '$user_password' ";
 
 // Executing SQL Query.
 $check = mysqli_fetch_array(mysqli_query($connect,$loginQuery));
 //login is tru or not
	if(isset($check)){
		$adminQuery = "SELECT * FROM users WHERE user_mail = '$user_mail' and user_password = '$user_password' and user_role=1 ";
 $checkadmin = mysqli_fetch_array(mysqli_query($connect,$adminQuery));
	
	if (isset($checkadmin)) {//if admin
		$onLoginSuccess = 'admin';
		 
		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);
		 
		 // Echo the message.
		 echo $SuccessMSG ; 

	}else{
		$onLoginSuccess = 'user';
		 
		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);
		 
		 // Echo the message.
		 echo $SuccessMSG ; 
	}

}


?>