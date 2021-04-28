<?php

include("connect.php");
header("Access-Control-Allow-Origin: *");

$table='users';
	$user_mail= mysqli_real_escape_string($connect, $_POST['user_mail']);
	$user_role= mysqli_real_escape_string($connect, $_POST['user_role']);

$db_data=array();
if ($user_role=="user") {
	$sql="SELECT * FROM users where user_mail='$user_mail'";
}else{
	$sql="SELECT * FROM users";
}

	
	$result=$connect->query($sql);
	if (($result->num_rows)>0) {
		while ($row=mysqli_fetch_assoc($result)) {
			$db_data[]=$row;
		}

		//send back as a json
		echo json_encode($db_data);
	}else{
		echo "ERROOR GET ALL";
	}
	$connect->close();
	return;

// $sql="SELECT * FROM users";

//  $result = mysqli_query($connect, $sql) or die("Error in Selecting " . mysqli_error($connect));

//     //create an array
//     $emparray = array();
//     while($row =mysqli_fetch_assoc($result))
//     {
//         $emparray[] = $row;
//     }
//     echo json_encode($emparray,JSON_UNESCAPED_UNICODE); //this unicode allow İ

//     //close the db connection
//     mysqli_close($connect);

?>