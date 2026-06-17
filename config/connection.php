<?php
$host = "sql202.infinityfree.com";
$user = "if0_42068473";
$password = "Rr0599418690";
$db = "if0_42068473_pms";

try {
    $con = new PDO("mysql:dbname=$db;port=3306;host=$host", $user, $password);
    // set the PDO error mode to exception
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // لضمان دعم اللغة العربية بشكل سليم على السيرفر
    $con->exec("set names utf8"); 
    
} catch(PDOException $e) {
    echo "Connection failed: ";
    $e->getMessage();
    echo $e->getTraceAsString();
    exit;
}

session_start();

// बाकी الأسطر الملعّق عليها في ملفك تترك كما هي...
?>