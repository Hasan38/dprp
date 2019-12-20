<div class="col-md-12">
	<section class="cat-widget wdg-cat-horiz-2col-sm clearfix">
		<?php 
			$random = mysqli_query($conn,"SELECT * FROM kategori where sidebar='1'"); 
			while ($r = mysqli_fetch_array($random)){
		    echo "<div class='widget-title'>
					<span style='color:#000; font-size:16px; font-weight:bold' class='sub-title'>$r[nama_kategori]</span>
					<div class='sep-widget'></div>
				  </div>";
				echo "<div class='related-posts'>";

				$random2 = mysqli_query($conn,"SELECT * FROM berita 
					left join users on berita.username=users.username
					left join kategori on berita.id_kategori=kategori.id_kategori
					where berita.id_kategori='$r[id_kategori]' order by id_berita DESC LIMIT 0,3");
				$no = 1;
				while ($r2 = mysqli_fetch_array($random2)){
					$isi_berita = strip_tags($r2['isi_berita']); 
					$isi = substr($isi_berita,0,300); 
					$isi = substr($isi_berita,0,strrpos($isi," "));
					echo "<div class='post-item odd-item' data-showonscroll='true' data-animation='fadeIn'>
								<article class='post-box clearfix'>
								<header class='wdg-col-8 sec-title'>
								<h5><a style='color:orange' href='berita-$r2[judul_seo].html' title='$r2[judul]'>$r2[judul]</a></h5>
								<div class='meta-info'>
								<span class='author'><i class='icon-user3'></i><a href='#'>$r2[nama_lengkap]</a></span>
								<span class='date'><i class='icon-alarm2'></i>".tgl_indo($r2['tanggal'])."</span><hr style='margin:5px'>
								<span style='color:#000'>$isi ...</span>
								</div>
								</header>
								</article>
								</div><div style='clear:both'><br></div>";
					$no++;
				}
			}
		?>  
		</div>
	</section>
</div>
<div class="col-md-12">
	<section class="cat-widget wdg-cat-horiz-2col-sm clearfix">
		<div class='widget-title'>
			<!-- <span style='color:#000; font-size:16px; font-weight:bold' class='sub-title'>Lokasi Kantor Desa</span> -->
			<span style='color:#000; font-size:16px; font-weight:bold' class='sub-title'> </span>
			<div class='sep-widget'></div>
		</div>
    <div class="related-posts">
			<?php
				// $ma=mysql_fetch_array(mysql_query("SELECT * FROM identitas"));
				// echo "<iframe width='100%'' height='300' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='$ma[maps]'></iframe><hr style='margin:5px'>";
    		// $alamat = mysql_fetch_array(mysql_query("SELECT * FROM mod_alamat")); echo "$alamat[alamat]";
    	?>
    </div>
	</section>
</div>