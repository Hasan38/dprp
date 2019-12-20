<?php
  include "config/koneksi.php";
  $iden=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM identitas"));
  header("location: $iden[url]"); 
?>
<!-- https://www.facebook.com/, https://twitter.com/, https://plus.google.com/, https://youtube.com/ -->