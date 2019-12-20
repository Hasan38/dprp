<script>
function confirmdelete(delUrl) {
  if (confirm("Anda yakin ingin menghapus?")) {
   document.location = delUrl;
  }
}
</script>

<?php
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='css/zalstyle.css' rel='stylesheet' type='text/css'>";
  echo "
  </head>
  <body class='special-page'>
  <div id='container'>
  <section id='error-number'>
  <img src='img/lock.png'>
  <h1>MODUL TIDAK DAPAT DIAKSES</h1>
  <p><span class style=\"font-size:14px; color:#ccc;\">Untuk mengakses modul, Anda harus login dahulu!</p></span><br/>
  </section>
  <section id='error-text'>
  <p><a class='button' href='index.php'>&nbsp;&nbsp; <b>ULANGI LAGI</b> &nbsp;&nbsp;</a></p>
  </section>
  </div>";
}else{
  //cek hak akses user
  $cek=user_akses($_GET[module],$_SESSION[sessid]);
  if($cek==1 OR $_SESSION[leveluser]=='admin'){
    $aksi="modul/mod_arsip/aksi_arsip.php";
    switch($_GET[act]){
    // Tampil arsip
    default:
      echo "  <div id='main-content'>
      <div class='container_12'>
      <div class=grid_12> 
      <br/>
      <a href='?module=arsip&act=tambaharsip' class='button'><span>Tambah Arsip</span></a></div>";

      echo "
      <div class='grid_12'>
      <div class='block-border'>
      <div class='block-header'>
      <h1>LEMARI ARSIP</h1>
      <span></span> 
      </div>
      <div class='block-content'>		
      <table id='table-example' class='table'>	  
        <thead><tr>	
          <th>No</th>
          <th>Judul</th>
          <th>Nama File</th>
          <th>Tgl. Posting</th>
          <th>Aksi</th>
        </thead>
      <tbody>";

      $tampil = mysql_query("SELECT * FROM download ORDER BY id_download DESC");
      $no=1;
      while($r=mysql_fetch_array($tampil)){
            $tgl_posting=tgl_indo($r['tanggal']);
        if (strlen($no)<2) {$g='0'.$no;}else{$g=$no;}
        echo "<tr class=gradeX> 
              <td>$no</td>
              <td>$r[judul]</td>
              <td>$r[nama_file]</td>
              <td>$tgl_posting</td>
              <td width=80>
                <a href=?module=arsip&act=editarsip&id=$r[id_download] title='Edit' class='with-tip'>
                <center><img src='img/edit.png'></a>
                <a href=javascript:confirmdelete('$aksi?module=arsip&act=hapus&id=$r[id_download]') title='Hapus' class='with-tip'>
                &nbsp;&nbsp;<img src='img/hapus.png'></center></a> 
              </td>
              </tr>";
            $no++; 
        $no++;
      }
      echo "</tbody></table> ";
    break;    

    // Form Tambah arsip
    case "tambaharsip":

// id_download, judul, nama_file, tanggal, diunduh  
    echo "
    <div id='main-content'>
    <div class='container_12'>

    <div class='grid_12'>
    <div class='block-border'>
    <div class='block-header'>

    <h1>TAMBAH ARSIP</h1>
    </div>
    <div class='block-content'>	

    <form method=POST action='$aksi?module=arsip&act=input' enctype='multipart/form-data'>

    <p class=inline-small-label> 
    <label for=field4>Judul</label>
    <input type=text name='judul' size=40>
    </p> 	

    <p class=inline-small-label> 
    <label for=field4>File</label>
    <input type=file name='fupload' size=40 required>
    </p> 

    <div class=block-actions> 
    <ul class=actions-left> 
    <li>
    <input type='submit' name='upload' class='button' value=' Simpan &nbsp;&nbsp;&nbsp;&nbsp;'>
    </li> </ul>
    <ul class=actions-right> 
    <li>
    <a class='button red' id=reset-validate-form href='?module=arsip'>Batal</a>
    </li> </ul>
    </form>";

    break;

    // Form Edit arsip  
    case "editarsip":
      $edit = mysql_query("SELECT * FROM download WHERE id_download='$_GET[id]'");
      $r    = mysql_fetch_array($edit);

      echo "
      <div id='main-content'>
      <div class='container_12'>

      <div class='grid_12'>
      <div class='block-border'>
      <div class='block-header'>

      <h1>EDIT ARSIP</h1>
      </div>
      <div class='block-content'>

      <form method=POST enctype='multipart/form-data' action=$aksi?module=arsip&act=update>
      <input type=hidden name=id value='$r[id_download]'>

      <p class=inline-small-label> 
      <label for=field4>Judul arsip</label>
      <input type=text name='judul' value='$r[judul]' size=40>
      </p> 

      <p class=inline-small-label> 
      <label for=field4>File</label>
      <input type=text name='File' value='$r[nama_file]' disabled>
      </p> 

      <p class=inline-small-label> 
      <label for=field4>Ganti File</label>
      <input type=file name='fupload' size=40>
      <small>- Apabila File tidak diganti, dikosongkan saja.</small>
      </p> ";

      echo "<div class=block-actions> 
      <ul class=actions-left> 
      <li>
      <input type='submit' name='upload' class='button' value=' Simpan &nbsp;&nbsp;&nbsp;&nbsp;'>
      </li> </ul>
      <ul class=actions-right> 
      <li>
      <a class='button red' id=reset-validate-form href='?module=arsip'>Batal</a>
      </li> </ul>
      </form>";

    break;  
    }
    //kurawal akhir hak akses module
  } else {
    echo akses_salah();
  }
}
?>
