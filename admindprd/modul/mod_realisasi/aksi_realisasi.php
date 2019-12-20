<?php
session_start();
error_reporting(0);
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
  <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}else{
  include "../../../config/koneksi.php";
  include "../../../config/fungsi_seo.php";
  include "../../../config/library.php";
  include "../../../config/fungsi_thumb.php";
  $module=$_GET[module];
  $act=$_GET[act];

  if ($module=='realisasi' AND $act=='update'){
    $mulai=$_POST[realthnmulai].'-'.$_POST[realblnmulai].'-'.$_POST[realtglmulai];
    $selesai=$_POST[realthnselesai].'-'.$_POST[realblnselesai].'-'.$_POST[realtglselesai];
    mysql_query("UPDATE proker SET danaterserap  = '$_POST[danaterserap]',  
                                   realmulai     = '$mulai',
                                   realselesai   = '$selesai',
                                   realpeserta   = '$_POST[realpeserta]'  
                             WHERE idproker = '$_POST[id]'");
    header('location:../../media.php?module='.$module);
  }
}
?>
