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
  $cek=user_akses($_GET[module],$_SESSION[sessid]);
  if($cek==1 OR $_SESSION[leveluser]=='admin'){
    $aksi="modul/mod_proker/aksi_proker.php";
    switch($_GET[act]){
    default:
      echo "
      <div id='main-content'>
      <div class='container_12'>
      <div class=grid_12> 
      <br/>
      <a href='?module=proker&act=tambahproker' class='button'>
      <span>Tambah Progran Kerja</span>
      </a></div>

      <div class='grid_12'>
      <div class='block-border'>
      <div class='block-header'>
      <h1>Program Kerja Tahun ".date('Y')."</h1>
      <span></span> 
      </div>
      <div class='block-content'>

      <table id='table-example' class='table'>	  

      <thead><tr>	  

      <th>No</th>
      <th>Program Kerja</th>
      <th>Sasaran</th>
      <th>Lokasi</th>
      <th>Tanggal</th>
      <th>Peserta</th>
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
        $lebar=strlen($no);
        switch($lebar){
        case 1:
          $g="0".$no;
          break;     
        case 2:
          $g=$no;
          break;     
        } 
        echo "<tr class=gradeX>
        <td width=50><center>$g</center></td>
        <td>$r[namaproker]</td>
        <td>$r[sasaran]</td>
        <td>$r[lokasi]</td>
        <td>$tgl</td>
        <td>$r[targetpeserta] org</td>
        <td width=80>
          <a href=?module=proker&act=editproker&id=$r[idproker] title='Edit' class='with-tip'>
          <center><img src='img/edit.png'></a>
          <a href=javascript:confirmdelete('$aksi?module=proker&act=hapus&id=$r[idproker]') 
          title='Hapus' class='with-tip'>
          &nbsp;&nbsp;&nbsp;&nbsp;<img src='img/hapus.png'></center></a> 
        </td></tr>";		
        $no++;
      }
      echo "</table>";
      $jmldata = mysql_num_rows(mysql_query("SELECT * FROM proker WHERE year(tglmulai)=date('Y')"));  
      $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
      $linkHalaman = $p->navHalaman($_GET[halaman], $jmlhalaman);
      break;
    case "tambahproker":
      echo "
      <div id='main-content'>
      <div class='container_12'>

      <div class='grid_12'>
      <div class='block-border'>
      <div class='block-header'><h1>TAMBAHKAN PROGRAM KERJA</h1></div>
      <div class='block-content'>

      <form method=POST action='$aksi?module=proker&act=input' enctype='multipart/form-data'>

      <p class=inline-small-label> 
      <label for=field4>Jenis Program</label>
      <select name='kategori'>
        <option value='0' selected>Pilih Jenis Program</option>";
        $kat = mysql_query("SELECT * FROM kategori");
        while($pr = mysql_fetch_array($kat)){
          echo "<option value='".$pr[id_kategori]."'>".$pr[nama_kategori]."</option>";
        }
      echo "
      </select>
      </p> ";     

      echo "
      <p class=inline-small-label> 
      <label for=field4>Program Kerja</label>
      <input type=text name='namaproker' size=60>
      </p> 		 

      <p class=inline-small-label> 
      <label for=field4>Sasaran</label>
      <textarea name='sasaran' rows = 4></textarea>
      </p>		 

      <p class=inline-small-label> 
      <label for=field4>Lokasi</label>
      <input type=text name='lokasi' size=40>
      </p>       

      <p class=inline-small-label> 
      <label for=field4>Pagu Anggaran</label>
      <input type=text name='pagu' size=40>
      </p> 			

      <p class=inline-small-label> 
      <label for=field4>Rencana Pelaksanaan : </label>&nbsp;</p>

      <p class=inline-small-label> 
      <label for=field4>Peserta</label>
      <input type=text name='targetpeserta' size=40>
      </p> 			

      <p class=inline-small-label> 
      <label for=field4>Tgl Mulai</label> : ";        
      combotgl(1,31,'tglmulai',$tgl_skrg);
      combonamabln(1,12,'blnmulai',$bln_sekarang);
      combothn(2000,$thn_sekarang,'thnmulai',$thn_sekarang);

      echo "</p> <p class=inline-small-label> 
      <label for=field4>Tgl Selesai</label> : ";        
      combotgl(1,31,'tglselesai',$tgl_skrg);
      combonamabln(1,12,'blnselesai',$bln_sekarang);
      combothn(2000,$thn_sekarang,'thnselesai',$thn_sekarang);

      echo "</p> 

      <div class=block-actions> 
      <ul class=actions-right> 
      <li>
      <a class='button red' id=reset-validate-form href='?module=proker'>Batal</a>
      </li> </ul>
      <ul class=actions-left> 
      <li>
      <input type='submit' name='upload' class='button' value=' Simpan &nbsp;&nbsp;&nbsp;&nbsp;'>
      </li> </ul>
      </form>";
      break;
    case "editproker":
      $edit = mysql_query("SELECT * FROM proker WHERE idproker='$_GET[id]'");
      $r    = mysql_fetch_array($edit);
      echo "
      <div id='main-content'>
      <div class='container_12'>

      <div class='grid_12'>
      <div class='block-border'>
      <div class='block-header'>

      <h1>EDIT PROGRAM KERJA</h1>
      </div>
      <div class='block-content'>	

      <form method=POST action='$aksi?module=proker&act=update' enctype='multipart/form-data'>
      <input type=hidden name=id value=$r[idproker]>

      <p class=inline-small-label> 
      <label for=field4>Jenis Program</label>
      <select name='kategori'>";
        $kat = mysql_query("SELECT * FROM kategori");
        while($pr = mysql_fetch_array($kat)){
          if ($pr[id_kategori]==$r[id_kategori]) {
            echo "<option value='".$pr[id_kategori]."' selected>".$pr[nama_kategori]."</option>";
          } else {
            echo "<option value='".$pr[id_kategori]."'>".$pr[nama_kategori]."</option>";
          }
        }
      echo "
      </select>
      </p> ";     

      echo "
      <p class=inline-small-label> 
      <label for=field4>Program Kerja</label>
      <input type=text name='namaproker' size=60 value='$r[namaproker]'>
      </p> 	

      <p class=inline-small-label> 
      <label for=field4>Sasaran</label>
      <textarea name='sasaran' rows = 4>$r[sasaran]</textarea>
      </p> 	

      <p class=inline-small-label> 
      <label for=field4>Lokasi</label>
      <input type=text name='lokasi' size=40 value='$r[lokasi]'>
      </p> 

      <p class=inline-small-label> 
      <label for=field4>Pagu Anggaran</label>
      <input type=text name='pagu' size=40 value='$r[pagu]'>
      </p> 

      <p class=inline-small-label> 
      <label for=field4>Rencana Pelaksanaan : </label>&nbsp;</p>

      <p class=inline-small-label> 
      <p class=inline-small-label> 
      <label for=field4>Peserta</label>
      <input type=text name='targetpeserta' size=40 value='$r[targetpeserta]'>
      </p> 

      <p class=inline-small-label> 
      <label for=field4>Tgl Mulai</label> ";  
      $get_tgl=substr("$r[tglmulai]",8,2);
      combotgl(1,31,'tglmulai',$get_tgl);
      $get_bln=substr("$r[tglmulai]",5,2);
      combonamabln(1,12,'blnmulai',$get_bln);
      $get_thn=substr("$r[tglmulai]",0,4);
      $thn_skrg=date("Y");
      combothn($thn_sekarang,$thn_sekarang,'thnmulai',$get_thn);

      echo "</p> <p class=inline-small-label> 
      <label for=field4>Tgl Selesai</label>";   
      $get_tgl2=substr("$r[tglselesai]",8,2);
      combotgl(1,31,'tglselesai',$get_tgl2);
      $get_bln2=substr("$r[tglselesai]",5,2);
      combonamabln(1,12,'blnselesai',$get_bln2);
      $get_thn2=substr("$r[tglselesai]",0,4);
      combothn($thn_sekarang,$thn_sekarang,'thnselesai',$get_thn2);

      echo "</p>

      <div class=block-actions> 
      <ul class=actions-right> 
      <li>
      <a class='button red' id=reset-validate-form href='?module=proker'>Batal</a>
      </li> </ul>
      <ul class=actions-left> 
      <li>
      <input type='submit' name='upload' class='button' value=' Update &nbsp;&nbsp;&nbsp;&nbsp;'>
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