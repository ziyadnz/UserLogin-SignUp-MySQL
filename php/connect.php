<?php


$host ="localhost"; //standart tanımlama 0
$veritabani ="assigment3";
$kullanici ="root"; //0
$sifre="asdqwe123"; //0
$connect=mysqli_connect($host,$kullanici,$sifre,$veritabani); //it is worked
   
   if (!$connect) {
      die ("Cannot Connecter check connecton.php".mysqli_connect_error()); 
   }else{
   //echo "Connected";
   }

/*
$dsn = 'mysql:host=localhost;dbname=myhaber;charset=utf8mb4';
$username = "root";

$password = 'asdqwe123';
$dbh = new PDO($dsn, $username, $password);
   if(! $dbh ) {
      die('Could not connect: ' . mysql_error());
   }
   $result = @mysqli_query("SELECT * FROM authors", $link) or die(mysql_error($link));

	$sql = 'select * from authors;';
   $retval = @mysqli_query( $sql, $conn );

   if(! $retval ) {
      die('Could not select data: sdddddddddd' . mysql_error());
   }

   echo "Synced data successfully\n";
   mysql_close($conn);

*/

?>