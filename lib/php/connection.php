<?php

$host = 'localhost';
$dbname = 'id20972240_flutter_crud';
$user = 'id20972240_tuto';
$pass = '+d3*TTbIJvX#gp-]';

try{
    $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    return $db;
    //echo "connected";
}catch (\Throwable $th){
    //echo "Error: ".$th->getMessage();
}
?>