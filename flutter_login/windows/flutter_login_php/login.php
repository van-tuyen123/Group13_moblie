<?php
require "connect.php";
if (!$con) {
    echo "connection error";
}
$email = $_POST['email'];
$password = $_POST['password'];
$encrypted_pwd = md5($password);
$sql = "SELECT * FROM user WHERE email = '" . $email . "' AND password = '" . $encrypted_pwd . "' ";
$result = mysqli_query($con, $sql);
$count = mysqli_num_rows($result);

if ($count == 1) {
    echo json_encode("Success");
} else {
    echo json_encode("Error");
}
