<article class="article-container" itemscope itemtype="http://schema.org/Article">
  <div class="article-content blog-page">
    <header>
      <h2 itemprop="headline">Kinerja DPRD Kab. Keerom Tahun 2018</h2>
      <div class="divider"></div>
    </header>
    <div class="post-entry" itemprop="articleBody"></div>
    <div class="blog-items style-1">

       <?php
        $sql = mysql_query("SELECT id_kategori,
                  COUNT(IF(MONTH(tglmulai) = 1, idproker, NULL)) AS m1,
                  COUNT(IF(MONTH(tglmulai) = 2, idproker, NULL)) AS m2,
                  COUNT(IF(MONTH(tglmulai) = 3, idproker, NULL)) AS m3,
                  COUNT(IF(MONTH(tglmulai) = 4, idproker, NULL)) AS m4,
                  COUNT(IF(MONTH(tglmulai) = 5, idproker, NULL)) AS m5,
                  COUNT(IF(MONTH(tglmulai) = 6, idproker, NULL)) AS m6,
                  COUNT(IF(MONTH(tglmulai) = 7, idproker, NULL)) AS m7,
                  COUNT(IF(MONTH(tglmulai) = 8, idproker, NULL)) AS m8,
                  COUNT(IF(MONTH(tglmulai) = 9, idproker, NULL)) AS m9,
                  COUNT(IF(MONTH(tglmulai) = 10, idproker, NULL)) AS m10,
                  COUNT(IF(MONTH(tglmulai) = 11, idproker, NULL)) AS m11,
                  COUNT(IF(MONTH(tglmulai) = 12, idproker, NULL)) AS m12,
                  COUNT(IF(MONTH(tglmulai) != 0, idproker, NULL)) AS tfisik,

                  COUNT(IF(MONTH(realmulai) = 1, idproker, NULL)) AS r1,
                  COUNT(IF(MONTH(realmulai) = 2, idproker, NULL)) AS r2,
                  COUNT(IF(MONTH(realmulai) = 3, idproker, NULL)) AS r3,
                  COUNT(IF(MONTH(realmulai) = 4, idproker, NULL)) AS r4,
                  COUNT(IF(MONTH(realmulai) = 5, idproker, NULL)) AS r5,
                  COUNT(IF(MONTH(realmulai) = 6, idproker, NULL)) AS r6,
                  COUNT(IF(MONTH(realmulai) = 7, idproker, NULL)) AS r7,
                  COUNT(IF(MONTH(realmulai) = 8, idproker, NULL)) AS r8,
                  COUNT(IF(MONTH(realmulai) = 9, idproker, NULL)) AS r9,
                  COUNT(IF(MONTH(realmulai) = 10, idproker, NULL)) AS r10,
                  COUNT(IF(MONTH(realmulai) = 11, idproker, NULL)) AS r11,
                  COUNT(IF(MONTH(realmulai) = 12, idproker, NULL)) AS r12
                FROM proker 
                GROUP BY id_kategori");
        $mf1=0; $mf2=0; $mf3=0; $mf4=0; $mf5=0; $mf6=0; $mf =0; $mf8=0; $mf9=0; $mf10=0; $mf11=0; $mf12=0; 
        $rf1=0; $rf2=0; $rf3=0; $rf4=0; $rf5=0; $rf6=0; $rf =0; $rf8=0; $rf9=0; $rf10=0; $rf11=0; $rf12=0; 

        while($k=mysql_fetch_array($sql)){
          $mf1 = $mf1 + $k[m1]; $mf5 = $mf5 + $k[m5]; $mf9  = $mf9 + $k[m9]; 
          $mf2 = $mf2 + $k[m2]; $mf6 = $mf6 + $k[m6]; $mf10 = $mf10 + $k[m10];
          $mf3 = $mf3 + $k[m3]; $mf7 = $mf7 + $k[m7]; $mf11 = $mf11 + $k[m11];
          $mf4 = $mf4 + $k[m4]; $mf8 = $mf8 + $k[m8]; $mf12 = $mf12 + $k[m12];
          $tfs = $tfs + $k[tfisik];
           
          $rf1 = $rf1 + $k[r1]; $rf5 = $rf5 + $k[r5]; $rf9  = $rf9 + $k[r9]; 
          $rf2 = $rf2 + $k[r2]; $rf6 = $rf6 + $k[r6]; $rf10 = $rf10 + $k[r10];
          $rf3 = $rf3 + $k[r3]; $rf7 = $rf7 + $k[r7]; $rf11 = $rf11 + $k[r11];
          $rf4 = $rf4 + $k[r4]; $rf8 = $rf8 + $k[r8]; $rf12 = $rf12 + $k[r12];   
          $rfs = $rfs + $k[trfisik];
        }
        $nmf1=($mf1/$tfs)*100;
        $nmf2=(($mf1+$mf2)/$tfs)*100; 
        $nmf3=(($mf1+$mf2+$mf3)/$tfs)*100; 
        $nmf4=(($mf1+$mf2+$mf3+$mf4)/$tfs)*100; 
        $nmf5=(($mf1+$mf2+$mf3+$mf4+$mf5)/$tfs)*100; 
        $nmf6=(($mf1+$mf2+$mf3+$mf4+$mf5+$mf6)/$tfs)*100; 
        $nmf7=(($mf1+$mf2+$mf3+$mf4+$mf5+$mf6+$mf7)/$tfs)*100; 
        $nmf8=(($mf1+$mf2+$mf3+$mf4+$mf5+$mf6+$mf7+$mf8)/$tfs)*100; 
        $nmf9=(($mf1+$mf2+$mf3+$mf4+$mf5+$mf6+$mf7+$mf8+$mf9)/$tfs)*100; 
        $nmf10=(($mf1+$mf2+$mf3+$mf4+$mf5+$mf6+$mf7+$mf8+$mf9+$mf10)/$tfs)*100; 
        $nmf11=(($mf1+$mf2+$mf3+$mf4+$mf5+$mf6+$mf7+$mf8+$mf9+$mf10+$mf11)/$tfs)*100; 
        $nmf12=(($mf1+$mf2+$mf3+$mf4+$mf5+$mf6+$mf7+$mf8+$mf9+$mf10+$mf11+$mf12)/$tfs)*100; 

        $nrf1=($rf1/$rfs)*100;
        $nrf2=(($rf1+$rf2)/$tfs)*100; 
        $nrf3=(($rf1+$rf2+$rf3)/$tfs)*100; 
        $nrf4=(($rf1+$rf2+$rf3+$rf4)/$tfs)*100; 
        $nrf5=(($rf1+$rf2+$rf3+$rf4+$rf5)/$tfs)*100; 
        $nrf6=(($rf1+$rf2+$rf3+$rf4+$rf5+$rf6)/$tfs)*100; 
        $nrf7=(($rf1+$rf2+$rf3+$rf4+$rf5+$rf6+$rf7)/$tfs)*100; 
        $nrf8=(($rf1+$rf2+$rf3+$rf4+$rf5+$rf6+$rf7+$rf8)/$tfs)*100; 
        $nrf9=(($rf1+$rf2+$rf3+$rf4+$rf5+$rf6+$rf7+$rf8+$rf9)/$tfs)*100; 
        $nrf10=(($rf1+$rf2+$rf3+$rf4+$rf5+$rf6+$rf7+$rf8+$rf9+$rf10)/$tfs)*100; 
        $nrf11=(($rf1+$rf2+$rf3+$rf4+$rf5+$rf6+$rf7+$rf8+$rf9+$rf10+$rf11)/$tfs)*100; 
        $nrf12=(($rf1+$rf2+$rf3+$rf4+$rf5+$rf6+$rf7+$rf8+$rf9+$rf10+$rf11+$rf12)/$tfs)*100; 

        $sql = mysql_query("SELECT a.id_kategori, b.nama_kategori, 
                  SUM(IF(MONTH(a.tglmulai) = 1, a.pagu, 0)) AS m1,
                  SUM(IF(MONTH(a.tglmulai) = 2, a.pagu, 0)) AS m2,
                  SUM(IF(MONTH(a.tglmulai) = 3, a.pagu, 0)) AS m3,
                  SUM(IF(MONTH(a.tglmulai) = 4, a.pagu, 0)) AS m4,
                  SUM(IF(MONTH(a.tglmulai) = 5, a.pagu, 0)) AS m5,
                  SUM(IF(MONTH(a.tglmulai) = 6, a.pagu, 0)) AS m6,
                  SUM(IF(MONTH(a.tglmulai) = 7, a.pagu, 0)) AS m7,
                  SUM(IF(MONTH(a.tglmulai) = 8, a.pagu, 0)) AS m8,
                  SUM(IF(MONTH(a.tglmulai) = 9, a.pagu, 0)) AS m9,
                  SUM(IF(MONTH(a.tglmulai) = 10, a.pagu, 0)) AS m10,
                  SUM(IF(MONTH(a.tglmulai) = 11, a.pagu, 0)) AS m11,
                  SUM(IF(MONTH(a.tglmulai) = 12, a.pagu, 0)) AS m12,
                  SUM(IF(MONTH(a.tglmulai) != 12, a.pagu, 0)) AS tru,

                  SUM(IF(MONTH(a.realmulai) = 1, a.danaterserap, 0)) AS r1,
                  SUM(IF(MONTH(a.realmulai) = 2, a.danaterserap, 0)) AS r2,
                  SUM(IF(MONTH(a.realmulai) = 3, a.danaterserap, 0)) AS r3,
                  SUM(IF(MONTH(a.realmulai) = 4, a.danaterserap, 0)) AS r4,
                  SUM(IF(MONTH(a.realmulai) = 5, a.danaterserap, 0)) AS r5,
                  SUM(IF(MONTH(a.realmulai) = 6, a.danaterserap, 0)) AS r6,
                  SUM(IF(MONTH(a.realmulai) = 7, a.danaterserap, 0)) AS r7,
                  SUM(IF(MONTH(a.realmulai) = 8, a.danaterserap, 0)) AS r8,
                  SUM(IF(MONTH(a.realmulai) = 9, a.danaterserap, 0)) AS r9,
                  SUM(IF(MONTH(a.realmulai) = 10, a.danaterserap, 0)) AS r10,
                  SUM(IF(MONTH(a.realmulai) = 11, a.danaterserap, 0)) AS r11,
                  SUM(IF(MONTH(a.realmulai) = 12, a.danaterserap, 0)) AS r12
                FROM proker a INNER JOIN kategori b ON a.id_kategori = b.id_kategori
                GROUP BY a.id_kategori");
        while($k=mysql_fetch_array($sql)){
          $mu1 = $mu1 + $k[m1]; $mu5 = $mu5 + $k[m5]; $mu9  = $mu9 + $k[m9]; 
          $mu2 = $mu2 + $k[m2]; $mu6 = $mu6 + $k[m6]; $mu10 = $mu10 + $k[m10];
          $mu3 = $mu3 + $k[m3]; $mu7 = $mu7 + $k[m7]; $mu11 = $mu11 + $k[m11];
          $mu4 = $mu4 + $k[m4]; $mu8 = $mu8 + $k[m8]; $mu12 = $mu12 + $k[m12];
          $tru = $tru + $k[tru];
           
          $ru1 = $ru1 + $k[r1]; $ru5 = $ru5 + $k[r5]; $ru9  = $ru9 + $k[r9]; 
          $ru2 = $ru2 + $k[r2]; $ru6 = $ru6 + $k[r6]; $ru10 = $ru10 + $k[r10];
          $ru3 = $ru3 + $k[r3]; $ru7 = $ru7 + $k[r7]; $ru11 = $ru11 + $k[r11];
          $ru4 = $ru4 + $k[r4]; $ru8 = $ru8 + $k[r8]; $ru12 = $ru12 + $k[r12];  
        }
        $nmu1=($mu1/$tru)*100;
        $nmu2=(($mu1+$mu2)/$tru)*100; 
        $nmu3=(($mu1+$mu2+$mu3)/$tru)*100; 
        $nmu4=(($mu1+$mu2+$mu3+$mu4)/$tru)*100; 
        $nmu5=(($mu1+$mu2+$mu3+$mu4+$mu5)/$tru)*100; 
        $nmu6=(($mu1+$mu2+$mu3+$mu4+$mu5+$mu6)/$tru)*100; 
        $nmu7=(($mu1+$mu2+$mu3+$mu4+$mu5+$mu6+$mu7)/$tru)*100; 
        $nmu8=(($mu1+$mu2+$mu3+$mu4+$mu5+$mu6+$mu7+$mu8)/$tru)*100; 
        $nmu9=(($mu1+$mu2+$mu3+$mu4+$mu5+$mu6+$mu7+$mu8+$mu9)/$tru)*100; 
        $nmu10=(($mu1+$mu2+$mu3+$mu4+$mu5+$mu6+$mu7+$mu8+$mu9+$mu10)/$tru)*100; 
        $nmu11=(($mu1+$mu2+$mu3+$mu4+$mu5+$mu6+$mu7+$mu8+$mu9+$mu10+$mu11)/$tru)*100; 
        $nmu12=(($mu1+$mu2+$mu3+$mu4+$mu5+$mu6+$mu7+$mu8+$mu9+$mu10+$mu11+$mu12)/$tru)*100; 

        $nru1=($ru1/$rus)*100;
        $nru2=(($ru1+$ru2)/$tru)*100; 
        $nru3=(($ru1+$ru2+$ru3)/$tru)*100; 
        $nru4=(($ru1+$ru2+$ru3+$ru4)/$tru)*100; 
        $nru5=(($ru1+$ru2+$ru3+$ru4+$ru5)/$tru)*100; 
        $nru6=(($ru1+$ru2+$ru3+$ru4+$ru5+$ru6)/$tru)*100; 
        $nru7=(($ru1+$ru2+$ru3+$ru4+$ru5+$ru6+$ru7)/$tru)*100; 
        $nru8=(($ru1+$ru2+$ru3+$ru4+$ru5+$ru6+$ru7+$ru8)/$tru)*100; 
        $nru9=(($ru1+$ru2+$ru3+$ru4+$ru5+$ru6+$ru7+$ru8+$ru9)/$tru)*100; 
        $nru10=(($ru1+$ru2+$ru3+$ru4+$ru5+$ru6+$ru7+$ru8+$ru9+$ru10)/$tru)*100; 
        $nru11=(($ru1+$ru2+$ru3+$ru4+$ru5+$ru6+$ru7+$ru8+$ru9+$ru10+$ru11)/$tru)*100; 
        $nru12=(($ru1+$ru2+$ru3+$ru4+$ru5+$ru6+$ru7+$ru8+$ru9+$ru10+$ru11+$ru12)/$tru)*100; 
      ?>
      <div style="width:100%; border:2px solid ;color:blue;"><canvas id="fisik"></canvas></div> 
      <br><br><br> 
      <div style="width:100%; border:2px solid ;color:green;"><canvas id="keuangan"></canvas></div>   
      <br><br><br> 
      <div style="width:100%; border:2px solid; padding: 5px;">
        <?php
        $thn = date('Y');
        echo "<table id='example1' class='table table-bordered table-striped'>
              <caption><h4>TABEL PROGRAM DAN REALISASI TA $thn</h4><br></caption>
              <thead>
                <tr><th>No</th>
                <th>Program Kerja</th>
                <th>Sasaran</th>
                <th>Rencana</th>
                <th>Realisasi</th>
                </tr>
              </thead>
              <tbody>";
        $no=1;
        $tampil=mysqli_query($conn,"SELECT * FROM proker WHERE year(tglmulai) = $thn ORDER BY idproker");
        while ($r=mysqli_fetch_array($tampil)){
          $tglmulai   = tgl_indo($r[tglmulai]);
          $tglselesai = tgl_indo($r[tglselesai]);

          $t1=substr("$r[tglmulai]",8,2);
          $b1=substr("$r[tglmulai]",5,2);
          $b2=substr("$r[tglselesai]",5,2);
          if ($b1==$b2) {$tgl=$t1.' s/d '.$tglselesai;}else{$tgl=$tglmulai.' s/d '.$tglselesai;}
          $lebar=strlen($no);
          if (lebar<2) {$g="0".$no;}else{$g=$no;}
          echo "<tr class=gradeX>
          <td width=10><center>$g</center></td>
          <td>$r[namaproker]</td>
          <td>$r[sasaran]</td>
          <td>$r[lokasi]<br>$tgl<br>$r[targetpeserta] org</td>
          <td width=50>";
          if ($r[realpeserta] !=0) {
            echo "<button type='button' class='btn btn-success' onclick= \"window.location.href='progres-".$r[idproker]."-".$r[prokerseo].".html'\"></i>Sudah</button>";
          }else{
            echo "<button type='button' class='btn btn-warning' onclick= \"window.location.href='progres-".$r[idproker]."-".$r[prokerseo].".html'\"></i>Belum</button>";
          }
          echo "</td></tr>";    
          $no++;
        }
        echo "</tbody></table>";
        ?>

      </div>   
    </div>
  </div>
</article>

<script>
  window.onload = function()
  {
    var ctx = document.getElementById("fisik");
    var fisik = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli","Agustus","September","Oktober","Nopember","Desember"],
        datasets: [
          <?php
            $i=1;
          ?>
          {
            backgroundColor: <?php echo '"'.$w[$i].'"';?>,
            borderColor: <?php echo '"'.$wb[$i].'"';?>,
            pointBorderColor: <?php echo '"'.$w[$i].'"';?>,
            pointBackgroundColor: <?php echo '"'.$wb[$i].'"';?>,
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: '#000',
            pointBorderWidth: 1,
            label: 'Rencana (%) ',
            data: [<?php
                    $dt[1]=$nmf1; $dt[2] =$nmf2;  $dt[3] =$nmf3;  $dt[4] =$nmf4;
                    $dt[5]=$nmf5; $dt[6] =$nmf6;  $dt[7] =$nmf7;  $dt[8] =$nmf8;
                    $dt[9]=$nmf9; $dt[10]=$nmf10; $dt[11]=$nmf11; $dt[12]=$nmf12;
                    for ($n=1; $n<=12; $n++) {
                      echo "".number_format($dt[$n],2).",";
                    }
                   ?>],
            fill: false,
          },

          <?php
            $i++;
          ?>
          {
            backgroundColor: <?php echo '"'.$w[$i].'"';?>,
            borderColor: <?php echo '"'.$wb[$i].'"';?>,
            pointBorderColor: <?php echo '"'.$w[$i].'"';?>,
            pointBackgroundColor: <?php echo '"'.$wb[$i].'"';?>,
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: '#000',
            pointBorderWidth: 1,
            label: 'Realisasi (%) ',
            data: [<?php
                    $dt[1]=$nrf1; $dt[2] =$nrf2;  $dt[3] =$nrf3;  $dt[4] =$nrf4;
                    $dt[5]=$nrf5; $dt[6] =$nrf6;  $dt[7] =$nrf7;  $dt[8] =$nrf8;
                    $dt[9]=$nrf9; $dt[10]=$nrf10; $dt[11]=$nrf11; $dt[12]=$nrf12;
                    for ($n=1; $n<=date('m'); $n++) {
                      echo "".number_format($dt[$n],2).",";
                    }
                   ?>],
            fill: false,
          }
        ]
      },
      options: {
        responsive: true,
        title:{
            display:true,
            text:'PROGRESS FISIK'
        },
          legend: {
            display: true,
            position: 'bottom',
            labels: {
              boxWidth: 30,
              fontColor: 'rgba(60, 180, 100,1)'
            }
          },
        scales: {
          xAxes: [{
            display: true,
            scaleLabel: {
              display: true,
              labelString: ''
            }
          }],
            yAxes: [{
              display: true,
              scaleLabel: {
                display: false,
                labelString: 'Persentasi Perkembangan'
              },
              ticks: {
                min: 0,
                max: 100,
                // forces step size to be 5 units
                stepSize: 10
              }
            }]
        }
      }                  
    });

    var ctx = document.getElementById("keuangan");
    var fisik = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli","Agustus","September","Oktober","Nopember","Desember"],
        datasets: [
          <?php
            $i=1;
          ?>
          {
            backgroundColor: <?php echo '"'.$w[$i].'"';?>,
            borderColor: <?php echo '"'.$wb[$i].'"';?>,
            pointBorderColor: <?php echo '"'.$w[$i].'"';?>,
            pointBackgroundColor: <?php echo '"'.$wb[$i].'"';?>,
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: '#000',
            pointBorderWidth: 1,
            label: 'Rencana (%) ',
            data: [<?php
                    $dt[1]=$nmu1; $dt[2] =$nmu2;  $dt[3] =$nmu3;  $dt[4] =$nmu4;
                    $dt[5]=$nmu5; $dt[6] =$nmu6;  $dt[7] =$nmu7;  $dt[8] =$nmu8;
                    $dt[9]=$nmu9; $dt[10]=$nmu10; $dt[11]=$nmu11; $dt[12]=$nmu12;
                    for ($n=1; $n<=12; $n++) {
                      echo "".number_format($dt[$n],2).",";
                    }
                   ?>],
            fill: false,
          },

          <?php
            $i++;
          ?>
          {
            backgroundColor: <?php echo '"'.$w[$i].'"';?>,
            borderColor: <?php echo '"'.$wb[$i].'"';?>,
            pointBorderColor: <?php echo '"'.$w[$i].'"';?>,
            pointBackgroundColor: <?php echo '"'.$wb[$i].'"';?>,
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: '#000',
            pointBorderWidth: 1,
            label: 'Realisasi (%) ',
            data: [<?php
                    $dt[1]=$nru1; $dt[2] =$nru2;  $dt[3] =$nru3;  $dt[4] =$nru4;
                    $dt[5]=$nru5; $dt[6] =$nru6;  $dt[7] =$nru7;  $dt[8] =$nru8;
                    $dt[9]=$nru9; $dt[10]=$nru10; $dt[11]=$nru11; $dt[12]=$nru12;
                    for ($n=1; $n<=date('m'); $n++) {
                      echo "".number_format($dt[$n],2).",";
                    }
                   ?>],
            fill: false,
          }
        ]
      },
      options: {
        responsive: true,
        title:{
            display:true,
            text:'PROGRESS KEUANGAN'
        },
          legend: {
            display: true,
            position: 'bottom',
            labels: {
              boxWidth: 30,
              fontColor: 'rgba(60, 180, 100,1)'
            }
          },
        scales: {
          xAxes: [{
            display: true,
            scaleLabel: {
              display: true,
              labelString: ''
            }
          }],
            yAxes: [{
              display: true,
              scaleLabel: {
                display: false,
                labelString: 'Persentasi Perkembangan'
              },
              ticks: {
                min: 0,
                max: 100,
                // forces step size to be 5 units
                stepSize: 10
              }
            }]
        }
      }                  
    });
  }

</script>


