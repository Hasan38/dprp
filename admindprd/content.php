   <?php
   include "../config/library.php";
   include "../config/fungsi_indotgl.php";
   include "../config/fungsi_combobox.php";
   include "../config/class_paging.php";

   // Bagian Home
if ($_GET['module']=='home'){
	$isi_komentar=mysql_num_rows(mysql_query("SELECT * FROM komentar WHERE dibaca='N'"));
	$jumHub=mysql_num_rows(mysql_query("SELECT * FROM hubungi WHERE dibaca='N'"));
	
   if ($_SESSION['leveluser']=='admin'){
   echo "<div id='main-content'>
   <div class='container_12'>
   <div class='grid_12'>
                             
   <p>Silahkan klik menu pilihan yang berada di sebelah kiri untuk mengelola konten website anda <br/>atau pilih ikon-ikon pada  
   Control Panel di bawah ini:</p>
   </div>

   <div class='grid_12'>
   <div class='block-border'>
   <div class='block-header'>";
   if ($_GET[view] == ''){ echo "<h1><a href='media.php?module=home&view=stat'>MENU ADMINISTRATOR</a></h1>"; }else{ echo "<h1><a href='media.php?module=home'>STATISTIK PENGUNJUNG</a></h1>"; }
   echo "<span></span></div>
   
<div class='block-content'>";
if ($_GET[view] != ''){
 ?>
<script src="http://phpmu.com/update/jquery.min.js" type="text/javascript"></script>
<script src="http://phpmu.com/update/highcharts.js" type="text/javascript"></script>
<script type="text/javascript">
var chart1;
$(document).ready(function() {
      chart1 = new Highcharts.Chart({
         chart: {
            renderTo: 'pengunjung',
            type: 'column'
         },   
         title: {
            text: 'Laporan Jumlah Pengunjung Perhari'
         },
         xAxis: {
            categories: ['Tanggal Kunjungan']
         },
         yAxis: {
            title: {
               text: 'Jumlah Kunjungan'
            }
         },
              series:             
            [
            <?php 
           $sql   = "SELECT * FROM statistik GROUP BY tanggal DESC LIMIT 9";
            $query = mysql_query( $sql )  or die(mysql_error());
            while( $ret = mysql_fetch_array( $query ) ){
            	$tanggal=$ret['tanggal'];     
				$tampiltanggal=tgl_indo($ret['tanggal']);   
                 $sql_jumlah   = "SELECT COUNT(ip) as jumlah FROM statistik WHERE tanggal='$tanggal'";        
                 $query_jumlah = mysql_query( $sql_jumlah ) or die(mysql_error());
                 while( $data = mysql_fetch_array( $query_jumlah ) ){
                    $jumlah = $data['jumlah'];                 
                  }             
                  ?>
                  {
                      name: '<?php echo $tampiltanggal; ?>',
                      data: [<?php echo $jumlah; ?>]
                  },
                  <?php } ?>
            ]
      });
   });	
</script>
		<div id='pengunjung'></div>			
<?php
echo "</div>";

   }else{
   echo "
   <ul style='margin-left:50px' class='shortcut-list'>
	   <li><a href=media.php?module=identitas><img style='height:50px' src='img/www.png'/>Identitas Website</a></li>
	   <li><a href=media.php?module=menu><img style='height:50px' src='img/modul.png'/>Menu Website</a></li>
	   <li><a href=media.php?module=berita><img style='height:50px' src='img/berita.png'/>Berita</a></li>
	   <li><a href=media.php?module=kategori><img style='height:50px' src='img/katalog.png'/>Kategori Berita</a></li>
	   <li><a href=media.php?module=proker><img style='height:50px' src='img/banner.png'/>Program Kerja</a></li>
	   <li><a href=media.php?module=realisasi><img style='height:50px' src='img/kategori.png'/>Realisasi</a></li>
     <li><a href=media.php?module=sekilasinfo><img style='height:50px' src='img/kedit.png'/>Telp. Penting</a></li>
     <li><a href=media.php?module=album><img style='height:50px' src='img/album.png'/>Album Foto</a></li>
     <li><a href=media.php?module=galerifoto><img style='height:50px' src='img/foto.png'/>Foto Proyek</a></li>
     <li><a href=media.php?module=video><img style='height:50px' src='img/video.png'/>Video</a></li>
     <li><a href=media.php?module=hubungi><img style='height:50px' src='img/hubungi.png'/>Pesan Masuk
     <span class='badge3 red3'><blink>$jumHub</blink></span></a></li>
     <li><a href=media.php?module=halamanstatis><img style='height:50px' src='img/add_page.png'/>Halaman</a></li>
     <li><a href=media.php?module=alamat><img style='height:50px' src='img/alamat.png'/>Alamat Kontak</a></li>
     <li><a href=media.php?module=user><img style='height:50px' src='img/user.png'/>User Admin</a></li>
   </ul>

  <p align=right>Login : $hari_ini, ";
  echo tgl_indo(date("Y m d")); 
  echo " | "; 
  echo date("H:i:s");
  echo " WIB</p>";
  
   // Statistik user
  $ip      = $_SERVER['REMOTE_ADDR']; // Mendapatkan IP komputer user
  $tanggal = date("Ymd"); // Mendapatkan tanggal sekarang
  $waktu   = time(); // 

  // Mencek berdasarkan IPnya, apakah user sudah pernah mengakses hari ini 
  $s = mysql_query("SELECT * FROM statistik WHERE ip='$ip' AND tanggal='$tanggal'");
  // Kalau belum ada, simpan data user tersebut ke database
  if(mysql_num_rows($s) == 0){
    mysql_query("INSERT INTO statistik(ip, tanggal, hits, online) VALUES('$ip','$tanggal','1','$waktu')");
  } 
  else{
    mysql_query("UPDATE statistik SET hits=hits+1, online='$waktu' WHERE ip='$ip' AND tanggal='$tanggal'");
  }

  $pengunjung       = mysql_num_rows(mysql_query("SELECT * FROM statistik WHERE tanggal='$tanggal' GROUP BY ip"));
  $totalpengunjung  = mysql_result(mysql_query("SELECT COUNT(hits) FROM statistik"), 0); 
  $hits             = mysql_fetch_assoc(mysql_query("SELECT SUM(hits) as hitstoday FROM statistik 
  WHERE tanggal='$tanggal' GROUP BY  tanggal")); 
  $totalhits        = mysql_result(mysql_query("SELECT SUM(hits) FROM statistik"), 0); 
  $tothitsgbr       = mysql_result(mysql_query("SELECT SUM(hits) FROM statistik"), 0); 
  $bataswaktu       = time() - 300;
  $pengunjungonline = mysql_num_rows(mysql_query("SELECT * FROM statistik WHERE online > '$bataswaktu'"));

  $path = "counter/";
  $ext = ".png";

  $tothitsgbr = sprintf("%06d", $tothitsgbr);
  for ( $i = 0; $i <= 9; $i++ ){
	   $tothitsgbr = str_replace($i, "<img src='$path$i$ext' alt='$i'>", $tothitsgbr);
  }

  echo "
 <p align=right><b>Pengunjung Website : $pengunjungonline </b><br />
 <b>Hits Hari Ini: $hits[hitstoday] </b></p><br />";
   echo " </div>";
}
  } else {
  
 echo "<div id='main-content'>
 <div class='container_12'>
 <div class='grid_12'>";
  include "modul/mod_penduduk/penduduk_home.php";
 echo "</div>";
  echo " </div>";
 }
}

// Bagian Program Kerja
elseif ($_GET[module]=='proker'  OR $_SESSION['leveluser']=='user'){
  if ($_SESSION['leveluser']=='admin'){
    include "modul/mod_proker/proker.php";
  }
}

// Bagian Realisasi
elseif ($_GET['module']=='realisasi'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_realisasi/realisasi.php";
  }
}

// Bagian User
elseif ($_GET['module']=='user'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION[leveluser]=='user'){
    include "modul/mod_users/users.php";
  }
}

