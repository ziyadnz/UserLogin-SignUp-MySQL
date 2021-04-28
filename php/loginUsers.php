<?php
 
 //Define your Server host name here.
 $HostName = "localhost";
 
 //Define your MySQL Database Name here.
 $DatabaseName = "id11189654_flutter_db";
 
 //Define your Database User Name here.
 $HostUser = "id11189654_root";
 
 //Define your Database Password here.
 $HostPass = "1234567890"; 
 
 // Creating MySQL Connection.
 // **$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);

include("connect.php");
 
 // Getting the received JSON into $json variable.
 $json = file_get_contents('php://input');
 
 // Decoding the received JSON and store into $obj variable.
 $obj = json_decode($json,true);
 
 // Getting User email from JSON $obj array and store into $email.
 $user_name = $obj['user_name'];
 
 // Getting Password from JSON $obj array and store into $password.
 $user_password = $obj['user_password'];
 
 //Applying User Login query with email and password.
 $loginQuery = "SELECT * FROM users WHERE user_name = '$user_name' and user_password = '$user_password' ";
 
 // Executing SQL Query.
 $check = mysqli_fetch_array(mysqli_query($connect,$loginQuery));
 
	if(isset($check)){
		
		 // Successfully Login Message.
		 $onLoginSuccess = 'Login Matched';
		 
		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);
		 
		 // Echo the message.
		 echo $SuccessMSG ; 
	 
	 }
	 
	 else{
	 
		 // If Email and Password did not Matched.
		$InvalidMSG = 'Invalid Username or Password Please Try Again' ;
		 
		// Converting the message into JSON format.
		$InvalidMSGJSon = json_encode($InvalidMSG);
		 
		// Echo the message.
		 echo $InvalidMSGJSon ;
	 
	 }
 
 mysqli_close($connect);
?>