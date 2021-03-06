<article class="article-container clearfix" itemscope itemtype="http://schema.org/Article">
	<div class="article-content clearfix">
		<header>
			<h1 itemprop="headline">Saran, Kritik &amp; Komentar melalui Form di bawah ini</h1>
			<div class="post-meta">
				<ul>
					<?php
					$aut = mysqli_query($conn,"SELECT * FROM users where level='admin'");
					$a = mysqli_fetch_array($aut);
					?>
					<li><i class="icon-user3"></i><a href="#"><?php echo "$a[nama_lengkap]"; ?></a></li>
					<li><i class="icon-library"></i><a href="#"><?php echo "$a[email]"; ?></a></li>

					<li itemprop="datePublished"><i class="icon-alarm2"></i><?php echo "$tgl, $jam_sekarang WIB"; ?></li>
				</ul>
			</div>
			<div class="divider"></div>
		</header>
		<div class="post-entry" itemprop="articleBody">
			<p>Kami memiliki komitmen untuk memberikan  layanan terbaik kepada Anda. Apabila untuk alasan tertentu Anda merasa tidak puas dengan pelayanan kami, Anda dapat menyampaikan kritik dan saran Anda kepada kami. Kami akan menidaklanjuti masukan yang Anda berikan dan bila perlu mengambil tindakan untuk mencegah masalah yang sama terulang kembali.</p>
			<p>Kritik dan saran Anda sangat penting bagi kami untuk terus meningkatkan kualitas layanan yang kami berikan kepada Anda.</p></div>
			<aside class="cat-widget comments-box clearfix" itemprop="comment" itemscope="" itemtype="http://schema.org/UserComments">
				<div class="widget-content color-theme clearfix">
					<div class="comments">
						<script type="text/javascript">
							function validasi(form){
								if (form.nama.value == ""){
								alert("Anda belum mengisikan Nama");
								form.nama.focus();
								return (false);
							}

							if (form.emailr.value == ""){
								alert("Anda belum mengisikan Email");
								form.emailr.focus();
								return (false);
							}

							if (form.pesan.value == ""){
								alert("Anda belum mengisikan Pesan / Message!!!");
								form.pesan.focus();
								return (false);
							}

							if (form.kode.value == ""){
								alert("Anda belum mengisikan Kode!!!");
								form.kode.focus();
								return (false);
							}
								return (true);
							}
						</script>
						<div id="respond" class="comment-respond" data-showonscroll="true" data-animation="fadeIn">
						<h3 id="reply-title" class="comment-reply-title">Saran, Kritik  &amp; Komentar</h3>

						<form action="hubungi-aksi.html" method="POST" onSubmit="return validasi(this)" id="commentform" class="comment-form">
							<p class="comment-form-author">
								<label for="author">Nama <span class="required">*</span></label>
								<input id="author" name='nama' type="text" size="50" aria-required="true">
							</p>
							<p class="comment-form-email">
								<label for="email">Email <span class="required">*</span></label>
								<input id="email" name='emailr' type="text" size="50" aria-required="true">
							</p>
							<p class="comment-form-email">
								<label for="email">Judul / Topik </label>
								<input id="email" name='subjek' type="text" size="50" aria-required="true">
							</p>
							<p class="comment-form-comment">
								<label for="email">Komentar <span class="required">*</span></label>
								<textarea id="comment" name='pesan' cols="50" rows="6" aria-required="true"></textarea>
							</p>
							<p class="comment-form-comment">
								<img src='captcha.php'><br>Masukkan 6 kode diatas)<br>
								<input name='kode' maxlength=6 type="text" value="" size="30" aria-required="true">
							</p>
							<p class="form-submit">
								<input name="submit" type="submit" id="submit" value="Kirimkan">
							</p>
						</form>
					</div>
				</div>
			</div>
		</aside>
	</div>
</article>