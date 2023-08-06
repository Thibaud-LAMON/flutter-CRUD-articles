<?php
$db = include 'connection.php';
include "crypto.php";

$email = decrypt($_POST['email']);
$pass = sha1(decrypt($_POST['pass']));

try{
    if(isset($email, $pass)){
        $req = $db->prepare("SELECT * FROM users WHERE email=? AND  password=?");
        $req->execute(array($email, $pass));
        $exist = $req->rowCount();
        if($exist == 1){
            $array = $req->fetch();
            $msg = "success connection";
            $success = 1;
        }else{
            $msg = "email or password incorrect";
            $success = 0;
        }
    }else{
        $success = 0;
        $msg = "error empty data";
    }
}catch (\Throwable $th){
    $success = 0;
    echo "Error: ".$th->getMessage();
}
echo json_encode([
    "data"=>[
        encrypt($msg),
        $success,
        $array
    ]
]);
?>