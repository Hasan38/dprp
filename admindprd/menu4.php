<?php
$cek=umenu_akses("?module=proker",$_SESSION[sessid]);
if($cek==1 OR $_SESSION[leveluser]=='admin'){
echo "<li><a href='?module=proker'><b>Program Kerja</b></a></li>";
}

$cek=umenu_akses("?module=realisasi",$_SESSION[sessid]);
if($cek==1 OR $_SESSION[leveluser]=='admin'){
echo "<li><a href='?module=realisasi'><b>Realisasi</b></a></li>";
}

?>
