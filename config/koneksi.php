<?php

// panggil fungsi validasi xss dan injection
require_once('fungsi_validasi.php');

$server =  "139.162.44.72";
$username = "papuadev_papuadev";
$password = "papuadevXYZ";
$database = "papuadev_dprd1";

// $server =  "localhost";
// $username = "id7655651_dbk33r0m";
// $password = "pa55WORD";
// $database = "id7655651_dbkeerom";

// Koneksi dan memilih database di server
// Create connection
$conn = new mysqli($server, $username, $password, $database);
// Check connection
if ($conn->connect_error)
{
  die("Connection failed: " . $conn->connect_error);
}


// buat variabel untuk validasi dari file fungsi_validasi.php
$val = new Rizalvalidasi;

function anti_injection($data){
  $filter = mysqli_real_escape_string(stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES))));
  return $filter;
}

function cetak($str){
    return strip_tags(htmlentities($str, ENT_QUOTES, 'UTF-8'));
}



?>
