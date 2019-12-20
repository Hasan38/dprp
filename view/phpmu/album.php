<article class="article-container" itemscope itemtype="http://schema.org/Article">
	<div class="article-content blog-page">
		<header><h1 itemprop="headline">Album Foto</h1><div class="divider"></div></header>
		<div class="post-entry" itemprop="articleBody"></div>
		<div class="related-posts">
			<?php 
				$hot = mysqli_query($conn,"SELECT * FROM album ORDER BY id_album DESC LIMIT 25"); 
				$no = 1;
				while($h=mysqli_fetch_array($hot)){ 	
				$jumlah = mysqli_num_rows(mysqli_query($conn,"SELECT * FROM gallery where id_album='$h[id_album]'"));
				 $tgl = tgl_indo($h['tgl_posting']);
					echo "<div class='col-md-6'><a style='color:orange' href='album-$h[id_album]-$h[album_seo].html'><b>$h[jdl_album]</b></a><br>
							<span class='tanggal01'><span> $h[hari], $tgl</span>
							<span class style=\"color:#EA1C1C;\"> | </span>dilihat: $h[hits_album] pengunjung</span>
							
					  		<div style='max-height:180px; overflow:hidden; width:100%' href='#' class='post-thumbnail'>";
									if ($h[gbr_album] ==''){
										echo "<a class='hover-effect' href='album-$h[id_album]-$h[album_seo].html'><img class='img-thumbnail' style='width:100%' src='foto_berita/no-image.jpg' alt='' /></a>";
									}else{
										echo "<a class='hover-effect' href='album-$h[id_album]-$h[album_seo].html'><img class='img-thumbnail' style='width:100%' src='img_album/$h[gbr_album]' alt='' /></a>";
									}
							echo "</div><center>Ada $jumlah Foto</center>
							</div>";
						if ($no % 2 == 0){
							echo "<div style='clear:both'><hr></div>";
						}
					$no++;
				}
			?>
		</div>
	</div>
</article>