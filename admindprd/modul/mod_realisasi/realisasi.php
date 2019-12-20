<script>
function confirmdelete(delUrl) {
  if (confirm("Anda yakin ingin menghapus?")) {
    document.location = delUrl;
  }
}
</script>
<style>
  table {
      font-family: arial, sans-serif;
      border-collapse: collapse;
      width: 100%;
  }

  td, th {
      text-align: left;
      padding: 8px;
  }
</style>

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
  $cek=user_akses($_GET[module],$_SESSION[sessid]);
  if($cek==1 OR $_SESSION[leveluser]=='admin'){
    $aksi="modul/mod_realisasi/aksi_realisasi.php";
    switch($_GET[act]){
    default:
      echo "
      <div id='main-content'>
      <div class='container_12'>

      <div class='grid_12'>
      <div class='block-border'>
      <div class='block-header'>
      <h1>Realisasi Program Kerja Tahun ".date('Y')."</h1>
      <span></span> 
      </div>
      <div class='block-content'>

      <table id='table-example' class='table'>	  

      <thead><tr>	  

      <th>No</th>
      <th>Program Kerja</th>
      <th>Sasaran</th>
      <th>Lokasi</th>
      <th>Tanggal Realisasi</th>
      <th>Realisasi Peserta</th>
      <th>Dana Terserap</th>
      <th>Aksi</th>

      </thead>
      <tbody>";
      $p      = new Paging;
      $batas  = 15;
      $posisi = $p->cariPosisi($batas);
      $thn = date('Y');

      $tampil=mysql_query("SELECT * FROM proker WHERE year(tglmulai) = $thn ORDER BY idproker");

      $no = $posisi+1;
      while ($r=mysql_fetch_array($tampil)){
        $realmulai   = tgl_indo($r[realmulai]);
        $realselesai = tgl_indo($r[realselesai]);

        $t1=substr("$r[realmulai]",8,2);
        $b1=substr("$r[realmulai]",5,2);
        $b2=substr("$r[realselesai]",5,2);
        if ($b1==$b2) {
          $tgl=$t1.' s/d '.$realselesai;
        }else{
          $tgl=$realmulai.' s/d '.$realselesai;
        }
        $lebar=strlen($no);
        switch($lebar){
        case 1:
          $g="0".$no;
          break;     
        case 2:
          $g=$no;
          break;     
        } 
        if ($r[realpeserta]==0) {
          $tgl='-'; $pst = '-';
        }else{$pst=$r[realpeserta];}
        echo "<tr class=gradeX>
        <td width=50><center>$g</center></td>
        <td>$r[namaproker]</td>
        <td>$r[sasaran]</td>
        <td>$r[lokasi]</td>
        <td>$tgl</td>
        <td>$pst org</td>
        <td>".number_format($r[danaterserap],0,",",".")."</td>
        <td width=80>
          <a href=?module=realisasi&act=tambahreal&id=$r[idproker] title='Input / Edit Realisasi' class='with-tip'>
          <center><img src='img/edit.png'></a></center>
        </td></tr>";		
        $no++;
      }
      echo "</table>";
      $jmldata = mysql_num_rows(mysql_query("SELECT * FROM proker WHERE year(tglmulai)=date('Y')"));  
      $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
      $linkHalaman = $p->navHalaman($_GET[halaman], $jmlhalaman);
      break;
    case "tambahreal":
// idproker, id_kategori, namaproker, sasaran, pagu, lokasi, tglmulai, tglselesai, targetpeserta, realmulai, realselesai, realpeserta, danaterserap
      $edit = mysql_query("SELECT * FROM proker WHERE idproker='$_GET[id]'");
      $r    = mysql_fetch_array($edit);
      $tglmulai   = tgl_indo($r[tglmulai]);
      $tglselesai = tgl_indo($r[tglselesai]);

      $t1=substr("$r[tglmulai]",8,2);
      $b1=substr("$r[tglmulai]",5,2);
      $b2=substr("$r[tglselesai]",5,2);
      if ($b1==$b2) {
        $tgl=$t1.' s/d '.$tglselesai;
      }else{
        $tgl=$tglmulai.' s/d '.$tglselesai;
      }


      echo "
      <div id='main-content'>
      <div class='container_12'>

      <div class='grid_12'>
      <div class='block-border'>
      <div class='block-header'>

      <h1>INPUT / EDIT REALISASI PROGRAM KERJA</h1>
      </div>
      <div class='block-content'>	

      <form method=POST action='$aksi?module=realisasi&act=update' enctype='multipart/form-data'>
      <input type=hidden name=id value=$r[idproker]>

      <table >
      <tr><td>Program Kerja</td><td>: <b>$r[namaproker]</b></td></tr>
      <tr><td>Sasaran</td><td>: <b>$r[sasaran]</b></td></tr>
      <tr><td>Lokasi</td><td>: <b>$r[lokasi]</b></td></tr>
      <tr><td>Pagu Anggaran</td><td>: <b>Rp. ".number_format($r[pagu],0,",",".").",-</b></td></tr>
      <tr><td colspan =2>Rencana Pelaksanaan :</td></tr>
      <tr><td>Tanggal</td><td>: <b>$tgl</b></td></tr>
      <tr><td>Target Peserta</td><td>: <b>$r[targetpeserta] </b>orang</td></tr>
      </table>

      <p class=inline-small-label> 
      <label for=field4>Realisasi : </label>&nbsp;</p>

      <p class=inline-small-label> 
      <label for=field4>Tgl Pelaksanaan</label> ";  
      $get_tgl=substr("$r[realmulai]",8,2);
      if ($get_tgl=='00') {
        $get_tgl=substr("$r[tglmulai]",8,2);
      }
      combotgl(1,31,'realtglmulai',$get_tgl);

      $get_bln=substr("$r[realmulai]",5,2);
      if ($get_bln=='00') {
        $get_bln=substr("$r[tglmulai]",5,2);
      }
      combonamabln(1,12,'realblnmulai',$get_bln);
      $get_thn=substr("$r[tglmulai]",0,4);
      $thn_skrg=date("Y");
      combothn($thn_sekarang,$thn_sekarang,'realthnmulai',$get_thn);

      echo "</p> <p class=inline-small-label> 
      <label for=field4>s/d Tanggal</label>";   
      $get_tgl2=substr("$r[realselesai]",8,2);
      if ($get_tgl2=='00') {
        $get_tgl2=substr("$r[tglselesai]",8,2);
      }
      combotgl(1,31,'realtglselesai',$get_tgl2);
      $get_bln2=substr("$r[realselesai]",5,2);
      if ($get_bln2=='00') {
        $get_bln2=substr("$r[tglselesai]",5,2);
      }
      combonamabln(1,12,'realblnselesai',$get_bln2);
      $get_thn2=substr("$r[tglselesai]",0,4);
      combothn($thn_sekarang,$thn_sekarang,'realthnselesai',$get_thn2);

      echo "</p>


      <p class=inline-small-label> 
      <p class=inline-small-label> 
      <label for=field4>Peserta</label>
      <input type=text name='realpeserta' size=40 value='$r[realpeserta]'>
      </p> 

      <p class=inline-small-label> 
      <label for=field4>Dana Terserap</label>
      <input type=text name='danaterserap' size=40 value='$r[danaterserap]'>
      </p> 

      <div class=block-actions> 
      <ul class=actions-right> 
      <li>
      <a class='button red' id=reset-validate-form href='?module=realisasi'>Batal</a>
      </li> </ul>
      <ul class=actions-left> 
      <li>
      <input type='submit' name='upload' class='button' value=' Simpan &nbsp;&nbsp;&nbsp;&nbsp;'>
      </li> </ul>
      </form>";
      break;
    }
  } else {
  echo akses_salah();
  }
}
?>
</div> 
</div>
</div>
<div class='clear height-fix'></div> 
</div></div>