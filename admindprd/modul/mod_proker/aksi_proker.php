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

  if ($module=='proker' AND $act=='hapus'){
    mysql_query("DELETE FROM proker WHERE idproker='$_GET[id]'");  
    header('location:../../media.php?module='.$module);
  }

  elseif ($module=='proker' AND $act=='input'){
    $mulai=$_POST[thnmulai].'-'.$_POST[blnmulai].'-'.$_POST[tglmulai];
    $selesai=$_POST[thnselesai].'-'.$_POST[blnselesai].'-'.$_POST[tglselesai];
    $prokerseo  = seo_title($_POST[namaproker]);
    
    mysql_query("INSERT INTO proker(id_kategori, 
                                    namaproker, 
                                    prokerseo,
                                    sasaran, 
                                    pagu, 
                                    lokasi, 
                                    tglmulai, 
                                    tglselesai, 
                                    targetpeserta) 
    					                VALUES('$_POST[kategori]',
                                   '$_POST[namaproker]',
                                   '$prokerseo',
                                   '$_POST[sasaran]',
                                   '$_POST[pagu]',
                                   '$_POST[lokasi]',
                                   '$mulai',
                                   '$selesai',
                                   '$_POST[targetpeserta]')");
    header('location:../../media.php?module='.$module);
  }

  // Update proker
  elseif ($module=='proker' AND $act=='update'){
    $mulai=$_POST[thnmulai].'-'.$_POST[blnmulai].'-'.$_POST[tglmulai];
    $selesai=$_POST[thnselesai].'-'.$_POST[blnselesai].'-'.$_POST[tglselesai];
    $prokerseo  = seo_title($_POST[namaproker]);
    mysql_query("UPDATE proker SET namaproker     = '$_POST[namaproker]',
                                   id_kategori    = '$_POST[kategori]',
                                   sasaran        = '$_POST[sasaran]',
                                   lokasi         = '$_POST[lokasi]',  
                                   pagu           = '$_POST[pagu]',  
                                   prokerseo      = '$prokerseo',
                                   tglmulai       = '$mulai',
                                   tglselesai     = '$selesai',
                                   targetpeserta  = '$_POST[targetpeserta]'  
                             WHERE idproker = '$_POST[id]'");
    header('location:../../media.php?module='.$module);
  }
}
?>
