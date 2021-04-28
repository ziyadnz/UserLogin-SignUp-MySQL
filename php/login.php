<?php
 

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
		$db_data=array();
	$sql="SELECT user_id, user_name, user_surname FROM users";
	$result=$connect->query($sql);

//To check it is admin or not
$adminQuery = "SELECT * FROM users WHERE user_mail = '$user_mail' and user_password = '$user_password' and user_role=1 ";
 $checkadmin = mysqli_fetch_array(mysqli_query($connect,$adminQuery));
	
	if (isset($checkadmin)) {//if admin
		//print user list
		if (($result->num_rows)>0) {
				while ($row=mysqli_fetch_assoc($result)) {
					$db_data[]=$row;
				}

				//send back as a json
				echo json_encode($db_data);
			}else{
				echo "ERROOR GET ALL";
			}
	}else{ //if not an admin
		$userQuery = "SELECT * FROM users WHERE user_mail = '$user_mail' and user_password = '$user_password' ";
		$userResult=$connect->query($userQuery);
		while ($rows=mysqli_fetch_assoc($userResult)) {
					$db_data[]=$rows;
				}
				echo json_encode($db_data);
	}

		 // Successfully Login Message.
		
		 $onLoginSuccess = 'Login Matched';
		 
		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);
		 
		 // Echo the message.
		// echo $SuccessMSG ; 
	 
	 }else{
	 
		 // If Email and Password did not Matched.
		$InvalidMSG = 'Invalid Username or Password Please Try Again' ;
		 
		// Converting the message into JSON format.
		$InvalidMSGJSon = json_encode($InvalidMSG);
		 
		// Echo the message.
		 echo $InvalidMSGJSon ;
	 
	 }
 
 mysqli_close($connect);
?>