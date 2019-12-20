<article class="article-container" itemscope itemtype="http://schema.org/Article">
  <div class="article-content blog-page">
    <header>
      <h2 itemprop="headline">LEMARI ARSIP</h2>
      <div class="divider"></div>
    </header>
    <div class="post-entry" itemprop="articleBody"></div>
    <div class="blog-items style-1">
      <?php
      $thn = date('Y');
      echo "<table id='example1' class='table table-striped'>
            <tbody>";
      $no=1;
      $tampil=mysql_query("SELECT * FROM download ORDER BY id_download DESC");
      while ($r=mysql_fetch_array($tampil)){
        $lebar=strlen($no);
        if (lebar<2) {$g="0".$no;}else{$g=$no;}
        echo "<tr class=gradeX>
        <td width=10><center>$g</center></td>
        <td>$r[judul]</td>
        <td width=50>";
          echo "<button type='button' class='btn btn-xs btn-success' onclick= \"window.location.href='downlot.php?file=".$r[nama_file]."'\"></i>Download</button>";
        echo "</td></tr>";    
        $no++;
      }
      echo "</tbody></table>";
      ?>
    </div>
  </div>
</article>



