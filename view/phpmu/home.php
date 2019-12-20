<div class="col-md-12">
	<section class="cat-widget wdg-cat-horiz-2col-sm clearfix">
	<?php
		$random = mysqli_query($conn,"SELECT * FROM kategori where sidebar='1'");
		$r = mysqli_fetch_array($random);
	    echo "<div class='widget-title'>
				<span style='color:#000; font-size:16px; font-weight:bold' class='sub-title'>$r[nama_kategori]</span>
				<div class='sep-widget'></div>
			  </div>";
	?>
    <div class="related-posts">
			<?php
				$random2 = mysqli_query($conn,"SELECT * FROM berita
								left join users on berita.username=users.username
								left join kategori on berita.id_kategori=kategori.id_kategori
								where berita.id_kategori='$r[id_kategori]' order by id_berita DESC LIMIT 0,3");
				$no = 1;
				while ($r2 = mysqli_fetch_array($random2)){
				$isi_berita = strip_tags($r2['isi_berita']);
				$isi = substr($isi_berita,0,300);
				$isi = substr($isi_berita,0,strrpos($isi," "));
				echo "<figure class='wdg-col-8 sec-image'>
															<div class='mask-background white'></div>
															<div class='post-type anim'><i class='icon-camera2'></i></div>
															<div class='post-thumbnail border-radius-2px'>";
							if ($r2['gambar'] ==''){
								echo "<img style='width : 600px; height: 200px;' src='foto_berita/no-image.jpg' alt='no-image.jpg' /></a>";
							}else{
								echo "<img style='width : 600px; height: 200px;' src='foto_berita/$r2[gambar]' alt='$r2[gambar]' /></a>";
							}
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
			?>
    </div>
	</section>
</div>

<!-- video youtube -->
<div class="col-md-12">
	<section class="cat-widget wdg-cat-horiz-2col-sm clearfix">
		<div class='widget-title'>
			<span style='color:#000; font-size:16px; font-weight:bold' class='sub-title'>Video Terbaru</span>
			<div class='sep-widget'></div>
		</div>
            <div class="related-posts">
				<?php
				  $terkini2=mysqli_query($conn,"select * from video ORDER BY id_video DESC LIMIT 2");
				  while($d=mysqli_fetch_array($terkini2)){
				  $baca = $d['dilihat']+1;
				  $tgl = tgl_indo($d['tanggal']);
				  echo "<div class='col-md-6'><a href=play-$d[id_video]-$d[video_seo].html title='$d[jdl_video]'><b>$d[jdl_video]</b></a>
				  		<iframe itemprop='contentURL' class='youtube-player' type='text/html' width='100%' height='170' src='$d[youtube]' ?rel='0' frameborder='0' play='0' allowfullscreen></iframe>
				  		<p><span class='tanggal01'><span> $d[hari], $tgl</span>
						  <span class style=\"color:#EA1C1C;\"> | </span>dilihat: $baca pengunjung</span>
						</p></div>";
				  }
				?>
            </div>
            <div style='clear:both'></div>
	</section>
</div>

<div class="col-md-12">
	<section class="cat-widget wdg-cat-horiz-2col-sm clearfix">
		<div class='widget-title'>
			<span style='color:#000; font-size:16px; font-weight:bold' class='sub-title'>Lokasi Kantor</span>
			<span style='color:#000; font-size:16px; font-weight:bold' class='sub-title'> </span>
			<div class='sep-widget'></div>
		</div>
    <div class="related-posts">
			<?php
				$ma=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM identitas"));
				echo "<iframe width='100%'' height='300' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='$ma[maps]'></iframe><hr style='margin:5px'>";
    		$alamat = mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM mod_alamat")); echo "$alamat[alamat]";
    	?>
    </div>
	</section>
</div>
