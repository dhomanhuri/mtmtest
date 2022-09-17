<?php

$db_servername = 'localhost';
$db_username = 'root';
$db_password = '12';
$db_name = 'mtm';

$db = mysqli_connect($db_servername,$db_username,$db_password,$db_name);
if($db){
    // echo 'connect';
}

?>