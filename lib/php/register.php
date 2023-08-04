<?php
$db = include 'connection.php';

$name = $_POST['name'];
$email = $_POST['email'];
$pass = sha1($_POST['pass']);

try{
    if(isset($name, $email, $pass)){
        $req = $db->prepare("SELECT * FROM users WHERE email=?");
        $req->execute(array($email));
        $exist = $req->rowCount();
        if($exist == 0){
            $req = $db->prepare("INSERT INTO users VALUES(null,?,?,?)");
            $req->execute(array($name, $email, $pass));
            if($req){
                $success = 1;
                $msg = "success register";
            }else{
                $success = 0;
                $msg = "error register";
            }
        }else{
            $msg = "email already exist";
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
        $msg,
        $success
    ]
]);
?>