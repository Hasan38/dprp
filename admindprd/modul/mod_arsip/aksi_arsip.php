<?php
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='../../css/zalstyle.css' rel='stylesheet' type='text/css'>
  <link rel='shortcut icon' href='../../favicon.png' />
  
  <body class='special-page'>
  <div id='container'>
  <section id='error-number'>
  <img src='../../img/lock.png'>
  <h1>MODUL TIDAK DAPAT DIAKSES</h1>
  <p><span class style=\"font-size:14px; color:#ccc;\">Untuk mengakses modul, Anda harus login dahulu!</p></span><br/>
  </section>
  <section id='error-text'>
  <p><a class='button' href='../../index.php'> <b>LOGIN DI SINI</b> </a></p>
  </section>
  </div>";}
else{
  include "../../../config/koneksi.php";
  include "../../../config/library.php";
  include "../../../config/fungsi_thumb.php";
  include "../../../config/fungsi_seo.php";

  $module=$_GET['module'];
  $act=$_GET['act'];

  // Hapus arsip
  if ($module=='arsip' AND $act=='hapus'){
    $data=mysql_fetch_array(mysql_query("SELECT nama_file FROM download WHERE id_download='".$_GET['id']."'"));
    if ($data['nama_file']!=''){
      $namafile=$data['nama_file'];
       unlink("../../../files/$namafile");   
       mysql_query("DELETE FROM download WHERE id_download='".$_GET['id']."'");
    }
    else{
       mysql_query("DELETE FROM download WHERE id_download='".$_GET['id']."'");
    }
    header('location:../../media.php?module='.$module);
  }
  // input arsip
  elseif ($module=='arsip' AND $act=='input'){
    $lokasi_file    = $_FILES['fupload']['tmp_name'];
    $nama_file      = $_FILES['fupload']['name'];    
    $acak           = rand(1,99);
    $nama_file_unik = "file-".$acak."_".$nama_file; 

    $judul = $_POST['judul'];
    if (!empty($lokasi_file)){
      // folder untuk menyimpan file yang di upload
      $folder = "../../../files/";
      $file_upload = $folder . $nama_file_unik;
      // upload file
      move_uploaded_file($_FILES["fupload"]["tmp_name"], $file_upload);
      $input = "INSERT INTO download(judul, nama_file, tanggal) VALUES('$judul', '$nama_file_unik', '$tgl_sekarang')";
      mysql_query($input);
      header("location:../../media.php?module=".$module);
    }
  }
  // Update arsip
  elseif ($module=='arsip' AND $act=='update'){
    $lokasi_file    = $_FILES['fupload']['tmp_name'];
    $nama_file      = $_FILES['fupload']['name'];
    $acak           = rand(1,99);
    $nama_file_unik = "file-".$acak."_".$nama_file; 

    $id    = $_POST['id'];
    $judul = $_POST['judul'];
    
    // Apabila file tidak diganti
    if (empty($lokasi_file)){
      $update = "UPDATE download SET judul='$judul' WHERE id_download='$id'";
      mysql_query($update);
      
      header("location:../../media.php?module=".$module);
    }else{
      $d=mysql_fetch_array(mysql_query("SELECT nama_file FROM download WHERE id_download='$id'"));
      $nf=$d['nama_file'];
      unlink("../../../files/$nf");

      $folder = "../../../files/";
      $file_upload = $folder . $nama_file_unik;
      move_uploaded_file($_FILES["fupload"]["tmp_name"], $file_upload);
      
      $update = "UPDATE download SET judul='$judul', nama_file='$nama_file_unik' WHERE id_download='$id'";
      mysql_query($update);

      header("location:../../media.php?module=".$module);
    }
  }
}
?>
