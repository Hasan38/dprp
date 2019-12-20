-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Des 2018 pada 04.16
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_desa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id_album` int(5) NOT NULL,
  `jdl_album` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `album_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gbr_album` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `hits_album` int(5) NOT NULL DEFAULT '1',
  `tgl_posting` date NOT NULL,
  `jam` time NOT NULL,
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id_album`, `jdl_album`, `album_seo`, `keterangan`, `gbr_album`, `aktif`, `hits_album`, `tgl_posting`, `jam`, `hari`, `username`) VALUES
(30, 'Membangun Masjid untuk Masyarakat desa', 'membangun-masjid-untuk-masyarakat-desa', '<p>Pembangunan Masjid ... di ... bla bla bla</p>\r\n', '46masjid.jpg', 'Y', 18, '2012-08-20', '09:12:06', 'Senin', 'admin'),
(28, 'Mengaspal Jalan seluruh Desa', 'mengaspal-jalan-seluruh-desa', '<p>Pemerintah Kabupaten melalui Dana APBD TA 2018 melaksanakan proyek pengaspalan jalan desa sepanjang 250 km yang terdiri dari beberapa ruas jalan yaitu ... bla bla bla</p>\r\n', '69aspal.JPG', 'Y', 20, '2012-08-18', '23:14:05', 'Sabtu', 'admin'),
(29, 'Membangun lahan pertanian baru', 'membangun-lahan-pertanian-baru', '<p>Pembukaan lahan pertanian baru untuk budi daya tanaman pangan</p>\r\n', '53pertanian.jpg', 'Y', 43, '2012-08-19', '03:02:27', 'Minggu', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `background`
--

CREATE TABLE `background` (
  `id_background` int(5) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `background`
--

INSERT INTO `background` (`id_background`, `gambar`) VALUES
(1, '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `sub_judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `youtube` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `judul_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `headline` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `utama` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `isi_berita` longtext CHARACTER SET latin1 NOT NULL,
  `keterangan_gambar` text COLLATE latin1_general_ci NOT NULL,
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibaca` int(5) NOT NULL DEFAULT '1',
  `tag` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `id_kategori`, `username`, `judul`, `sub_judul`, `youtube`, `judul_seo`, `headline`, `aktif`, `utama`, `isi_berita`, `keterangan_gambar`, `hari`, `tanggal`, `jam`, `gambar`, `dibaca`, `tag`, `status`) VALUES
(619, 39, 'admin', '4 Alasan Kenapa Memaafkan Penting Bagi Kesehatan', '', '', '4-alasan-kenapa-memaafkan-penting-bagi-kesehatan', 'N', 'N', 'N', 'Jakarta - Memaafkan bukan berarti melupakan, tapi memberi kesempatan kepada diri sendiri untuk menghapus rasa kesal dan dendam terhadap orang lain. Dengan demikian, rasa marah dan tekanan yang mengganggu emosi pun dapat diredakan. Akibatnya, pikiran jadi lebih tenang dan jauh dari stres. Sejatinya, tak hanya itu saja manfaat kesehatan dari memaafkan orang lain.<br />\r\n<br />\r\nSecara ilmiah, memaafkan kesalahan orang lain dapat bermanfaat baik bagi kesehatan fisik maupun mental. Secara sosial, memaafkan orang lain merupakan wujud kebesaran jiwa dan perilaku yang dianggap baik. Ada banyak manfaat kesehatan dari memaafkan orang lain seperti dilansir Mayo Clinic dan Telegraph, Minggu (19/8/2012) antara lain:<br />\r\n<br />\r\n<strong>1. Terhindar dari Penyakit Tekanan Darah Tinggi</strong><br />\r\nPara peneliti dari University of California, San Diego menemukan bahwa orang-orang yang bisa melepaskan kemarahannya dan memaafkan kesalahan orang lain cenderung lebih rendah risikonya mengalami lonjakan tekanan darah.<br />\r\n<br />\r\nPeneliti meminta lebih dari 200 relawan untuk memikirkan saat temannya menyinggung perasaan. Setengah dari kelompok diperintahkan untuk berpikir mengapa hal tersebut bisa membuatnya marah, sedangkan yang lainnya didorong untuk memaafkan kesalahan tersebut. Peneliti menemukan bahwa orang yang marah mengalami peningkatan tekanan darah lebih besar dibanding orang yang pemaaf.<br />\r\n<strong><br />\r\n2. Terhindar dari Risiko Penyalahgunaan Obat dan Alkohol</strong><br />\r\nSejumlah penelitian telah membuktikan bahwa rasa benci, dendam dan permusuhan dapat memicu tekanan darah tinggi. Stres muncul ketika perasaan kecewa atau tersakiti. Memaafkan adalah sebuah proses perdamaian dengan diri sendiri. Seseorang yang memberi maaf justru akan merasa lebih rileks untuk menerima kondisinya.<br />\r\n<br />\r\nDengan kondisi mental yang lebih rileks, seseorang juga akan terhindar dari risiko penyalahgunaan alkohol dan obat terlarang. Risiko tersebut umumnya dihadapi oleh para pendendam yang membutuhkan jalan pintas untuk lepas dari beban emosi negatifnya.<br />\r\n<br />\r\n<strong>3. Menurunkan Risiko Serangan Jantung</strong><br />\r\nPara ilmuwan membuktikan bahwa permintaan maaf yang ditujukan pada seseorang bisa meningkatkan kesehatan jantungnya. Orang yang mengalami perlakuan kasar akan mengalami peningkatan tekanan darah yang dapat memicu serangan jantung atau stroke. Namun ketika mendengarkan kata &#39;maaf&#39;, tekanan darah akan menurun kembali.<br />\r\n<br />\r\nTekanan darah yang diukur dalam penelitian adalah tekanan darah diastolik, yaitu tekanan dalam darah antara detak jantung atau tekanan dalam arteri-arteri ketika jantung istirahat setelah kontraksi. Jika terlalu tinggi atau terjadi untuk waktu yang lama, dapat meningkatkan kemungkinan stroke atau serangan jantung.<br />\r\n<br />\r\n<strong>4. Jauh dari Stres dan Depresi</strong><br />\r\nSebuah penelitian yang dimuat Personality and Social Psychology Bulletin menemukan bahwa memafkan secara positif dapat mengurangi gejala depresi. Tak hanya itu, memaafkan akan mengembalikan pikiran positif, dan memperbaiki hubungan. Selain itu, memaafkan juga berkaitan dengan perilaku positif lain seperti sifat dermawan, murah hati dan tidak mudah tertekan.<br />\r\n', '', 'Sabtu', '2012-11-17', '08:14:51', '', 23, '', 'Y'),
(622, 39, 'admin', 'Orang Beriman Kondisi Fisik n Mentalnya Lebih Sehat', '', '', 'orang-beriman-kondisi-fisik-n-mentalnya-lebih-sehat', 'N', 'N', 'N', '<p>Orang yang beriman disayang Tuhan, mungkin itulah sebabnya kemudian orang yang beriman juga memiliki kondisi kesehatan yang baik. Nyatanya, berbagai penelitian menunjukkan bahwa orang-orang yang memiliki keyakinan dan keimanan yang teguh juga memiliki kondisi fisik yang lebih prima.<br /> <br /> \"Keyakinan terhadap agama bisa mengurangi stres, depresi, dan meningkatkan kualitas hidup,\" kata Dr Harold G. Koenig, profesor psikiatri dan ilmu perilaku di Duke University Medical Center seperti dilansir Medpagetoday.com, Minggu (19/8/2012).<br /> <br /> Data sebuah penelitian yang dimuat American Journal of Health Promotion tahun 2005 menyimpulkan bahwa orang yang banyak berdoa lebih banyak mendapat manfaat kesehatan dengan cara menerapkan perilaku yang sehat, menjalankan antisipasi terhadap penyakit dan lebih puas terhadap pelayanan kesehatan.<br /> <br /> Sebuah penelitian tahun 2006 yang dimuat British Medical Journal juga menemukan bahwa kehadiran dalam sebuah acara keagamaan ternyata berkaitan dengan penurunan risiko penyakit menular.<br /> <br /> Menurut Koenig, adanya keyakinan beragama dan kegiatan spiritual berhubungan dengan risiko penyakit atau gangguan kesehatan yang lebih rendah, misalnya stres, penyakit kardiovaskular, tekanan darah, reaktivitas kardiovaskular, gangguan metabolisme serta dapat menjamin keberhasilan operasi jantung. Namun di sisi lain, Koenig juga memperingatkan bahwa cara kerja Tuhan ini tidak dapat diukur dengan cara dan metode apapun.<br /> <br /> \"Saya percaya bahwa doa efektif, tapi tidak berfungsi secara ilmiah dan tidak dapat diprediksi. Tidak ada alasan ilmiah atau teologis atas setiap efek dari keyakinan yang dapat dipelajari atau didokumentasi, seolah-olah Tuhan adalah bagian dari alam semesta yang dapat diprediksi. Ilmu pengetahuan tidak dirancang untuk membuktikan hal-hal yang supranatural,\" kata Koenig.<br /> <br /> Selain itu, keyakinan terhadap agama juga telah dikaitkan dengan umur panjang, perkembangan penyakit kognitif yang lebih lambat dan penuaan yang sehat. Senada dengan Koenig, dr Robert A. Hummer, profesor sosiologi di University of Texas di Austin yang berfokus pada hubungan antara agama dan rendahnya risiko kematian juga memiliki pendapat yang sama.<br /> <br /> Hummer merujuk sebuah penelitian yang melacak beberapa orang berusia 51 - 61 tahun selama 8 tahun untuk mendokumentasikan tingkat ketahanan hidupnya. Penelitian tersebut menemukan bahwa peserta yang tidak menghadiri acara keagamaan sama sekali memiliki kemungkinan 64 persen lebih tinggi mengalami kematian dibandingkan orang yang sering beribadah.</p>', '', 'Senin', '2012-08-20', '08:51:08', '', 26, '', 'Y'),
(603, 39, 'admin', '4 Teknologi yang Bakal Bertahan Sampai 2030', '', '', '4-teknologi-yang-bakal-bertahan-sampai-2030', 'Y', 'Y', 'N', 'Perkembangan teknologi telah mengantarkan berbagai perangkat yang lebih kecil, cepat dan tangguh ke dalam genggaman tangan. Ada juga yang telah ditinggalkan atau digantikan teknologi lain, seperti sebuah floppy disk. &nbsp;<br />\r\nSelain teknologi yang ditiggalkan, ada juga beberapa teknologi yang diprediksi akan tetap bertahan sampai puluhan tahun ke depan. Seperti dilansir Live Science, Sabtu (18/8/2012), berikut empat teknologi yang diprediksi akan bertahan sampai 2030.<br />\r\n<br />\r\n<strong>1. Papan Ketik QWERTY</strong><br />\r\nTeknologi untuk melakukan input telah semakin banyak, ada voice recognition, handwriting recognition dan gesture control. Ini diperkiraka akan semakin akurat dan populer dalam dua dekade ke depan. Namun, sampai nanti ditemukan cara input teks menggunakan kendali pikiran, metode mengetik akan tetap sebuah metode menyusun teks yang paling akurat.<br />\r\nKehadiran papan ketik di tablet dan telefon genggam memang semakin terancam, namun layout QWERTY yang sejak dulu digunakan akan terus hidup.<br />\r\n<br />\r\n<strong>2. PC</strong><br />\r\nBeberapa orang berpendapat kita sedang memasuki zaman pasca PC. Pasalnya kini orang semakin sering menghabiskan waktu menggunakan smartphone dan tablet ketimbang menggunakan komputer desktop tradisional berbasis Windows atau Mac.<br />\r\nNamun di sisi lain, ketika sudah waktunya menggarap pekerjaan yang benar-benar serius, terutama yang melibatkan multitasking, PC masih merupakan perangkat yang&nbsp; paling bisa diandalkan.<br />\r\n&nbsp;<br />\r\nPada 2030, ukuran serta bentuk PC mungkin akan berubah. Beberapa orang bahkan berpendapat bahwa dengan adanya prosesor berotak empat, telefon genggam dan tablet menjelma menjadi PC. Tetap saja, apapun faktor yang mempengaruhi, pengguna yang fokus pada produktivitas akan membutuhkan sebuah komputer utama dengan kemampuan proses yang tinggi dan sanggup multitasking.<br />\r\n&nbsp;<br />\r\n<strong>3. USB Ports</strong><br />\r\nSekarang telah lebih dari 15 tahun sejak USB pertama kali diperkenalkan dan kita akan sulit membayangkan hidup tanpa USB. Ini hampir menjadi sebuah standar untuk membuat Anda bisa menransfer data dan menghubungkan dengan berbagai hal seperti papan ketik atau harddisk eksternal. Beberapa orang berpendapat bahwa standar seperti Thunderbolt dari Intel akan menandingi USB, tapi mereka tidak memiliki dasar instalasi untuk menandingi USB. Standar ini diprediksi akan semakin berkembang ke depannya.<br />\r\n<strong><br />\r\n4. Uang Tunai</strong><br />\r\nAda beberapa perdebatan mengenai apakah kartu kredit dan debit akan sepenuhnya digantikan oleh sistem pembayaran mobile dalam beberapa tahun ke depan. Walau bagaimanapun, uang tunai tampaknya akan tetap dibawa meski pada 2030.<br />\r\n&nbsp;<br />\r\nPasalnya di era informasi ini, membayar dengan uang tunai adalah cara terbaik untuk membuat pembelian yang Anda lakukan tetap anonim dan pribadi. Selain itu, uang kertas memiliki perlindungan terbaik dalam melawan pencuri indentitas karena orang yang menerima pembayaran tidak harus mengetahui nama Anda.\r\n', '', 'Sabtu', '2012-11-17', '03:27:34', '', 20, '', 'Y'),
(629, 39, 'admin', 'Cokelat Hitam Turunkan Tekanan Darah', '', '', 'cokelat-hitam-turunkan-tekanan-darah', 'N', 'N', 'N', 'Cokelat hitam sudah lama diketahui manfaatnya bagi kesehatan. Hasil analisa terhadap 20 studi menunjukkan, konsumsi cokelat hitam setiap hari akan menurunkan tekanan darah.<br />\r\n<br />\r\nPenelitian yang dilakukan The Cochrane Group melaporkan, zat aktif dalam cokelat bermanfaat untuk membuat pembuluh darah lebih rileks. Akibatnya, tekanan darah pun turun.<br />\r\n<br />\r\nZat aktif yang punya efek positif tersebut adalah flavonol, yang di dalam tubuh akan menghasilkan zat kimia oksida nitrat dan membuat pembuluh darah lemas sehingga darah lebih lancar bersirkulasi.<br />\r\n<br />\r\nAnalisis yang dibuat tersebut mengombinasikan beberapa penelitian sebelumnya untuk mengetahui ada tidaknya efek cokelat bagi tekanan darah. Cokelat hitam yang dikonsumsi partisipan dalam penelitian itu cukup banyak, antara 3 gram sampai 105 gram setiap hari.<br />\r\n<br />\r\nNamun penurunan tekanan darah yang dihasilkan tidak terlalu besar, hanya 2-3 mmHg. Akan tetapi penelitian hanya dilakukan selama dua minggu sehingga tidak diketahui dampaknya dalam jangka panjang.<br />\r\n<br />\r\n&quot;Meski kami belum mendapat bukti adanya efek jangka panjang penurunan tekanan darah, tetapi penurunan sedikit dalam jangka pendek ini mungkin dalam jangka panjang bisa berkontribusi pada penurunan risiko penyakit jantung,&quot; kata Karin Ried, dari National Institute of Integrative Medicine di Melbourne, Australia.<br />\r\n<br />\r\nTekanan darah tinggi cukup banyak diderita dan diperkirakan menjadi penyebab terbanyak stroke dan penyakit jantung.<br />\r\n<br />\r\nBila Anda ingin mendapatkan manfaat dari cokelat hitam, sebaiknya pastikan produk yang dibeli mengandung cokelat dalam jumlah tinggi karena kebanyakan produk di pasaran lebih banyak kandungan gula dan lemaknya.<br />\r\n<br />\r\nSelain cokelat, kacang, aprikot, blackberries, dan apel juga mengandung flavonol meski kadarnya lebih rendah daripada cokelat.\r\n', '', 'Selasa', '2012-08-21', '14:48:52', '', 27, '', 'Y'),
(633, 39, 'admin', 'Apakah dia mengalami Depresi? Cek Bicaranya', '', '', 'apakah-dia-mengalami-depresi-cek-bicaranya', 'N', 'N', 'N', '<p>Jakarta, Beberapa orang pandai menyembunyikan perasaan, dari luar tampak baik-baik saja meski hatinya menangis tercabik-cabik. Para ilmuwan baru-baru ini berhasil menentukan dengan tepat tingkat keparahan depresi berdasarkan cara berbicara.<br /> <br /> Dalam penelitian yang diklaim sebagai yang terbesar di dunia tersebut, para ilmuwan menemukan bahwa cara berbicara susah dipalsukan ketika seseorang sedang depresi. Perubahan cara bicara itu bisa dipakai untuk mengukur tingkat keparahan depresi yang dialami.<br /> <br /> Adam Vogel, kepala Speech Neuroscience Unit di University of Melbourne mengatakan bahwa cara berbicara adalah penanda kesehatan otak yang sangat kuat. Berbagai perubahan yang terjadi pada cara berbicara bisa menunjukkan seberapa bagus otak bekerja.<br /> <br /> \"Cara berbicara orang yang sedang depresi berubah dan dipengaruhi oleh terapi yang diberikan, menjadi lebih cepat dengan jeda yang lebih pendek,\" kata Vogel dalam laporannya di jurnal Biological Psychiatry seperti dikutip dari Medindia, Selasa (21/8/2012).<br /> <br /> Dalam penelitian tersebut, Vogel melakukan pengamatan terhadap 105 pasien yang sedang menjalani terapi untuk menyembuhkan depresi. Beberapa hal yang diamati antara lain waktu, nada dan intonasi bicara yang kemudian dibandingkan dengan hasil pemeriksaan psikologis.<br /> <br /> Para pasien diminta melakukan panggilan telepon ke sebuah mesin penjawab otomatis. Ada yang diminta berbicara apa saja, mengungkapkan perasaan dan sebagian hanya diminta untuk membaca teks supaya tidak perlu repot-reopot memikirkan mau bicara tentang apa.<br /> <br /> \"Temuan ini memungkinkan para psikolog jadi lebih fleksibel dalam memeriksa pasien dari jarak jauh, hanya dengan mendengarkan pola dan cara berbicara meski dari lokasi yang sangat jauh atau di kampung-kampung,\" kata James Mundt dari Centre for Psychological Consultation di Wisconsin.</p>', '', 'Selasa', '2012-08-21', '15:13:07', '', 23, '', 'Y'),
(634, 39, 'admin', 'Makanan Penyumbang KegemukaN', '', '', 'makanan-penyumbang-kegemukan', 'N', 'N', 'N', '<p>Jakarta - Salah satu faktor yang banyak bikin orang jadi gemuk adalah mengonsumsi makanan yang berlebihan dan salah. Untuk itu ketahui makanan apa saja yang ditemui sehari-hari dan bisa bikin gemuk.<br /> <br /> \"Yang paling banyak bikin gemuk adalah makanan dengan kandungan gula murni dan tepung,\" ujar dr Pauline Endang, SpGK dari FKUI, Rabu (15/8/2012).<br /> <br /> dr Pauline menjelaskan banyak orang yang kadang tidak suka nasi tapi ia suka mengemil. Namun sayangnya cemilan ini makanan yang manis dengan kadar gula tinggi, kadang ada telur dan menteganya sehingga kalori tinggi.<br /> <br /> \"Makanan-makanan ini tidak bikin kenyang, jadi orang yang mengonsumsi bawaannya ia ingin makan terus apalagi jika ditambah dengan makan gorengan yang kandungan lemaknya tinggi,\" ungkapnya.<br /> <br /> Hal senada juga diungkapkan oleh ahli gizi dr Inge Permadhi, MS, SpGK bahwa makanan tinggi kalori, tinggi gula dan tinggi lemak bisa menyebabkan seseorang mengalami kegemukan.<br /> <br /> \"Misalnya makanan berminyak, daging yang ada gajih, mentega, margarin, makanan-makanan ini rasanya enak dan gurih sehingga bikin orang ketagihan,\" ujar dr Inge dari Departemen Ilmu Gizi FKUI.<br /> <br /> Berikut ini beberapa makanan yang diketahui bisa menyumbang kegemukan yaitu:<br /> <br /> 1. Gorengan, mengandung banyak lemak dan juga kolesterol<br /> 2. Martabak, mengandung tinggi gula dan lemak<br /> 3. Cake, mengandung tinggi gula dan lemak<br /> 4. Minuman manis, mengandung tinggi gula dan kalori<br /> 5. Minuman soda, menyebabkan timbunan lemak visceral di perut<br /> 6. Kerupuk, mengandung karbohidrat dan kadar lemak yang tinggi<br /> 7. Es krim,mengandung tinggi gula dan lemak<br /> 8. Daging yang masih ada gajihnya<br /> 9. Fast food atau makanan cepat saji, kandungan lemak dan kalorinya tinggi tapi cenderung minim nutrisi<br /> 10. Keripik, kandungan lemak dan gula dari keripik ini membuat jumlah kalorinya tinggi serta ditambah dengan tinggi garam<br /> 11. Sereal manis, mengandung karbohidrat yang tinggi dan ditambah dengan gula yang bisa memicu penimbunan lemak<br /> 12. Krim-krim penambah minuman (Whipped cream), mengandung kadar lemak yang tinggi<br /> <br /> \"Kandungan dari bahan makanan ini bila asupannya melebihi kebutuhan tubuh maka akan diubah dan disimpan di dalam sel lemak dan tentu saja membuat seseorang jadi gemuk,\" ujar Dr Marini Siregar, MGizi, SpGK dari RS Premier Jatinegara.<br /> <br /> Dr Marini menyarankan agar tidak menjadi gemuk yang terpenting adalah keseimbangan antara apa yang dimakan dengan aktivitas fisik yang dilakukan. Jika termasuk orang yang aktivitas fisiknya rendah, asupan makanannya harus disesuaikan tidak boleh terlalu banyak.<br /> <br /> \"Jangan lupa mengonsumsi air yang cukup agar metabolisme dalam tubuh berjalan dengan baik, serta sayuran dan buah yang mengandung serat tinggi akan membuat kita merasa lebih kenyang sehingga mengurangi asupan makanan yang lain dan tidak akan terjadi kegemukan,\" ujar Dr Marini.</p>', '', 'Selasa', '2012-08-21', '15:23:01', '', 26, '', 'Y'),
(682, 39, 'admin', 'Kepala desa terhebat sedunia di indonesia', '', '', 'kepala-desa-terhebat-sedunia-di-indonesia', 'Y', 'N', 'N', '<p>Mantan aktivis mahasiswa UGM itu mengaku gerah dengan sistem birokrasi di pemerintahan desa yang selama ini kaku dan dingin. Pamong desa cenderung berorientasi dilayani bukan melayani masyarakat, tokoh yang disegani masyarakat, serta komunikasi hanya berjalan satu arah.</p>\r\n\r\n<p>Pria yang masih menempuh pendidikan Strata II di Sekolah Tinggi Pembangunan Masyarakat Desa (STPMD &ldquo;APMD&rsquo;) itu mulai melakukan cara-cara tidak biasa. Di antaranya mengumumkan program serta anggaran pendapatan dan belanja desa (APBDes) ke masyarakat minimal setahun sekali. &nbsp;Ia juga menggandeng Badan Pengawas Keuangan dan Pembangunan (BPKP) untuk menyusun rencana pembangunan desa serta kontrol anggaran.</p>\r\n\r\n<p>Ia juga tidak segan-segan merotasi jabatan anak buahnya agar terjadi perubahan kinerja.</p>\r\n\r\n<p>&ldquo;Biasanya banyak desa menghindari BPKP, kami malah menggandeng. Kerja jadi lebih semangat karena kami yakin tidak ada yang dilanggar,&rdquo; papar bapak dua anak itu.</p>\r\n\r\n<p>Wahyudi memang kritis bila menyangkut masalah akuntabilitas terutama anggaran. Saat ia maju dalam pemilihan kepada desa (Pilkades) 2012, ia mengusung isu politik uang. Semangat itu pula yang menghantarkannya duduk di kursi nomor satu di Desa Panggungharjo.</p>\r\n\r\n<p>Semangat bebas korupsi, kolusi dan nepotisme itu bahkan dibawa hingga ia menjabat. Sudah berkali-kali pemerintah desa Panggungharjo menolak gratifikasi dari sejumlah pengembang perumahan dan pengusaha tower yang beroperasi di Panggungharjo. Tiap pengusaha menawarkan uang pelicin antara Rp5 juta-Rp15 juta untuk memuluskan usaha mereka.</p>\r\n\r\n<p>&ldquo;Di mana-mana kan sudah lazim, setiap pengusaha masuk ada uang permisi yang harus dibayar ke banyak pos pemerintah dari desa sampai kabupaten,&rdquo; ungkapnya.</p>\r\n\r\n<p>Pengusaha justru diarahkan menggunakan uang itu untuk bantuan sosial ke masyarakat yang difasilitasi pemerintah desa. Di antaranya beasiswa untuk siswa miskin dan bantuan kesehatan. Sedikitnya ada 11 anak dari keluarga tidak mampu kini mengantongi asuransi pendidikan berkat uang gratifikasi yang ia tolak tersebut.</p>\r\n', 'abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd abcd ', 'Kamis', '2016-04-14', '02:49:25', '57petani.jpg', 59, '', 'Y'),
(681, 39, 'admin', 'Desa Terkaya di Dunia dan Kisah Luar Biasa Pemimpinya', '', '', 'desa-terkaya-di-dunia-dan-kisah-luar-biasa-pemimpinya', 'Y', 'N', 'N', '<p>Tim Evaluasi Lomba Desa Tingkat Nasional menominasikan Desa Panggungharjo, Kabupaten Bantul, Daerah Istimewa Yogyakarta, dalam 10 besar desa terbaik se Indonesia.<br />\r\nKetua Tim Evaluasi Lomba Desa Tingkat Nasional Valentino Sudaryanto, menyebutkan, Desa Panggungharjo mempunyai Kampung Dolanan Anak, batik enceng gondok, konveksi dari kain bekas serta produksi makanan khas desa, yang mana pada saat ini ditampilkan masyarakat setempat dalam tahapan penilaian lomba desa tersebut.</p>\r\n\r\n<p>&quot;Ini membanggakan karena Desa Panggungharjo, Kecamatan Sewon, berhasil masuk dalam 10 besar desa terbaik dari sekitar 70.000 desa se-Indonesia. Kami sangat terkesan dengan cara penyambutannya,&quot; katanya di Balai Desa Panggungharjo, Bantul, Jumat (18/7), seperti dilansir Antara.</p>\r\n\r\n<p>Menurut Valention, lomba desa tingkat nasional yang salah satunya diikuti Desa Panggungharjo, akan dilaksanakan dalam empat tahapan yakni tahapan administrasi, verifikasi lapangan, pemaparan atau presentasi serta penetapan juara terbaik.</p>\r\n\r\n<p>&quot;Dalam verifikasi lapangan saat ini, dari 10 desa akan diambil enam desa terbaik, mereka kemudian diminta mempresentasikan di depan dewan juri,&quot; kata Valentino.<br />\r\nMenurut dia, verifikasi di lapangan dilakukan dengan penilaian pemberdayaan dan partisipasi masyarakat dalam setiap program, potensi dan tingkat perkembangan desa disertai keunikannya, pemahaman aparat desa dalam sistem informasi penyelenggaraan desa, serta pembangunan desa dan kawasan pedesaan.<br />\r\n&quot;Acuannya meliputi pemberdayaan masyarakat, inisiatif masyarakat dalam pemerintahan, juga kepatuhan mereka terhadap kebijakan pemerintahan. Kami berharap Desa Panggungharjo bisa menjadi contoh teladan bagi desa lain,&quot; katanya.</p>\r\n\r\n<p>Pihaknya juga berharap kepada pemerintah setempat, agar perkembangan desa bisa terus didukung dengan disertai pembinaan agar kualitasnya semakin baik, apalagi animo pemerintah daerah dalam mengikuti lomba desa tingkat nasional semakin meningkat.</p>\r\n\r\n<p>Camat Sewon Bantul, Wintarto menambahkan, Desa Panggungharjo terdiri dari 461 rukun tetangga (RT), dan merupakan daerah pertumbuhan di mana banyak terjadi perkembangan perumahan sehingga sebagian dari jumlah penduduk sebanyak 106.929 jiwa merupakan pendatang.</p>\r\n', '', 'Jumat', '2013-01-25', '00:01:04', '14Cerpen Pertanian.jpg', 82, '', 'Y'),
(680, 39, 'admin', 'Desa Bantul Masuk Nominasi 10 Besar Desa Terbaik Se Indonesia', '', '', 'desa-bantul-masuk-nominasi-10-besar-desa-terbaik-se-indonesia', 'Y', 'Y', 'Y', '<p>Tim Evaluasi Lomba Desa Tingkat Nasional menominasikan Desa Panggungharjo, Kabupaten Bantul, Daerah Istimewa Yogyakarta, dalam 10 besar desa terbaik se Indonesia.<br />\r\nKetua Tim Evaluasi Lomba Desa Tingkat Nasional Valentino Sudaryanto, menyebutkan, Desa Panggungharjo mempunyai Kampung Dolanan Anak, batik enceng gondok, konveksi dari kain bekas serta produksi makanan khas desa, yang mana pada saat ini ditampilkan masyarakat setempat dalam tahapan penilaian lomba desa tersebut.</p>\r\n\r\n<p>&quot;Ini membanggakan karena Desa Panggungharjo, Kecamatan Sewon, berhasil masuk dalam 10 besar desa terbaik dari sekitar 70.000 desa se-Indonesia. Kami sangat terkesan dengan cara penyambutannya,&quot; katanya di Balai Desa Panggungharjo, Bantul, Jumat (18/7), seperti dilansir Antara.</p>\r\n\r\n<p>Menurut Valention, lomba desa tingkat nasional yang salah satunya diikuti Desa Panggungharjo, akan dilaksanakan dalam empat tahapan yakni tahapan administrasi, verifikasi lapangan, pemaparan atau presentasi serta penetapan juara terbaik.</p>\r\n\r\n<p>&quot;Dalam verifikasi lapangan saat ini, dari 10 desa akan diambil enam desa terbaik, mereka kemudian diminta mempresentasikan di depan dewan juri,&quot; kata Valentino.<br />\r\nMenurut dia, verifikasi di lapangan dilakukan dengan penilaian pemberdayaan dan partisipasi masyarakat dalam setiap program, potensi dan tingkat perkembangan desa disertai keunikannya, pemahaman aparat desa dalam sistem informasi penyelenggaraan desa, serta pembangunan desa dan kawasan pedesaan.<br />\r\n&quot;Acuannya meliputi pemberdayaan masyarakat, inisiatif masyarakat dalam pemerintahan, juga kepatuhan mereka terhadap kebijakan pemerintahan. Kami berharap Desa Panggungharjo bisa menjadi contoh teladan bagi desa lain,&quot; katanya.</p>\r\n\r\n<p>Pihaknya juga berharap kepada pemerintah setempat, agar perkembangan desa bisa terus didukung dengan disertai pembinaan agar kualitasnya semakin baik, apalagi animo pemerintah daerah dalam mengikuti lomba desa tingkat nasional semakin meningkat.</p>\r\n\r\n<p>Camat Sewon Bantul, Wintarto menambahkan, Desa Panggungharjo terdiri dari 461 rukun tetangga (RT), dan merupakan daerah pertumbuhan di mana banyak terjadi perkembangan perumahan sehingga sebagian dari jumlah penduduk sebanyak 106.929 jiwa merupakan pendatang.</p>\r\n', '', 'Rabu', '2014-07-23', '14:28:02', '35petani-facebook-1-1.jpg', 236, '', 'Y'),
(679, 39, 'admin', 'Desa Ini Mendapat Gelar Terbaik di Indonesia', '', '', 'desa-ini-mendapat-gelar-terbaik-di-indonesia', 'Y', 'Y', 'N', '<p>Menteri Dalam Negeri Gamawan Fauzi menganugerahi 12 desa dan kelurahan dalam rangka Lomba Desa dan Kelurahan Tingkat Nasional 2014 di Jakarta, Sabtu (16/8/2014) malam. Gamawan mengatakan perlombaan desa dan kelurahan adalah upaya pemberdayaan untuk pembangunan berkelanjutan yang berbasis pada masyarakat.&nbsp;</p>\r\n\r\n<p>&quot;Atas nama Pemerintah Pusat, saya menyampaikan penghargaan yang setulusnya kepada pemangku desa, semoga penghargaan ini dapat dipertahankan sebaik-baiknya,&quot; kata Gamawan saat menyampaikan sambutannya.</p>\r\n\r\n<p>Kemendagri, Sabtu malam, mengundang para pemangku desa dan kelurahan, serta camat dan kepala daerah terkait, yang memperoleh penghargaan atas upaya melakukan inovasi demi pembangunan berkelanjutan untuk desa.</p>\r\n\r\n<p>Direktur Jenderal Pembangunan Masyarakat dan Desa Tarmizi Karim, menjelaskan bahwa penilaian terhadap desa dan kelurahan dilakukan dalam kurun waktu dua tahun terakhir, melalui mekanisme penilaian secara berjenjang.</p>\r\n\r\n<p>&quot;Perlombaan ini dilaksanakan dengan cara membandingkan data potensi yang dimiliki suatu desa dan pengembangannya selama dua tahun terakhir, yakni sejak awal 2012 hingga akhir 2013,&quot; kata mantan Pelaksana Tugas Gubernur Aceh itu.</p>\r\n\r\n<p>Indikator penilaian yang digunakan oleh tim penilai adalah bagaimana desa tersebut mengelola fasilitas, sarana dan prasana di bidang pendidikan, kesehatan, ekonomi, keamanan dan ketertiban serta pemberdayaan kesejahteraan keluarga pada masyarakat desa.</p>\r\n\r\n<p>&quot;Selain itu, untuk penilaian tingkat nasional ditambah dengan indikator penguatan pembangunan desa, inisiatif dan kreativitas daerah serta tingkat kepatuhan terhadap penyelenggara pemerintahan,&quot; kata Tarmizi.</p>\r\n\r\n<p>Enam desa dan enam kelurahan di seluruh wilayah Tanah Air berhasil mendapatkan penghargaan Adikarya Bhakti Praja dan dana simultan untuk pembangunan desa.</p>\r\n', '', 'Kamis', '2014-07-24', '09:19:32', '54reuters-kelapa-sawit.jpg', 57, '', 'Y'),
(665, 39, 'admin', 'Risma Akan Tolak Tawaran Jadi Menteri', '', '', 'jabatan-belum-tuntas-risma-akan-tolak-tawaran-jadi-menteri', 'N', 'Y', 'Y', '<h3>\"Saya tidak ingin. Saya masih punya janji, saya di Surabaya saja.\"</h3>\r\n<p><span>Wali Kota Surabaya Tri Rismaharini mengaku tidak tertarik masuk ke dalam kabinet Joko Widodo-Jusuf Kalla.&nbsp;</span><br /><br /><span>Risma mengatakan masih punya janji pada warga Surabaya. Sehingga dia ingin menuntaskan janjinya memimpin Surabaya hingga berakhir.</span><br /><br /><span>\"Tidak, tidak. Saya tidak ingin (masuk kabinet). Saya masih punya janji, saya di Surabaya saja,\" kata Risma, Kamis 24 Juli 2014.</span><br /><br /><span>Hingga saat ini pun Risma mengaku belum mendapatkan tawaran apa pun untuk masuk dalam kabinet Jokowi-JK. Menurut Risma, selama bertemu dengan pimpinan partai, tak ada perbincangan soal kabinet.</span><br /><br /><span>Namun dia menegaskan kalaupun ada tawaran, dia tetap akan menuntaskan janjinya pada masyarakat Surabaya. \"Kalau nanti ada yang&nbsp;</span><em>nawari</em><span>, ya nanti saja,\" ujarnya.</span><br /><br /><span>Di media sosial Facebook muncul polling nama-nama untuk duduk di kabinet Jokowi-JK. Salah satunya Tri Rismaharini. Wali Kota Surabaya itu ditempatkan sebagai Menteri Pendayagunaan Aparatur Negara dan Reformasi Birokrasi.</span><br /><br /><span>Polling itu diakui Jokowi untuk meminta masukan kepada masyarakat terkait siapa-siapa saja yang tepat untuk mengisi kabinetnya lima tahun ke depan.</span></p>\r\n<p><span>Sumber :&nbsp;http://politik.news.viva.co.id/news/read/524505-jabatan-belum-tuntas--risma-akan-tolak-tawaran-jadi-menteri/</span></p>', '', 'Jumat', '2017-06-09', '13:18:31', '', 21, '', 'Y'),
(669, 39, 'admin', '5 Buah Penangkal Racun dalam Tubuh', '', '', '5-buah-penangkal-racun-dalam-tubuh', 'N', 'Y', 'N', '<p>Setiap hari tubuh memproduksi racun yang berasal dari udara yang dihirup dan makanan yang dikonsumsi. Akhirnya, racun pun memengaruhi kesehatan kita. Kulit mengalami kerusakan, pencernaan yang bermasalah, sampai ketidakseimbangan hormon, merupakan akibat dari racun yang ada di dalam tubuh.<br />\r\n<br />\r\nMaka itu, untuk membersihkan racun-racun dalam tubuh (detoksifikasi), dianjurkan untuk mengonsumsi beberapa jenis buah yang memiliki peran besar untuk hal ini.&nbsp;<br />\r\n<br />\r\nLemon kaya akan vitamin C, yang membantuh tubuh memproduksi glutation. Glutation adalah antioksidan yang membantu membuang racun yang ada di hati. Minum air lemon setiap hari, membantu mendetoksifikasi hati Anda. Selain sistem kekebalan yang baik, pencernaan pun turut merasakan manfaatnya.</p>\r\n\r\n<p>Buah nanas tidak hanya mengandung vitamin C, tapi juga mengandung enzim bromelain. Enzim ini dapat menenangkan dan membersihkan usus dari racun. Hal ini juga dikenal sebagai anti-inflamasi yang kuat, yang dapat membantu mengurangi rasa sakit akibat peradangan.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '', 'Senin', '2017-03-06', '09:51:33', '', 5, '', 'Y'),
(670, 39, 'admin', '7 Efek Buruk dari Konsumsi Obat Tidur', '', '', '7-efek-buruk-dari-konsumsi-obat-tidur', 'N', 'Y', 'N', '<p>Konsumsi obat tidur kerap dipilih bagi mereka yang mengalami kesulitan tidur atau insomnia. Mereka berpikir bahwa obat tidur mampu memberikan apa yang diinginkan, yaitu tidur dengan lelap. Namun kenyataannya, obat tidur tidak dapat mengobati kondisi tersebut, bahkan hanya memperburuk masalah saja.&nbsp;<br /><br />Di bawah ini beberapa jenis masalah terkait dengan pil tidur dan penggunaan yang terlalu berlebihan, seperti dikutip&nbsp;<em>Health Me Up</em>, Senin (11/8/2014):</p>\r\n<p>1. Efek samping dari obat tidur dapat membuat orang yang meminumnya merasa lupa, merasa pusing, bingung, dan sulit untuk berpikir keesokan harinya.</p>\r\n<p>2. Berlebihan dalam mengonsumsinya, akan memaksa Anda untuk meningkatkan asupannya agar Anda benar-benar tertidur. Sudah jelas, akan menimbulkan efek samping yang lebih besar.</p>\r\n<p>3. Terlalu sering mengonsumsi obat tidur akan membuat Anda ketergantungan yang berkepanjangan. Tidur lelap secara alami, tampaknya hanya mimpi yang jauh dari angan, yang hanya akan membuat Anda mengalami sulit tidur dan kerap merasa cemas.</p>\r\n<p>4. Jika Anda berhenti mengonsumsinya, secara perlahan tubuh akan menggigil, berkeringat, dan mual.</p>\r\n<p>5. Anda harus tahu bahwa obat tidur akan memengaruhi proses dari obat jenis lainnya yang sedang Anda konsumsi. Apakah itu obat pusing, demam, dan lain-lain.</p>\r\n<p>6. Kondisi akan semakin parah, saat Anda menggabungkannya dengan obat penghilang rasa sakit atau obat penenang.</p>\r\n<p>7. Anda harus menyadari bahwa masalah tidur mungkin menjadi pemicu terjadinya beberapa penyakit kesehatan mental, yang mendasari terjadinya gangguan tidur. Dan obat tidak selalu menjadi pilihan yang tepat.</p>', '', 'Senin', '2014-08-11', '09:52:26', '', 9, '', 'Y'),
(678, 39, 'robby', 'Desa Terbaik Indonesia Ternyata Ada di Jogja', '', '', 'desa-terbaik-indonesia-ternyata-ada-di-jogja', 'Y', 'N', 'Y', '<div>\r\n<p>Mantan aktivis mahasiswa UGM itu mengaku gerah dengan sistem birokrasi di pemerintahan desa yang selama ini kaku dan dingin. Pamong desa cenderung berorientasi dilayani bukan melayani masyarakat, tokoh yang disegani masyarakat, serta komunikasi hanya berjalan satu arah.</p>\r\n\r\n<p>Pria yang masih menempuh pendidikan Strata II di Sekolah Tinggi Pembangunan Masyarakat Desa (STPMD &ldquo;APMD&rsquo;) itu mulai melakukan cara-cara tidak biasa. Di antaranya mengumumkan program serta anggaran pendapatan dan belanja desa (APBDes) ke masyarakat minimal setahun sekali. &nbsp;Ia juga menggandeng Badan Pengawas Keuangan dan Pembangunan (BPKP) untuk menyusun rencana pembangunan desa serta kontrol anggaran.</p>\r\n\r\n<p>Ia juga tidak segan-segan merotasi jabatan anak buahnya agar terjadi perubahan kinerja.</p>\r\n\r\n<p>&ldquo;Biasanya banyak desa menghindari BPKP, kami malah menggandeng. Kerja jadi lebih semangat karena kami yakin tidak ada yang dilanggar,&rdquo; papar bapak dua anak itu.</p>\r\n\r\n<p>Wahyudi memang kritis bila menyangkut masalah akuntabilitas terutama anggaran. Saat ia maju dalam pemilihan kepada desa (Pilkades) 2012, ia mengusung isu politik uang. Semangat itu pula yang menghantarkannya duduk di kursi nomor satu di Desa Panggungharjo.</p>\r\n\r\n<p>Semangat bebas korupsi, kolusi dan nepotisme itu bahkan dibawa hingga ia menjabat. Sudah berkali-kali pemerintah desa Panggungharjo menolak gratifikasi dari sejumlah pengembang perumahan dan pengusaha tower yang beroperasi di Panggungharjo. Tiap pengusaha menawarkan uang pelicin antara Rp5 juta-Rp15 juta untuk memuluskan usaha mereka.</p>\r\n\r\n<p>&ldquo;Di mana-mana kan sudah lazim, setiap pengusaha masuk ada uang permisi yang harus dibayar ke banyak pos pemerintah dari desa sampai kabupaten,&rdquo; ungkapnya.</p>\r\n\r\n<p>Pengusaha justru diarahkan menggunakan uang itu untuk bantuan sosial ke masyarakat yang difasilitasi pemerintah desa. Di antaranya beasiswa untuk siswa miskin dan bantuan kesehatan. Sedikitnya ada 11 anak dari keluarga tidak mampu kini mengantongi asuransi pendidikan berkat uang gratifikasi yang ia tolak tersebut.</p>\r\n</div>\r\n', '', 'Minggu', '2016-01-17', '15:01:32', '24beautiful.jpg', 1, '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `download`
--

CREATE TABLE `download` (
  `id_download` int(3) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `nama_file` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `diunduh` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `download`
--

INSERT INTO `download` (`id_download`, `judul`, `nama_file`, `tanggal`, `diunduh`) VALUES
(3, 'Renja DPRD Keerom', 'file-92_PP_Nomor_12_Tahun_2018.pdf', '2018-10-23', 1),
(4, 'Renstra DPRD Keerom', 'file-26_CAVER RENSTRA SEKRETARIAT TAHUN 2016-2021-OKE.doc', '2018-11-06', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(5) NOT NULL,
  `id_album` int(5) NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `jdl_gallery` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gallery_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gbr_gallery` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_album`, `username`, `jdl_gallery`, `gallery_seo`, `keterangan`, `gbr_gallery`) VALUES
(254, 1, 'admin', 'Screenshot 1 ', 'screenshot-1-', 'Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 Screenshot 1 ', '911.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `halamanstatis`
--

CREATE TABLE `halamanstatis` (
  `id_halaman` int(5) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `judul_seo` varchar(100) NOT NULL,
  `isi_halaman` text NOT NULL,
  `tgl_posting` date NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `dibaca` int(5) NOT NULL DEFAULT '1',
  `jam` time NOT NULL,
  `hari` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `halamanstatis`
--

INSERT INTO `halamanstatis` (`id_halaman`, `judul`, `judul_seo`, `isi_halaman`, `tgl_posting`, `gambar`, `username`, `dibaca`, `jam`, `hari`) VALUES
(2, 'Profil DPRD', 'profil-dprd', '', '2014-04-07', '', 'admin', 4, '13:32:28', 'Senin'),
(49, 'Fungsi DPRD', 'fungsi-dprd', '', '2017-01-29', '', 'admin', 0, '00:55:28', 'Minggu'),
(50, 'Struktur Organisasi', 'struktur-organisasi', '', '2017-01-29', '46so.jpg', 'admin', 0, '00:59:08', 'Minggu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hubungi`
--

CREATE TABLE `hubungi` (
  `id_hubungi` int(5) NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `dibaca` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `nama`, `email`, `subjek`, `pesan`, `tanggal`, `jam`, `dibaca`) VALUES
(1, 'mardi', 'mardhie@gmail.com', 'pembangunan jalan', 'ruas jaan arso 1 ke arso 10 banyak lubangnya... mohon segera diperbaiki', '2018-11-06', '00:00:00', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas`
--

CREATE TABLE `identitas` (
  `id_identitas` int(5) NOT NULL,
  `nama_website` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `facebook` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rekening` varchar(100) NOT NULL,
  `no_telp` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `meta_deskripsi` varchar(250) NOT NULL,
  `meta_keyword` varchar(250) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `maps` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `identitas`
--

INSERT INTO `identitas` (`id_identitas`, `nama_website`, `email`, `url`, `facebook`, `rekening`, `no_telp`, `meta_deskripsi`, `meta_keyword`, `favicon`, `maps`) VALUES
(1, 'DPRD Kabupaten Keerom', 'mardhie@gmail.com', 'http://localhost/dprd', '', '', '081344001949', 'Menyajikan berita terbaru, tercepat, dan terpercaya seputar kegiatan DPRD Keerom', 'Selamat datang di website resmi DPrD Keerom', 'favicon.png', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `sidebar` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `username`, `kategori_seo`, `aktif`, `sidebar`) VALUES
(39, 'Umum', '', 'umum', 'Y', 1),
(55, 'Kunjungan Kerja', 'admin', 'kunjungan-kerja', 'Y', 1),
(56, 'Rapat Kerja', 'admin', 'rapat-kerja', 'Y', 1),
(57, 'Reses', 'admin', 'reses', 'Y', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `logo`
--

CREATE TABLE `logo` (
  `id_logo` int(5) NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `logo`
--

INSERT INTO `logo` (`id_logo`, `gambar`) VALUES
(15, 'logo.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT '0',
  `nama_menu` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `position` enum('Top','Bottom') DEFAULT 'Bottom',
  `urutan` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `id_parent`, `nama_menu`, `link`, `aktif`, `position`, `urutan`) VALUES
(1, 0, 'Home', 'index.php', 'Ya', 'Bottom', 1),
(2, 0, 'Organisasi', '#', 'Ya', 'Bottom', 2),
(3, 2, 'Profil DPRD', 'hal-profil-dprd.html', 'Ya', 'Bottom', 3),
(4, 2, 'Fungsi DPRD', 'hal-fungsi-dprd.html', 'Ya', 'Bottom', 4),
(5, 2, 'Struktur Organisasi', 'hal-struktur-organisasi.html', 'Ya', 'Bottom', 5),
(6, 0, 'Berita', 'semua-berita.html', 'Ya', 'Bottom', 6),
(7, 0, 'Galeri Foto', 'semua-album.html', 'Ya', 'Bottom', 7),
(8, 0, 'Arsip', 'download.html', 'Ya', 'Bottom', 8),
(9, 0, 'Aduan', 'hubungi-kami.html', 'Ya', 'Bottom', 10),
(10, 0, 'Kinerja', 'kinerja.html', 'Ya', 'Bottom', 9),
(11, 10, 'Program Kerja', 'program-kerja.html', 'Tidak', 'Bottom', 9),
(12, 10, 'Realisasi', 'realisasi.html', 'Tidak', 'Bottom', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(5) NOT NULL,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `publish` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `status` enum('user','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `urutan` int(5) NOT NULL,
  `link_seo` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `username`, `link`, `static_content`, `gambar`, `publish`, `status`, `aktif`, `urutan`, `link_seo`) VALUES
(2, 'Manajemen User', '', '?module=user', '', '', 'Y', 'user', 'Y', 22, ''),
(18, ' Berita', '', '?module=berita', '', '', 'Y', 'user', 'Y', 5, 'semua-berita.html'),
(10, 'Manajemen Modul', '', '?module=modul', '', '', 'Y', 'user', 'Y', 23, ''),
(31, 'Kategori Berita / Program', '', '?module=kategori', '', '', 'Y', 'user', 'Y', 6, ''),
(34, 'Tag Berita', '', '?module=tag', '', '', 'Y', 'user', 'Y', 7, ''),
(43, 'Album Foto', '', '?module=album', '', '', 'Y', 'user', 'Y', 11, ''),
(44, 'Galeri Foto', '', '?module=galerifoto', '', '', 'Y', 'user', 'Y', 12, ''),
(45, 'Template Web', '', '?module=templates', '', '', 'Y', 'user', 'Y', 16, ''),
(61, 'Identitas Website', '', '?module=identitas', '', '', 'Y', 'user', 'Y', 1, ''),
(73, 'Telepon Penting', 'admin', '?module=sekilasinfo', '', '', 'Y', 'user', 'Y', 27, ''),
(58, 'Menu Web', '', '?module=menu', '', '', 'Y', 'user', 'Y', 3, ''),
(59, 'Halaman Baru', '', '?module=halamanstatis', '', '', 'Y', 'user', 'Y', 4, ''),
(62, 'Video', '', '?module=video', '', '', 'Y', 'user', 'Y', 13, ''),
(63, 'Playlist Video', '', '?module=playlist', '', '', 'Y', 'user', 'Y', 14, ''),
(64, 'Tag Video', '', '?module=tagvid', '', '', 'Y', 'user', 'Y', 15, ''),
(66, 'Logo Website', '', '?module=logo', '', '', 'Y', 'user', 'Y', 15, ''),
(72, 'Realisasi', 'admin', '?module=realisasi', '', '', 'Y', 'user', 'Y', 26, ''),
(70, 'Hubungi Kami', '', '?module=hubungi', '', '', 'Y', 'user', 'Y', 24, ''),
(71, 'Program Kerja', 'admin', '?module=proker', '', '', 'Y', 'user', 'Y', 25, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mod_alamat`
--

CREATE TABLE `mod_alamat` (
  `id_alamat` int(5) NOT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mod_alamat`
--

INSERT INTO `mod_alamat` (`id_alamat`, `alamat`) VALUES
(1, '<p>Kami memiliki komitmen untuk memberikan layanan terbaik kepada Anda. Apabila untuk alasan tertentu Anda merasa tidak puas dengan pelayanan kami, Anda dapat menyampaikan kritik dan saran Anda kepada kami. Kami akan menidaklanjuti masukan yang Anda berikan dan bila perlu mengambil tindakan untuk mencegah masalah yang sama terulang kembali.</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `no_penting`
--

CREATE TABLE `no_penting` (
  `id_no_penting` int(11) NOT NULL,
  `nama_instansi` varchar(255) NOT NULL,
  `no_telpon` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `no_penting`
--

INSERT INTO `no_penting` (`id_no_penting`, `nama_instansi`, `no_telpon`) VALUES
(1, 'Polres Keerom', '(0967) - '),
(2, 'RSUD Keerom', '(0967) - '),
(3, 'Kejari Keerom', '(0967) - '),
(4, 'Pemadam Kebakaran', '(0967) - '),
(5, 'LPSE Keerom', '(0967) - '),
(6, 'Sekretariat DPRD', '(0967) - ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasangiklan`
--

CREATE TABLE `pasangiklan` (
  `id_pasangiklan` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `pasangiklan`
--

INSERT INTO `pasangiklan` (`id_pasangiklan`, `judul`, `username`, `url`, `gambar`, `tgl_posting`) VALUES
(1, 'Iklan Sidebar Kiri', 'admin', 'http://phpmu.com', '402465riau.jpg', '2014-06-22'),
(2, 'Iklan Sidebar Kanan', 'admin', 'http://phpmu.com', '683013lpse.jpg', '2014-06-22'),
(31, 'IKlan 3', 'admin', '#', '7702781juta.jpg', '2017-01-28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `playlist`
--

CREATE TABLE `playlist` (
  `id_playlist` int(5) NOT NULL,
  `jdl_playlist` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `playlist_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gbr_playlist` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `proker`
--

CREATE TABLE `proker` (
  `idproker` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `namaproker` varchar(100) NOT NULL,
  `prokerseo` varchar(100) NOT NULL,
  `sasaran` text NOT NULL,
  `pagu` int(11) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `tglmulai` date NOT NULL,
  `tglselesai` date NOT NULL,
  `targetpeserta` smallint(6) NOT NULL,
  `realmulai` date NOT NULL,
  `realselesai` date NOT NULL,
  `realpeserta` smallint(6) NOT NULL,
  `danaterserap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `proker`
--

INSERT INTO `proker` (`idproker`, `id_kategori`, `namaproker`, `prokerseo`, `sasaran`, `pagu`, `lokasi`, `tglmulai`, `tglselesai`, `targetpeserta`, `realmulai`, `realselesai`, `realpeserta`, `danaterserap`) VALUES
(1, 55, 'Kunjungan Kerja Komisi - Komisi', 'kunjungan-kerja-komisi--komisi', 'memantau perkembangan pembangunan Puskesmas ', 20005000, 'waris', '2018-05-25', '2018-05-26', 30, '2018-06-28', '2018-06-29', 30, 19750000),
(2, 56, 'Rapat Kerja Komisi C', 'rapat-kerja-komisi-c', 'Rapat Pemnahasan tentang Rumah Sakit', 100400000, 'Keerom', '2018-06-03', '2018-06-05', 25, '2018-08-03', '2018-08-05', 25, 9975000),
(3, 56, 'Rapat Kerja Komisi B', 'rapat-kerja-komisi-b', 'Rapat kerja dengan para Kepala Dinas terkait', 350000000, 'Jayapura', '2018-08-20', '2018-08-23', 15, '2018-09-20', '2018-09-23', 30, 15000000),
(5, 56, 'Rapat Kerja Komisi A', 'rapat-kerja-komisi-a', 'Pembahasan Pemerintahan', 215000000, 'Kab. Keerom', '2018-10-20', '2018-10-23', 30, '2018-10-20', '2018-10-23', 0, 0),
(6, 57, 'Kunjungan ke Daerah Pemilihan', 'kunjungan-ke-daerah-pemilihan', 'Memonitor Pembangunan Daerah', 2147483647, 'Klaster I, II, III', '2018-11-11', '2018-11-16', 20, '0000-00-00', '0000-00-00', 0, 0),
(7, 39, 'Pembahasan Rancangan Peraturan Daerah', 'pembahasan-rancangan-peraturan-daerah', ' Peraturan Daerah', 2147483647, 'Kabupaten Keerom', '2018-01-01', '2018-12-18', 20, '0000-00-00', '0000-00-00', 0, 0),
(8, 39, 'Peningkatan Kapasitas Pimpinan dan Anggota DPRD', 'peningkatan-kapasitas-pimpinan-dan-anggota-dprd', 'Koordinasi dan Konsultasi serta Studi Banding', 2147483647, 'Luar Papua', '2018-01-01', '2018-12-30', 20, '0000-00-00', '0000-00-00', 0, 0),
(9, 0, 'Reses', 'reses', 'Menjaring Aspirasi Masyarakat di Daerah Pemilihan', 1097100000, 'Klaster I, II, III', '2018-11-26', '2018-11-26', 20, '0000-00-00', '0000-00-00', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sekilasinfo`
--

CREATE TABLE `sekilasinfo` (
  `id_sekilas` int(5) NOT NULL,
  `info` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `sekilasinfo`
--

INSERT INTO `sekilasinfo` (`id_sekilas`, `info`, `tgl_posting`, `gambar`, `aktif`) VALUES
(1, 'Anak yang mengalami gangguan tidur, cenderung memakai obat2an dan alkohol berlebih saat dewasa.', '2015-04-11', '', 'Y'),
(2, 'WHO merilis, 30 persen anak-anak di dunia kecanduan menonton televisi dan bermain komputer.', '2015-03-16', '', 'Y'),
(3, 'Menurut peneliti di Detroit, orang yang selalu tersenyum lebar cenderung hidup lebih lama.', '2015-04-17', '', 'Y'),
(4, 'Menurut United Stated Trade Representatives, 25% obat yang beredar di Indonesia adalah palsu.', '2015-04-17', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `statistik`
--

CREATE TABLE `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `statistik`
--

INSERT INTO `statistik` (`ip`, `tanggal`, `hits`, `online`) VALUES
('::1', '2018-10-18', 16, '1539869770'),
('::1', '2018-10-19', 1, '1539912305'),
('::1', '2018-10-20', 5, '1540026225'),
('::1', '2018-10-21', 7, '1540127659'),
('::1', '2018-10-22', 3, '1540179504'),
('::1', '2018-10-23', 2, '1540258898'),
('::1', '2018-10-29', 1, '1540785658'),
('::1', '2018-11-06', 4, '1541500189'),
('::1', '2018-11-07', 1, '1541557376'),
('::1', '2018-11-26', 1, '1543179592');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(5) NOT NULL,
  `nama_tag` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `tag_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tag`
--

INSERT INTO `tag` (`id_tag`, `nama_tag`, `username`, `tag_seo`, `count`) VALUES
(28, 'Teknologi', '', 'teknologi', 12),
(26, 'Nasional', '', 'nasional', 42),
(25, 'Kesehatan', '', 'kesehatan', 16),
(34, 'Wisata', '', 'wisata', 4),
(36, 'Hukum', '', 'hukum', 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `templates`
--

CREATE TABLE `templates` (
  `id_templates` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `pembuat` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `folder` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `templates`
--

INSERT INTO `templates` (`id_templates`, `judul`, `username`, `pembuat`, `folder`, `aktif`) VALUES
(17, 'PHP[mu] Template V.3 Full Color', 'admin', 'Robby Prihandaya', 'view/phpmu', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `foto` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `id_session` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `foto`, `level`, `blokir`, `id_session`) VALUES
('admin', 'bff0cc42103de1b4721370e84dc24f635a7afeca41198c9b3e03946a1b6b7191d14356408a5e57ce6daf77e6e800c66fac7ab0482d57d48d23e6808e4b562daa', 'mardhiegendhoet', 'mardhie@gmail.com', '081344001940', '7211mardhie_green2.jpg', 'admin', 'N', 'q173s8hs1jl04st35169ccl8o7'),
('parto', 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 'Suparto', '', '', '', 'user', 'N', 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22'),
('salehah', '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c', 'Salehah', '', '', '', 'user', 'N', '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_modul`
--

CREATE TABLE `users_modul` (
  `id_umod` int(11) NOT NULL,
  `id_session` varchar(255) NOT NULL,
  `id_modul` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users_modul`
--

INSERT INTO `users_modul` (`id_umod`, `id_session`, `id_modul`) VALUES
(1, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 18),
(2, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 31),
(3, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 43),
(4, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 44),
(5, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 59),
(6, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 62),
(7, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 70),
(8, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 71),
(9, '882c306525a9f885466520ba2aa6b10377b029cb569311fc17161d40df6e1bab7eb6103fcf567ce3a1375e77cc7db1928efec90cd0a379303fc2adb159bb1d14', 72),
(10, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 2),
(11, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 18),
(12, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 31),
(13, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 43),
(14, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 44),
(15, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 59),
(16, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 62),
(17, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 70),
(18, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 71),
(19, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 72),
(20, '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c', 18),
(21, '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c', 31),
(22, '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c', 43),
(23, '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c', 44),
(24, '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c', 71),
(25, '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c', 72),
(26, 'cfb75893342bf14ac4636ec6a7145cae62285f1051bef5dc387e026e66fde2fccf9617dd0ee99fcd3d652c23f182efa2c84b561ddafe4a68247a85a677b81d22', 73),
(27, '9994b1ccecb1add2a98dec2363fbd46ff3eab773ae3e97bb8ab10696c327545f8f34a5263baeb459b76bb98f05ee1ebdb63a143cad60b87dfda2322f1bd5680c', 73);

-- --------------------------------------------------------

--
-- Struktur dari tabel `video`
--

CREATE TABLE `video` (
  `id_video` int(5) NOT NULL,
  `id_playlist` int(5) NOT NULL,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `jdl_video` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `video_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gbr_video` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `video` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `youtube` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dilihat` int(7) NOT NULL DEFAULT '1',
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `tagvid` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `video`
--

INSERT INTO `video` (`id_video`, `id_playlist`, `username`, `jdl_video`, `video_seo`, `keterangan`, `gbr_video`, `video`, `youtube`, `dilihat`, `hari`, `tanggal`, `jam`, `tagvid`) VALUES
(160, 56, 'admin', 'Selamatkan Hutan di Indonesia', 'selamatkan-hutan-di-indonesia', '<p>Selamatkan Hutan Indonesia&nbsp;</p>\r\n', '', '', 'http://www.youtube.com/embed/hkzpLJjZQbA', 31, 'Rabu', '2014-07-02', '07:30:12', ''),
(161, 56, 'admin', 'Hutan Hujan Tropis Indonesia', 'hutan-hujan-tropis-indonesia', '<p>Hutan Hujan Tropis di Indonesia</p>\r\n', '', '', 'http://www.youtube.com/embed/5biK_PcT7S0', 29, 'Rabu', '2014-07-02', '07:31:23', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indeks untuk tabel `background`
--
ALTER TABLE `background`
  ADD PRIMARY KEY (`id_background`);

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`id_download`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `halamanstatis`
--
ALTER TABLE `halamanstatis`
  ADD PRIMARY KEY (`id_halaman`);

--
-- Indeks untuk tabel `hubungi`
--
ALTER TABLE `hubungi`
  ADD PRIMARY KEY (`id_hubungi`);

--
-- Indeks untuk tabel `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`id_identitas`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`id_logo`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indeks untuk tabel `mod_alamat`
--
ALTER TABLE `mod_alamat`
  ADD PRIMARY KEY (`id_alamat`);

--
-- Indeks untuk tabel `no_penting`
--
ALTER TABLE `no_penting`
  ADD PRIMARY KEY (`id_no_penting`);

--
-- Indeks untuk tabel `pasangiklan`
--
ALTER TABLE `pasangiklan`
  ADD PRIMARY KEY (`id_pasangiklan`);

--
-- Indeks untuk tabel `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id_playlist`);

--
-- Indeks untuk tabel `proker`
--
ALTER TABLE `proker`
  ADD PRIMARY KEY (`idproker`);

--
-- Indeks untuk tabel `sekilasinfo`
--
ALTER TABLE `sekilasinfo`
  ADD PRIMARY KEY (`id_sekilas`);

--
-- Indeks untuk tabel `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indeks untuk tabel `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id_templates`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `users_modul`
--
ALTER TABLE `users_modul`
  ADD PRIMARY KEY (`id_umod`);

--
-- Indeks untuk tabel `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `background`
--
ALTER TABLE `background`
  MODIFY `id_background` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=683;

--
-- AUTO_INCREMENT untuk tabel `download`
--
ALTER TABLE `download`
  MODIFY `id_download` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT untuk tabel `halamanstatis`
--
ALTER TABLE `halamanstatis`
  MODIFY `id_halaman` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `hubungi`
--
ALTER TABLE `hubungi`
  MODIFY `id_hubungi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `identitas`
--
ALTER TABLE `identitas`
  MODIFY `id_identitas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `logo`
--
ALTER TABLE `logo`
  MODIFY `id_logo` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `mod_alamat`
--
ALTER TABLE `mod_alamat`
  MODIFY `id_alamat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `no_penting`
--
ALTER TABLE `no_penting`
  MODIFY `id_no_penting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pasangiklan`
--
ALTER TABLE `pasangiklan`
  MODIFY `id_pasangiklan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id_playlist` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `proker`
--
ALTER TABLE `proker`
  MODIFY `idproker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `sekilasinfo`
--
ALTER TABLE `sekilasinfo`
  MODIFY `id_sekilas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `templates`
--
ALTER TABLE `templates`
  MODIFY `id_templates` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `users_modul`
--
ALTER TABLE `users_modul`
  MODIFY `id_umod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
