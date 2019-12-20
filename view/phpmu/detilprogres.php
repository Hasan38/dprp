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
<article class="article-container clearfix" itemscope itemtype="http://schema.org/Article">
<div class="article-content clearfix">
	<?php
    $tampil=mysqli_query($conn,"SELECT * FROM proker WHERE idproker=".anti_injection($_GET['ipr'])."");
    while ($r=mysqli_fetch_array($tampil)){
      $tglmulai   = tgl_indo($r[tglmulai]);
      $tglselesai = tgl_indo($r[tglselesai]);
      $realmulai   = tgl_indo($r[realmulai]);
      $realselesai = tgl_indo($r[realselesai]);

      $t1=substr("$r[tglmulai]",8,2);
      $b1=substr("$r[tglmulai]",5,2);
      $b2=substr("$r[tglselesai]",5,2);
      if ($b1==$b2) {$tglm=$t1.' s/d '.$tglselesai;}else{$tglm=$tglmulai.' s/d '.$tglselesai;}

      $t1=substr("$r[realmulai]",8,2);
      $b1=substr("$r[realmulai]",5,2);
      $b2=substr("$r[realselesai]",5,2);
      if ($b1==$b2) {$tglr=$t1.' s/d '.$realselesai;}else{$tglr=$realmulai.' s/d '.$realselesai;}
      if ($r[realpeserta]==0) {$tglr='-'; $pst = '-';}else{$pst=$r[realpeserta];}
      $namaproker=strtoupper($r[namaproker]);
      echo "
      <h2>$namaproker</h2><hr>
      <table>
      <tr><td width=200>Program Kerja</td><td>: <b>$r[namaproker]</b></td></tr>
      <tr><td>Sasaran</td><td>: <b>$r[sasaran]</b></td></tr>
      <tr><td>Lokasi</td><td>: <b>$r[lokasi]</b></td></tr>
      <tr><td>Pagu Anggaran</td><td>: <b>Rp. ".number_format($r[pagu],0,",",".").",-</b></td></tr>
      <tr><td colspan =2><h4><b><u>Rencana Pelaksanaan :</u></b></h4></td></tr>
      <tr><td>Tanggal</td><td>: <b>$tglm</b></td></tr>
      <tr><td>Peserta</td><td>: <b>$r[targetpeserta] </b>orang</td></tr>
      <tr><td colspan =2><h4><b><u>Realisasi :</u></b></h4></td></tr>
      <tr><td>Tanggal</td><td>: <b>$tglr</b></td></tr>
      <tr><td>Peserta</td><td>: <b>$pst </b>orang</td></tr>
      <tr><td>Dana Terserap</td><td>: <b>Rp. ".number_format($r[danaterserap],0,",",".").",-</b></td></tr>
      </table>";
   }
  ?>
</div>
</article>