// Bagian Modul
elseif ($_GET['module']=='modul'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_modul/modul.php";
  }
}

// Bagian Kategori
elseif ($_GET['module']=='kategori'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_kategori/kategori.php";
  }
}

// Bagian Berita
elseif ($_GET['module']=='berita'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user' OR $_SESSION['leveluser']=='kontributor'){
    include "modul/mod_berita/berita.php";                            
  }
}

// Bagian Komentar Berita
elseif ($_GET['module']=='komentar'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_komentar/komentar.php";
  }
}

// Bagian Tag
elseif ($_GET['module']=='tag'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_tag/tag.php";
  }
}

// Bagian Alamat
elseif ($_GET['module']=='alamat'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_alamat/alamat.php";
  }
}

// Bagian Download
elseif ($_GET['module']=='arsip'){
    if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_arsip/arsip.php";
  }
}

// Bagian Hubungi Kami
elseif ($_GET['module']=='hubungi'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_hubungi/hubungi.php";
  }
}

// Bagian Templates
elseif ($_GET['module']=='templates'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_templates/templates.php";
  }
}

// Bagian Album
elseif ($_GET['module']=='album'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_album/album.php";
  }
}

// Bagian Galeri Foto
elseif ($_GET['module']=='galerifoto'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_galerifoto/galerifoto.php";
  }
}

// Bagian Menu Utama
elseif ($_GET['module']=='menu'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_menu/menu.php";
  }
}

// Bagian Halaman Statis
elseif ($_GET['module']=='halamanstatis'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_halamanstatis/halamanstatis.php";
  }
}

// Bagian Sekilas Info
elseif ($_GET['module']=='sekilasinfo'){
    if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_sekilasinfo/sekilasinfo.php";
  }
}

// Bagian Logo
elseif ($_GET[module]=='logo'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_logo/logo.php";
  }
}

// Bagian Video
elseif ($_GET['module']=='video'){
  if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_video/video.php";
  }
}

// Bagian Identitas Website
elseif ($_GET['module']=='identitas'){
   if ($_SESSION['leveluser']=='admin' OR $_SESSION['leveluser']=='user'){
    include "modul/mod_identitas/identitas.php";
  }
}

// Apabila modul tidak ditemukan
else{
  echo "<p><b> MODUL BELUM ADA ATAU BELUM LENGKAP</b></p>";
}


?>