-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Okt 2023 pada 08.46
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusweb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(40) NOT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `notelp` varchar(13) DEFAULT NULL,
  `jk` varchar(30) DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `tgllahir` varchar(50) DEFAULT NULL,
  `umur` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_lengkap`, `notelp`, `jk`, `tempat`, `tgllahir`, `umur`, `alamat`, `foto`) VALUES
('A0001', 'Radhian Sobarna', '087754224567', 'Laki-laki', 'Sumedang', '04/23/2000', '20', 'Desa Sukatali, Kec Situraja', 'radhian.jpg'),
('A0002', 'Dhea Mawarni', '087827817289', 'Perempuan', 'Sumedang', '04/14/2000', '20', 'Desa Cihanja, Kec ganeas', 'dhea.jpg'),
('A0003', 'Heri Perdi', '089980089789', 'Laki-laki', 'Sumedang', '04/12/2000', '20', 'Sumedang', 'man.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `book_dataset`
--

CREATE TABLE `book_dataset` (
  `id` int(11) NOT NULL,
  `ISBN` int(50) NOT NULL,
  `Book-Title` varchar(300) NOT NULL,
  `Book-Author` varchar(150) NOT NULL,
  `Year-Of-Publication` int(4) NOT NULL,
  `Publisher` varchar(150) NOT NULL,
  `Image-URL-S` varchar(200) NOT NULL,
  `Image-URL-M` varchar(200) NOT NULL,
  `Image-URL-L` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(20) DEFAULT NULL,
  `id_kategori` varchar(20) DEFAULT NULL,
  `id_penerbit` varchar(20) DEFAULT NULL,
  `id_rak` varchar(20) DEFAULT NULL,
  `judul` varchar(60) DEFAULT NULL,
  `pengarang` varchar(60) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `jmlhal` int(4) DEFAULT NULL,
  `jmlbuku` int(4) DEFAULT NULL,
  `tahun` int(5) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `foto` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `id_penerbit`, `id_rak`, `judul`, `pengarang`, `isbn`, `jmlhal`, `jmlbuku`, `tahun`, `sinopsis`, `foto`) VALUES
('B0001', 'K0001', 'P0002', 'Rak-01', 'Lancar JavaScript', 'Jubile Enterprice', '12345678', 140, 56, 2019, '-', 'lancar_javascript.jpg'),
('B0002', 'K0001', 'P0002', 'Rak-01', 'Belajar Otodidak CodeIgniter', 'Budi Raharjo', '12345679', 130, 61, 2020, '-', 'belajar_codeigniter.jpg'),
('B0003', 'K0001', 'P0002', 'Rak-01', 'Pro PHP & Jquery 7 Hari', 'WARDANA', '12345681', 100, 15, 2020, '-', 'web_profesional_dengan_php_jquery.jpg'),
('B0004', 'K0006', 'P0004', 'Rak-04', 'Otodidak Web Programming', 'Muhammad Ibnu Sa\'ad', '123523453424', 100, 25, 2019, '-', 'ID_OWP2020MTH01WP.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coba`
--

CREATE TABLE `coba` (
  `id` int(11) NOT NULL,
  `nama` varchar(1000) NOT NULL,
  `salin` int(11) NOT NULL,
  `gambar` varchar(200) NOT NULL DEFAULT 'default-book.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `coba`
--

INSERT INTO `coba` (`id`, `nama`, `salin`, `gambar`) VALUES
(1, 'RUMAH TANPA JENDELA', 1, 'default-book.png'),
(2, 'PARA PRIYAYI', 1, 'default-book.png'),
(3, 'SI ANAK SPESIAL', 1, 'default-book.png'),
(4, 'TEGAL BERCERITA', 1, 'default-book.png'),
(5, 'LUBNA DEJA VU', 1, 'default-book.png'),
(6, 'BERJUTA RASANYA', 1, 'default-book.png'),
(7, 'ENSIKLOPEDIA MATEMATIKA', 2, 'default-book.png'),
(8, 'IHYA ULUMIDDIN', 6, 'default-book.png'),
(9, 'HATTA JEJAK YANG MELAMPAUI ZAMAN', 1, 'default-book.png'),
(10, 'BERJUANG DAN DIBUANG MOH HATTA', 1, 'default-book.png'),
(11, 'SI ULAR ANTAR JONAN JADI MENTERI', 1, 'default-book.png'),
(12, 'MEGAWATI SOEKARNOPUTRI', 1, 'default-book.png'),
(13, 'K.H WAHAB HASBULLAH', 1, 'default-book.png'),
(14, 'ANAK INDONESIA DAN PAK HARTO', 1, 'default-book.png'),
(15, 'JEJAK LANGKAH PAK HARTO', 1, 'default-book.png'),
(16, 'UMAR BIN KHATHTHAB ra.', 1, 'default-book.png'),
(17, 'KAMUS VISUALDICTIONARY', 6, 'default-book.png'),
(18, 'DESAIN MEDIA DENGAN COREINRAW & INDESIGN', 4, 'default-book.png'),
(19, 'JQUERY&AJAX', 4, 'default-book.png'),
(20, 'flashbook menciptakan company profile', 4, 'default-book.png'),
(21, 'PEMPROGRAMAN APLIKASI ANDROID', 5, 'default-book.png'),
(22, 'VIDIO IKLANKOMERSIAL', 3, 'default-book.png'),
(23, 'KREASI POPULER DENGAN PHOTOSHOP', 4, 'default-book.png'),
(24, 'ensiklopedia tematik keterampilan pramuka', 10, 'default-book.png'),
(25, 'PRAMUKA DAN PENGABDIAN BANGSA; PANDUAN PERANPRAMUKADALAM PEMBANGUNAN KARAKTER GENERASI MUDA INDONESIA', 5, 'default-book.png'),
(26, 'STATISTIK APLIKASI 2', 1, 'default-book.png'),
(27, 'STATISTIK INDUSTRI', 2, 'default-book.png'),
(28, 'STATISTIK TEORI DAN APLIKASI', 1, 'default-book.png'),
(29, 'STATISTIK TEORI DAN SOAL-SOAL', 2, 'default-book.png'),
(30, 'PETUNJUK LALU LINTAS DAN ANGKUTAN JALAN', 1, 'default-book.png'),
(31, 'PERATURAN PEMERINTAH REP INDONESIA NO 32 TH 2013', 2, 'default-book.png'),
(32, 'Oxford Advanced Learner\'s Dictionary', 4, 'default-book.png'),
(33, 'ATLAS PRASEJARAH INDONESIA', 3, 'default-book.png'),
(34, 'JAWA TENGAH MENYONGSONG HARI ESOK YANGCERAH', 2, 'default-book.png'),
(35, 'NEGARA DAN BANGSA', 2, 'default-book.png'),
(36, 'Gunung', 1, 'default-book.png'),
(37, 'Ensiklopedia Al Qur\'an Aneka Fakta dan Indeks\"\"', 6, 'default-book.png'),
(38, 'Ensiklopedia Situs-situs Populer dalam AL-QUR\'AN. \"\"', 6, 'default-book.png'),
(39, 'Sakinah Bersamamu', 3, 'default-book.png'),
(40, 'BANGSA RAKYAT BERSATU', 1, 'default-book.png'),
(41, 'Biografi Abu Bakar Ash – Shiddiq', 2, 'default-book.png'),
(42, 'Budi Daya Lele Organik', 1, 'default-book.png'),
(43, 'ELEKTRONIKA DIGITAL DAN MIKROPROSESOR', 2, 'default-book.png'),
(44, 'CORELDRAW X5 & ADOBE PHOTOSHOP CS5 UNTUK DESAIN LOGO', 1, 'default-book.png'),
(45, 'METODE PENELITIAN TINDAKAN KELAS', 3, 'default-book.png'),
(46, 'MODEL-MODEL PENGAJARAN DAN PEMBELAJARAN', 3, 'default-book.png'),
(47, 'MENGOPTIMALKAN KINERJA KOMPUTER ANDA', 3, 'default-book.png'),
(48, 'Tuntas Basmi Virus untuk Pemula', 3, 'default-book.png'),
(49, 'Keledai Syaikh Juha', 1, 'default-book.png'),
(50, 'AYAH', 4, 'default-book.png'),
(51, 'MANDIRI BELAJAR SPSS', 1, 'default-book.png'),
(52, 'NEGERI PARA BEDEBAH', 4, 'default-book.png'),
(53, 'MODEL PEMBELAJARAN SPEKTAKULER', 3, 'default-book.png'),
(54, 'CARA MUDAH BELAJAR CORELDRAW X4', 2, 'default-book.png'),
(55, 'KANGEN KAMU', 3, 'default-book.png'),
(56, 'PANGGIL AKU KARTINI SAJA', 3, 'default-book.png'),
(57, 'HATI KEDUA', 3, 'default-book.png'),
(58, 'ANAK-ANAK MINYAK', 3, 'default-book.png'),
(59, 'Gelandangan di Kampung Sendiri', 3, 'default-book.png'),
(60, 'You\'re My reason', 3, 'default-book.png'),
(61, 'Seven Days:Cinta sejati akan kembali /', 0, 'default-book.png'),
(62, 'Yang fana adalah waktu /', 3, 'default-book.png'),
(63, 'Duka-Mu abadi :sepilihan sajak /', 3, 'default-book.png'),
(64, 'Dream do & pray!/', 1, 'default-book.png'),
(65, 'Autumn in Korea : be my love again ? /', 1, 'default-book.png'),
(66, 'Hijab for brain, beauty, and behavior /', 1, 'default-book.png'),
(67, 'Api Tauhid :Cahaya Keagungan cinta Sang Mujaddid , Novel Sejarah Pembangun Jiwa /', 1, 'default-book.png'),
(68, '7 hari menembus waktu /', 1, 'default-book.png'),
(69, 'Budi daya lele organik di lahan sempit :hemat air, hemat biaya pakan, & tanpa bau /', 1, 'default-book.png'),
(70, 'Rembulan tenggelam di wajahmu /', 2, 'default-book.png'),
(71, 'MATAHARI', 5, 'default-book.png'),
(72, 'Pada sebuah kapal / Nh Dini', 3, 'default-book.png'),
(73, 'Dari kampung jadi diplomat ulung /', 3, 'default-book.png'),
(74, 'Sepasang sepatu tua :sepilihan cerpen /', 2, 'default-book.png'),
(75, 'Filosofi kopi :kumpulan cerita & prosa satu dekade 1995-2005 /', 3, 'default-book.png'),
(76, 'Ayahku bukan pembohong /', 2, 'default-book.png'),
(77, 'Fate of love :cinta harus diperjuangkan /', 2, 'default-book.png'),
(78, 'Maya /', 3, 'default-book.png'),
(79, 'Update Love :kini aku berhasil mencintaimu /', 2, 'default-book.png'),
(80, 'Second chance :dia soulmate-mu /', 3, 'default-book.png'),
(81, 'Unbreakable wings :novel kehidupan /', 3, 'default-book.png'),
(82, 'Dia adalah kakakku /', 3, 'default-book.png'),
(83, 'Mata Kedua', 3, 'default-book.png'),
(84, 'Touched by love :semburat cinta Chrysant /', 3, 'default-book.png'),
(85, 'Rindu /', 5, 'default-book.png'),
(86, 'Api Tauhid :Cahaya Keagungan cinta Sang Mujaddid , Novel Sejarah Pembangun Jiwa /', 1, 'default-book.png'),
(87, 'Tulip story /', 3, 'default-book.png'),
(88, 'GANGNAM MEN', 3, 'default-book.png'),
(89, 'Supermarket supercinta /', 3, 'default-book.png'),
(90, 'Aquacero :tanpa ada seseorang di sisi kita hidup kita tidak lebih sempurna dari siapapun /', 3, 'default-book.png'),
(91, 'Like brother, like sister :suatu saat nanti kau akan jatuh cinta padaku /', 3, 'default-book.png'),
(92, 'Hujan bulan Juni :1959-1994 : sepilihan sajak /', 3, 'default-book.png'),
(93, 'Harga sebuah percaya /', 3, 'default-book.png'),
(94, 'Sunset bersama Rosie /', 2, 'default-book.png'),
(95, 'Hujan /', 2, 'default-book.png'),
(96, 'Please stop the time /', 2, 'default-book.png'),
(97, 'Eliana /', 1, 'default-book.png'),
(98, 'Si Anak Badai', 3, 'default-book.png'),
(99, 'Rumah pucat /', 3, 'default-book.png'),
(100, 'Bumi /', 2, 'default-book.png'),
(101, 'Bulan /', 2, 'default-book.png'),
(102, 'Bintang /', 1, 'default-book.png'),
(103, 'Azab dan Sengsara', 4, 'default-book.png'),
(104, 'Salah Asuhan', 7, 'default-book.png'),
(105, 'Pergi', 4, 'default-book.png'),
(106, 'Me And Student', 2, 'default-book.png'),
(107, 'Me And My Patient', 3, 'default-book.png'),
(108, 'Keajaiban shalat 5 Waktu Bersama Nabis SAW', 2, 'default-book.png'),
(109, 'Dandelion Lover - Cinta Yang Tertunda', 2, 'default-book.png'),
(110, 'Cinta Bopeng Bopeng', 3, 'default-book.png'),
(111, 'Selamanya Cinta', 3, 'default-book.png'),
(112, 'Seven Days Cinta Sejati akan Kembali', 2, 'default-book.png'),
(113, 'Candy Rendy', 2, 'default-book.png'),
(114, 'Time Meet Love One Step Closer', 3, 'default-book.png'),
(115, 'Orang-orang biasa =: Ordinary people', 2, 'default-book.png'),
(116, 'Slilit sang kiai', 2, 'default-book.png'),
(117, 'Dikaki Bukit Cibadak', 2, 'default-book.png'),
(118, 'Selimut debu', 1, 'default-book.png'),
(119, 'Siti Nurbaya Kasih Tak Sampai', 2, 'default-book.png'),
(120, 'Rantau muara', 2, 'default-book.png'),
(121, 'Paradise Romance', 3, 'default-book.png'),
(122, 'Allah tidak cerewet seperti kita', 1, 'default-book.png'),
(123, 'Autumn In Korea', 2, 'default-book.png'),
(124, 'Sweet Sour Love', 3, 'default-book.png'),
(125, 'Tentang kamu', 4, 'default-book.png'),
(126, 'Lambung Mangkurat /', 3, 'default-book.png'),
(127, 'Si Anak spesial /', 5, 'default-book.png'),
(128, 'Pulang', 4, 'default-book.png'),
(129, 'Fish & Girl', 3, 'default-book.png'),
(130, 'Love me, Love Me, Love Me Not', 3, 'default-book.png'),
(131, 'Her', 3, 'default-book.png'),
(132, 'Amor untuk morin /', 3, 'default-book.png'),
(133, 'Anak rantau', 3, 'default-book.png'),
(134, 'Gelandangan di kampung sendiri /', 3, 'default-book.png'),
(135, 'Cerita tentang Rani /', 2, 'default-book.png'),
(136, 'Planetes', 2, 'default-book.png'),
(137, 'Atheis', 2, 'default-book.png'),
(138, 'Rahim rindu /', 1, 'default-book.png'),
(139, 'Negeri di ujung tanduk /', 1, 'default-book.png'),
(140, 'Si anak pemberani /', 1, 'default-book.png'),
(141, 'SMASH', 2, 'default-book.png'),
(142, 'Sang Pemimpi', 5, 'default-book.png'),
(143, 'Sirkus Pohon', 1, 'default-book.png'),
(144, 'Daun yang jatuh tak pernah membenci angin /', 4, 'default-book.png'),
(145, 'Cinta satu benua :cinta itu fleksibel /', 3, 'default-book.png'),
(146, 'Begal cinta', 3, 'default-book.png'),
(147, 'Si Anak kuat /', 2, 'default-book.png'),
(148, 'Pemimpin yang \"tuhan\"', 3, 'default-book.png'),
(149, 'Jomblo Bukan Kutukan', 3, 'default-book.png'),
(150, 'ONLY YOU', 2, 'default-book.png'),
(151, 'Sengsara membawa nikmat', 1, 'default-book.png'),
(152, 'Komet /', 4, 'default-book.png'),
(153, 'Sepotong hati yang baru /', 4, 'default-book.png'),
(154, 'Aisyah Putri Jilbab In Love', 1, 'default-book.png'),
(155, 'Hafalan Shalat Delisa', 2, 'default-book.png'),
(156, 'Di Antara Lumpur, Mainanku Hilang', 1, 'default-book.png'),
(157, 'Indonesia berkerabat /', 3, 'default-book.png'),
(158, 'ICE FLOWER', 3, 'default-book.png'),
(159, 'cinderella\'s stepbrother vs seoul evil queen', 3, 'default-book.png'),
(160, 'Kau, aku, dan sepucuk angpau merah/', 2, 'default-book.png'),
(161, 'Si anak pintar /', 3, 'default-book.png'),
(162, 'Remember winter :mencintaimu adalah hal yang paling mudah /', 3, 'default-book.png'),
(163, 'mimpi mimpi lintang - maryamah karpov', 3, 'default-book.png'),
(164, 'Laskar pelangi /', 20, 'default-book.png'),
(165, 'La Barka :roman /', 5, 'default-book.png'),
(166, 'Cinta di dalam Gelas /', 4, 'default-book.png'),
(167, 'Si Anak cahaya /', 4, 'default-book.png'),
(168, 'Perawan remaja dalam cengkeraman militer', 4, 'default-book.png'),
(169, 'endless winter in korea', 3, 'default-book.png'),
(170, 'The last winter in Korea /', 3, 'default-book.png'),
(171, 'Mr & Mrs Writer', 3, 'default-book.png'),
(172, 'Love In Italy', 3, 'default-book.png'),
(173, 'Ronggeng Dukuh Paruk /', 3, 'default-book.png'),
(174, 'Percakapan Burung – Burung', 3, 'default-book.png'),
(175, 'Meso Potamia', 3, 'default-book.png'),
(176, 'One Autumn', 3, 'default-book.png'),
(177, 'Edensor /', 3, 'default-book.png'),
(178, 'Peanut butter cookies /', 3, 'default-book.png'),
(179, 'Perempuan di titik nol /', 2, 'default-book.png'),
(180, 'The udik girl :olalaa...mengejar cowok impian sampai ibukota /', 3, 'default-book.png'),
(181, 'Aroma karsa /', 3, 'default-book.png'),
(182, 'Dua pangeran gombal :sebuah kebahagiaan yang tak terduga /', 2, 'default-book.png'),
(183, 'C.L.B.K :(cinta, luka, bersemi kembali) /', 1, 'default-book.png'),
(184, 'negeri 5 menara /', 1, 'default-book.png'),
(185, 'Sedimen senja /', 1, 'default-book.png'),
(186, 'Mengubah takdir :serial ke 7 diskusi tasawuf modern /', 1, 'default-book.png'),
(187, 'Membela Allah', 1, 'default-book.png'),
(188, 'Bersyahadat di dalam rahim', 1, 'default-book.png'),
(189, 'Menuju Kemenangan', 1, 'default-book.png'),
(190, 'Arus Baru Islam Radikal', 1, 'default-book.png'),
(191, 'Hati baru/', 1, 'default-book.png'),
(192, 'mimpi sejuta dolar', 1, 'default-book.png'),
(193, 'AGPH :agen patah hati /', 2, 'default-book.png'),
(194, 'Maaf Tuhan, saya khilaf!/', 1, 'default-book.png'),
(195, 'Tarian ombak /', 1, 'default-book.png'),
(196, 'Jalan pasti berujung :hari cerah untuk si anak petani /', 2, 'default-book.png'),
(197, '# About love/', 1, 'default-book.png'),
(198, 'Secret', 1, 'default-book.png'),
(199, 'Life is choice /', 3, 'default-book.png'),
(200, 'Jejak sang petualang ?', 2, 'default-book.png'),
(201, 'Salah pilih /', 3, 'default-book.png'),
(202, 'Move on dari pikiran negatif /', 1, 'default-book.png'),
(203, 'Orang - orang biasa', 1, 'default-book.png'),
(204, 'Hijab', 1, 'default-book.png'),
(205, 'Dream do & pray :capai sukses bersama Allah Swt /', 2, 'default-book.png'),
(206, 'Rindu Kubawa Pulang', 1, 'default-book.png'),
(207, 'Model waktu dalam perahu kertas Sapardi Djoko Damono /', 1, 'default-book.png'),
(208, 'rumah penuh berkah', 1, 'default-book.png'),
(209, 'Manusia setengah ikan', 1, 'default-book.png'),
(210, 'Kane dan abel', 2, 'default-book.png'),
(211, '15 Cerpen Terbaik', 7, 'default-book.png'),
(212, '25 Cerpen Terbaik', 8, 'default-book.png'),
(213, 'Sepotong hati yang baru /', 1, 'default-book.png'),
(214, 'Cerita dari Digul /', 2, 'default-book.png'),
(215, 'Korean love story /', 3, 'default-book.png'),
(216, 'Soetji Menulis di Balik Papan Tulis', 8, 'default-book.png'),
(217, 'Ceros dan Batozar /', 1, 'default-book.png'),
(218, 'Rasa ini... :andai saja dia tahu, sebenarnya aku tidak ingin dia pergi /', 1, 'default-book.png'),
(219, 'Cerita dari Digul /', 1, 'default-book.png'),
(220, 'Kabut jingga /', 1, 'default-book.png'),
(221, 'Dunia tanpa cahaya :can i be a part of your life? /', 1, 'default-book.png'),
(222, 'Ceros dan Batozar /', 1, 'default-book.png'),
(223, '3 Srikandi', 1, 'default-book.png'),
(224, 'Kepingan supernova /', 1, 'default-book.png'),
(225, 'Senja yang membawa pergi', 1, 'default-book.png'),
(226, 'SERI PELAJARAN KOMPUTER : MICROSOFT EXCEL', 1, 'default-book.png'),
(227, 'Perjalanan lintas generasi dari marah rusli ke dewi santika', 8, 'default-book.png'),
(228, 'Berguru pada perempuan', 8, 'default-book.png'),
(229, 'Belenggu', 1, 'default-book.png'),
(230, 'perempuan bersampan cadik', 1, 'default-book.png'),
(231, 'lutung kasarung', 1, 'default-book.png'),
(232, 'Bentrokan dalam asrama', 6, 'default-book.png'),
(233, 'Peristiwa dibukit bambu', 1, 'default-book.png'),
(234, 'Titik temu', 4, 'default-book.png'),
(235, 'Keberanian tak terduga', 5, 'default-book.png'),
(236, 'Hari esok yang cerah', 2, 'default-book.png'),
(237, 'Catatan suasana', 3, 'default-book.png'),
(238, 'cinta dan mata', 1, 'default-book.png'),
(239, 'GURUKU ADALAH BAPAKKU', 2, 'default-book.png'),
(240, 'Padang Ilalang di Belakang Rumah', 3, 'default-book.png'),
(241, 'PERTEMUAN DUA HATI', 1, 'default-book.png'),
(242, 'Bagaimana senadainya ...?jawaban yang membangkitkan minat atas keingintahuanmu yang besar /', 1, 'default-book.png'),
(243, 'HUJAN KEPAGIAN', 6, 'default-book.png'),
(244, 'Abu nawas', 1, 'default-book.png'),
(245, 'dari ave maria ke jalan lain ke roma', 1, 'default-book.png'),
(246, 'menanti pengakuan', 9, 'default-book.png'),
(247, 'book of nightmares tales to make you scream', 1, 'default-book.png'),
(248, 'Kuncup berseri /', 1, 'default-book.png'),
(249, 'cowok cantik itu', 8, 'default-book.png'),
(250, 'ROBERT ANAK SURAPATI', 2, 'default-book.png'),
(251, 'Sarjana kebut skripsi', 1, 'default-book.png'),
(252, 'The rich girl', 1, 'default-book.png'),
(253, 'apa dan siapa', 1, 'default-book.png'),
(254, 'DOR', 8, 'default-book.png'),
(255, 'deburan ombak', 1, 'default-book.png'),
(256, 'cerita rakyat dari kudus (jawa tengah)', 0, 'default-book.png'),
(257, 'sarimu kupetik kini', 1, 'default-book.png'),
(258, 'si dul anak jakarta', 1, 'default-book.png'),
(259, 'Tak setipis kulit ari', 1, 'default-book.png'),
(260, 'dua dunia dalam satu warna', 1, 'default-book.png'),
(261, 'kebelet kawin mak', 1, 'default-book.png'),
(262, 'Terjebak narkoba', 1, 'default-book.png'),
(263, 'Lukisan', 5, 'default-book.png'),
(264, 'Mereka yang bangkit', 1, 'default-book.png'),
(265, 'Kisah Putri roro kemuning', 1, 'default-book.png'),
(266, 'Dikejar bayangan', 1, 'default-book.png'),
(267, 'pertemuan tak terduga', 1, 'default-book.png'),
(268, 'pengelolaan sekolah', 1, 'default-book.png'),
(269, 'kumpulan puisi siska balong bergalang', 1, 'default-book.png'),
(270, 'ayat ayat cinta', 2, 'default-book.png'),
(271, 'Antasari', 2, 'default-book.png'),
(272, 'Hari ini tidak ada cinta', 1, 'default-book.png'),
(273, 'lupus kecil', 1, 'default-book.png'),
(274, 'MESKI PIALAKU TERBANG', 1, 'default-book.png'),
(275, 'girl makes trouble', 1, 'default-book.png'),
(276, 'jenderal nyungsep', 1, 'default-book.png'),
(277, 'segurat bianglala di pantai senggigi', 1, 'default-book.png'),
(278, 'di antara puing puing kota', 1, 'default-book.png'),
(279, 'harimau harimau', 1, 'default-book.png'),
(280, 'hantu jeruk purut', 1, 'default-book.png'),
(281, 'biar bete asal tetap pede', 1, 'default-book.png'),
(282, 'Senopati pamungkas', 1, 'default-book.png'),
(283, 'komplotan perampok bank', 1, 'default-book.png'),
(284, 'Rusmi ingin pulang', 1, 'default-book.png'),
(285, 'mawar hutan penghabisan', 1, 'default-book.png'),
(286, 'The Secret seven', 1, 'default-book.png'),
(287, 'Pulang', 2, 'default-book.png'),
(288, 'bila randu berbunga', 1, 'default-book.png'),
(289, 'Sebuah lorong di kotaku', 1, 'default-book.png'),
(290, 'Romantika Anak sekolah', 1, 'default-book.png'),
(291, 'bangsacara ragami', 3, 'default-book.png'),
(292, 'guruku sahabatku', 1, 'default-book.png'),
(293, '4 Friends', 1, 'default-book.png'),
(294, 'Qarun yang Tamak', 2, 'default-book.png'),
(295, 'Maharani', 1, 'default-book.png'),
(296, 'Rumah yang terpencil', 1, 'default-book.png'),
(297, 'Pendekatan praktis belajar Algoritma & Pemrograman dengan bahasa delphi', 1, 'default-book.png'),
(298, 'Seandainya aku boleh memilih', 1, 'default-book.png'),
(299, 'Dosa pertama Pembawa maut', 1, 'default-book.png'),
(300, 'Aku', 1, 'default-book.png'),
(301, 'Antara wilis dan gunung kelud', 1, 'default-book.png'),
(302, 'yang tak tergoyahkan', 1, 'default-book.png'),
(303, 'Mahabharata for kids', 1, 'default-book.png'),
(304, 'Profil di balik cadar', 1, 'default-book.png'),
(305, 'Kentut model ekonomi', 1, 'default-book.png'),
(306, 'Juadah pasar', 1, 'default-book.png'),
(307, 'Asal bangsa dan bahasa nusantara', 1, 'default-book.png'),
(308, 'rahasia lereng bukit perjuangan', 1, 'default-book.png'),
(309, 'Mutiara yang nyaris hilang', 1, 'default-book.png'),
(310, 'Pengaruh keadaan', 1, 'default-book.png'),
(311, 'cita cita dalam derita', 2, 'default-book.png'),
(312, 'I Swasta setahun di bedahulu', 1, 'default-book.png'),
(313, 'Syukur', 1, 'default-book.png'),
(314, 'Semantik 1 Pengantar ke arah ilmu makna', 1, 'default-book.png'),
(315, 'Batu Ajaib pedagang jujur', 1, 'default-book.png'),
(316, 'Ilmu pengetahuan dan perilaku manusia /', 3, 'default-book.png'),
(317, 'Versus Pangeran anjing', 1, 'default-book.png'),
(318, 'Jalan yang tak Berkunjung datar', 1, 'default-book.png'),
(319, 'Gairah di gurun', 1, 'default-book.png'),
(320, 'Model-model pembelajaran :mengembangkan profesionalisme guru /', 3, 'default-book.png'),
(321, 'arjuna kembar', 1, 'default-book.png'),
(322, 'Dewa Arka dewa arki', 1, 'default-book.png'),
(323, 'Kumpulan cerita rakyat jawa timur dan provinsi lainnya', 1, 'default-book.png'),
(324, 'karena anak kandung', 1, 'default-book.png'),
(325, 'Rafilus', 1, 'default-book.png'),
(326, 'Pedoman pengawasan', 1, 'default-book.png'),
(327, 'Wahai generasi Muda apakah tugasmu', 1, 'default-book.png'),
(328, 'Hulubalang Raja', 1, 'default-book.png'),
(329, 'ken arok', 1, 'default-book.png'),
(330, 'Misteri di wisma wisteria', 1, 'default-book.png'),
(331, 'Bullies bigmouths so called friends', 1, 'default-book.png'),
(332, 'Evaluasi pembelajaran :prinsip teknik prosedur /', 3, 'default-book.png'),
(333, 'pekan semangat east higt', 1, 'default-book.png'),
(334, 'Elektronika digital dan mikroprosesor /', 3, 'default-book.png'),
(335, 'Pengetahuan dasar ilmu komputer', 3, 'default-book.png'),
(336, 'Pengembangan Profesional dan petunjuk penulisan karya ilmiah', 1, 'default-book.png'),
(337, 'Panduan Praktis Microsoft Power Point 2007', 1, 'default-book.png'),
(338, 'langkah mudah penelitian tindakan kelas', 3, 'default-book.png'),
(339, 'menjadi penelitian PTK yang profesional', 3, 'default-book.png'),
(340, 'Panduan mudah merancang komponen mesin dengan Autodesk Inventor Profesional 2011 /', 13, 'default-book.png'),
(341, 'Jadi guru BK? Siapa takut! :panduan lengkap & praktis menjadi guru bimbingan konseling /', 2, 'default-book.png'),
(342, 'Pengetahuan dasar komputer /', 1, 'default-book.png'),
(343, 'Jago Merakit dan memperbaiki komputer', 2, 'default-book.png'),
(344, 'Cerdas pengelolaan kelas /', 3, 'default-book.png'),
(345, 'Pedoman lengkap evaluasi & supervisi : bimbingan konseling /', 3, 'default-book.png'),
(346, 'Strategi Pembelajaran EDU TAINMENT Berbasis Karakter', 3, 'default-book.png'),
(347, 'Model-Model Pembelajaran Inovatif : Alternatif Desain Pembelajaran yang Menyenangkan', 3, 'default-book.png'),
(348, '', 0, 'default-book.png'),
(349, 'Cepat menguasai Autocad 2008 /', 3, 'default-book.png'),
(350, '3 in 1 Mengenal merakit dan menginstall komputer', 3, 'default-book.png'),
(351, 'menjadi teknisi komputer dan jaringan', 3, 'default-book.png'),
(352, 'Metode penelitian pendidikan tindakan kelas :implementasi dan pengembangannya /', 3, 'default-book.png'),
(353, 'Panduan menginstall komputer mudah dan praktis', 1, 'default-book.png'),
(354, 'TEORI DAN IMPLEMENTASI JARINGAN WI-FI', 1, 'default-book.png'),
(355, 'memanfaatkan software gratis dari internet', 1, 'default-book.png'),
(356, 'Joomla ! Cara mudah membuat foto online', 2, 'default-book.png'),
(357, 'Pedoman panduan praktikum microsoft access 2002', 1, 'default-book.png'),
(358, 'Pengamanan total data dan informasi penting', 1, 'default-book.png'),
(359, 'Si Ular besi antar Jonan jadi menteri /', 1, 'default-book.png'),
(360, 'Panduan Mudah Menggambar komponen mesin dengan autodesk inventor professional 2011', 11, 'default-book.png'),
(361, 'PTK Penelitian tindakan kelas', 2, 'default-book.png'),
(362, 'Buku Panduan Guru Profesional Penelitian Tindakan Kelas (PTK) dan Penelitian Tindakan Sekolah (PTS)', 3, 'default-book.png'),
(363, 'Fate of love :cinta harus diperjuangkan /', 1, 'default-book.png'),
(364, 'Penelitian tindakan kelas dan penelitian tindakan sekolah beserta contoh-contohnya /', 2, 'default-book.png'),
(365, 'Penelitian tindakan kelas dengan metode mutakhir :untuk pengembangan profesi guru /', 2, 'default-book.png'),
(366, 'Tegal Bisnis 2012', 1, 'default-book.png'),
(367, 'Melaksanakan PTK itu Mudah Classroom Action Research', 2, 'default-book.png'),
(368, 'Sejarah olimpiade', 1, 'default-book.png'),
(369, 'Pemrograman aplikasi database internet dengan ASP', 2, 'default-book.png'),
(370, 'Panduan Guru Penelitian Tindakan Kelas', 2, 'default-book.png'),
(371, 'Buku Informasi Usaha Nusantara yellow pages', 1, 'default-book.png'),
(372, 'Mengenal Pemograman VBScript dengan microsoft Front Page XP', 2, 'default-book.png'),
(373, 'Keterampilan dasar Pengoperasian komputer', 3, 'default-book.png'),
(374, 'Panduan mudah aplikasi windows vista /', 1, 'default-book.png'),
(375, 'Kesalahan Fatal dalam Mengoperasikan Komputer', 1, 'default-book.png'),
(376, 'Langkah Mudah Membuat Game 3D', 3, 'default-book.png'),
(377, 'Cara baru buat blog :dengan word 2007 dan windows live writer /', 2, 'default-book.png'),
(378, 'Website Praktis dengan google sites', 1, 'default-book.png'),
(379, 'Membongkar Rahasia BLOG', 1, 'default-book.png'),
(380, 'Akses Internet via ponsel dengan yahoo ! go', 1, 'default-book.png'),
(381, 'Tips Praktis Merawat Laptop untuk pemula', 3, 'default-book.png'),
(382, 'Outbound', 1, 'default-book.png'),
(383, 'Menggambar Dengan Paint', 3, 'default-book.png'),
(384, 'Permodelan desain rumah dengan archicad untuk pemula', 1, 'default-book.png'),
(385, 'Pengembangan materi pendidikan agama islam di sekolah umum', 1, 'default-book.png'),
(386, 'Chart dan pivochart microsoft excel 2007', 1, 'default-book.png'),
(387, 'Meningkatkan Kemampuan Jaringan Komputer dengan PC CLONNING SYSTEM', 4, 'default-book.png'),
(388, 'Buku latihan Konfigurasi dan manipulasi registry windows xp', 1, 'default-book.png'),
(389, 'Belajar Komputer Visual Basic', 3, 'default-book.png'),
(390, '99 Tips dan trik tersembunyi Microsoft Office excel 2007', 2, 'default-book.png'),
(391, 'Desain pembelajaran berbasis pendidikan karakter /', 2, 'default-book.png'),
(392, 'Cowon Jet Audio', 3, 'default-book.png'),
(393, 'Desain Undangan seremonial dengan coreldraw x3', 1, 'default-book.png'),
(394, 'Panduan Lengkap Mahir Corel Draw X3', 3, 'default-book.png'),
(395, 'Pemrograman dengan visual basic', 1, 'default-book.png'),
(396, 'Memproteksi PC dari berbagai serangan /', 1, 'default-book.png'),
(397, 'microsoft windows server 2003', 1, 'default-book.png'),
(398, '58 Trik Dahsyat Membuat Komputer Anda semakin Optimal', 3, 'default-book.png'),
(399, 'trik 60 detik adobe photoshop cs3', 1, 'default-book.png'),
(400, 'Menegakkan akal sehat', 2, 'default-book.png'),
(401, 'Belajar komputer microsoft excel', 1, 'default-book.png'),
(402, 'PLURK for cari duit', 1, 'default-book.png'),
(403, 'Mudah Tepat Singkat Pemograman HTML', 3, 'default-book.png'),
(404, 'Cara cepat terampil komputer untuk', 1, 'default-book.png'),
(405, 'Formula Komplit Powerpoint', 1, 'default-book.png'),
(406, 'Microsoft acces', 1, 'default-book.png'),
(407, 'Belajar Komputer Animasi Macromedia Flash', 3, 'default-book.png'),
(408, 'Panduan meng install komputer mudah dan praktis', 1, 'default-book.png'),
(409, 'Kursus Lengkap reparasi komputer', 1, 'default-book.png'),
(410, 'Operation system Linux Red Hat For Intermediate', 2, 'default-book.png'),
(411, 'Operation System Linux red hat', 3, 'default-book.png'),
(412, 'Memahami kerja internet', 1, 'default-book.png'),
(413, 'Belajar sendiri optimalisasi pekerjaan', 1, 'default-book.png'),
(414, 'Mengenal sistem Komponen Komputer masa kini', 2, 'default-book.png'),
(415, 'Adobe After effect cs3', 1, 'default-book.png'),
(416, 'Program-program Penting untuk komputer anda', 2, 'default-book.png'),
(417, 'Dongkrak produksi lele dengan probiotik organik', 1, 'default-book.png'),
(418, 'Islamic Rose Books', 1, 'default-book.png'),
(419, 'Microsoft Excel', 2, 'default-book.png'),
(420, 'Teori interior /', 2, 'default-book.png'),
(421, 'Merancang Bangun dan Menkonfigurasi Jaringan WAN dengan Packet Tracer', 1, 'default-book.png'),
(422, 'Komputer dan Jaringan Dasar', 1, 'default-book.png'),
(423, 'Simulasi dan komunikasi digital untuk smk/mak kelas x /', 1, 'default-book.png'),
(424, 'Simulasi Digital untuk semua bidang keahlian', 1, 'default-book.png'),
(425, 'Elektronika digital dan mikroprosesor /', 1, 'default-book.png'),
(426, 'Konsep & Implementasi dengan linux ubuntu', 1, 'default-book.png'),
(427, 'Sistem Komputer', 1, 'default-book.png'),
(428, 'Sistem Operasi SMK/MAK Kelas X semester 2', 1, 'default-book.png'),
(429, 'Trik Rahasia : mencari yang tersembunyi di internet', 1, 'default-book.png'),
(430, 'Sistem Komputer untuk SMK/MAK kelas x', 1, 'default-book.png'),
(431, 'PEMROGRAMAN DASAR TEKNIK KOMPUTER DAN INFORMATIKA', 1, 'default-book.png'),
(432, 'Dasar desain grafis bidang keahlian teknologi informasi dan Komunikasi :C2 (dasar program keahlian teknik komputer dan informatika) /', 1, 'default-book.png'),
(433, 'MENGHITUNG RENCANA ANGGARAN BIAYA', 2, 'default-book.png'),
(434, 'GUNTUR DIANTARA POHON POHON PINUS', 1, 'default-book.png'),
(435, 'Dasar Teknis Instalasi jaringan komputer', 2, 'default-book.png'),
(436, 'Langkah demi langkah microsoft exel XP', 1, 'default-book.png'),
(437, 'Prinsip prinsip riset operasi', 2, 'default-book.png'),
(438, 'Rekayasa perangkat lunak (Jilid 3)', 13, 'default-book.png'),
(439, 'olahraga tradisional indonesia', 1, 'default-book.png'),
(440, 'Dasar dasar desain dan implementasi database processing jilid 1', 2, 'default-book.png'),
(441, 'memburu sang bintang', 1, 'default-book.png'),
(442, 'kreasi populer dengan photoshop untuk pemula', 4, 'default-book.png'),
(443, 'Video Iklan Komersial', 3, 'default-book.png'),
(444, 'desain ikon dengan photoshop dan ilustrator', 1, 'default-book.png'),
(445, 'Dasar Desain Grafis', 1, 'default-book.png'),
(446, 'Teknik mempercepat koneksi internet', 1, 'default-book.png'),
(447, 'PEMROGRAMAN DASAR', 1, 'default-book.png'),
(448, 'Microsoft outlook 97', 1, 'default-book.png'),
(449, 'PERAKITAN KOMPUTER', 2, 'default-book.png'),
(450, 'Pintar 256 Software komputer', 1, 'default-book.png'),
(451, 'SISTEM KOMPUTER', 2, 'default-book.png'),
(452, 'Pemrograman WEB untuk SMK/MAK Kelas x', 1, 'default-book.png'),
(453, 'Simulasi Digital untuk SMK/MAK X', 1, 'default-book.png'),
(454, 'Desain Multimedia untuk SMK/MAK Kelas XI', 1, 'default-book.png'),
(455, 'Sistem Komputer SMK/MAK KELAS XI SEMESTER 1', 1, 'default-book.png'),
(456, 'Modul Memperbaiki sistem injeksi bahan bakar diesel', 1, 'default-book.png'),
(457, 'BIMBINGAN DAN KONSELING DI SEKOLAH MENENGAH', 1, 'default-book.png'),
(458, 'uang dan belanja 100 masalah dan solusi', 1, 'default-book.png'),
(459, 'Administrasi Jaringan dengan Linux ubuntu 11', 1, 'default-book.png'),
(460, 'TIP dan TRIK Menyelamatkan File', 1, 'default-book.png'),
(461, 'Pendidikan Agama dan budi pekerti untuk SMK Kelas XI', 1, 'default-book.png'),
(462, 'Biografi Aisyah RA', 1, 'default-book.png'),
(463, 'siap tempur tembus tes masuk TNI/POLRI', 1, 'default-book.png'),
(464, 'Electroplating Teknik Pelapisan logan dengan cara listrik', 1, 'default-book.png'),
(465, 'Power Point 7.0 For Windows 95', 1, 'default-book.png'),
(466, 'Penyuntingan', 1, 'default-book.png'),
(467, 'UUD 1945 & GBHN', 2, 'default-book.png'),
(468, 'Surah Al- Fatihah dan Juz Amma (Terjemahan)', 1, 'default-book.png'),
(469, 'Biologi laut :ilmu pengetahuan tentang biota laut /', 1, 'default-book.png'),
(470, 'UUD 1945 DAN PERUBAHAN', 4, 'default-book.png'),
(471, 'KKPI untuk SMK', 4, 'default-book.png'),
(472, 'Kecerdasan Ruhaniah', 1, 'default-book.png'),
(473, 'Gajahmada pahlawan nusantara', 1, 'default-book.png'),
(474, 'microsoft powerpoint 2007', 1, 'default-book.png'),
(475, 'GERR', 1, 'default-book.png'),
(476, 'Budi daya bawang :bawang putih, bawang merah, bawang bombay /', 1, 'default-book.png'),
(477, 'Inspirasi sukses dari prinsip hidup orang-orang hebat dunia /', 1, 'default-book.png'),
(478, 'Budidaya Tanaman Bawang Merah', 1, 'default-book.png'),
(479, 'Budidaya Salak Pondoh', 1, 'default-book.png'),
(480, 'PENCAHAYAAN ALAMI DALAM ARSITEKTUR', 2, 'default-book.png'),
(481, 'Mari Belajar Bertanam Kentang', 1, 'default-book.png'),
(482, 'Rumput Laut Rumput Harapan', 1, 'default-book.png'),
(483, 'Jaringan Dasar', 2, 'default-book.png'),
(484, 'Organisasi dan Arsitektur Komputer', 3, 'default-book.png'),
(485, 'Dasar Ilmu Hitung Pelayaran', 8, 'default-book.png'),
(486, 'PEMELIHARAAN SISTEM AIR CONDITIONERS', 1, 'default-book.png'),
(487, 'Manga + Photoshop Simple Guidance', 1, 'default-book.png'),
(488, 'Mesin Diesel penggerak Utama Kapal', 18, 'default-book.png'),
(489, '119 Trik Rahasia Aplikasi Internet', 1, 'default-book.png'),
(490, 'Blogspot Teman Nambah Duit Melimpah', 1, 'default-book.png'),
(491, 'Dasar Teknis Instalasi Jaringan Komputer', 1, 'default-book.png'),
(492, 'Dasar dasar desain pencahayaan', 2, 'default-book.png'),
(493, 'Pedoman Pemilihan Kepala Sekolah Pendidikan Menengah Berprestasi tingkat nasional tahun 2011', 1, 'default-book.png'),
(494, 'Teknik menggambar Cepat', 1, 'default-book.png'),
(495, 'Trik menulis blog secara offline', 1, 'default-book.png'),
(496, 'Dasar dasar Perencanaan Ruang', 2, 'default-book.png'),
(497, 'Panduan Praktis Menguasai Opera Turbo 10', 1, 'default-book.png'),
(498, 'Menyusun Surat Surat Penting', 3, 'default-book.png'),
(499, 'Alat Alat Berat Revisi', 2, 'default-book.png'),
(500, 'Hukum Administrasi Negara', 1, 'default-book.png'),
(501, 'Manajemen Penjualan', 1, 'default-book.png'),
(502, 'Manajemen Keuangan', 1, 'default-book.png'),
(503, 'Manajemen Pemasaran', 1, 'default-book.png'),
(504, 'Sistem kelistrikan bodi mobil', 3, 'default-book.png'),
(505, 'Perhitungan Instalasi Listrik', 3, 'default-book.png'),
(506, 'Perencanaan Wisata', 1, 'default-book.png'),
(507, 'Memahami dan Merawat casis mobil', 3, 'default-book.png'),
(508, 'microsoft PowerPoint', 2, 'default-book.png'),
(509, 'MANAJEMEN KUALITAS', 1, 'default-book.png'),
(510, 'Motor Diesel pada Mobil', 3, 'default-book.png'),
(511, 'Instalasi Listrik Rumah tangga', 2, 'default-book.png'),
(512, 'Motor Bensin pada mobil', 2, 'default-book.png'),
(513, 'Manajemen Akuntansi', 1, 'default-book.png'),
(514, 'Servis AC Mobil', 2, 'default-book.png'),
(515, 'Rekayasa Jalan Raya', 2, 'default-book.png'),
(516, 'Metode Tepat Menghemat Bahan Bakar ( bensin ) Mobil', 1, 'default-book.png'),
(517, 'Mencari dan memperbaiki Kerusakan pada TV Berwarna', 2, 'default-book.png'),
(518, 'Teknologi Motor Diesel', 1, 'default-book.png'),
(519, 'Teknik Gambar bangunan (Jilid 2 )', 12, 'default-book.png'),
(520, 'Manajemen Produksi dan Operasi', 1, 'default-book.png'),
(521, 'Teknik Konstruksi Bangunan Gedung (Jilid 1)', 3, 'default-book.png'),
(522, 'Pendidikan Keterampilan Teknik ELektronika Radio Transistor', 1, 'default-book.png'),
(523, 'Mencari dan memperbaiki kerusakan lemari es', 2, 'default-book.png'),
(524, 'Teknik Servis Mesin 2 Tak', 1, 'default-book.png'),
(525, 'Memahami dan Merawat Sistem kelistikan Mobil', 3, 'default-book.png'),
(526, 'Kriya Kayu Jilid 1', 1, 'default-book.png'),
(527, 'Berbinis Di Era Internet Dengan E-Commerce', 1, 'default-book.png'),
(528, 'Pengerjaan Logam dengan perkakas tangan dan mesin sederhana', 1, 'default-book.png'),
(529, 'Pengetahuan bahan dalam pengerjaan logam', 3, 'default-book.png'),
(530, 'Keterampilan teknik listrik praktis', 3, 'default-book.png'),
(531, 'Merawat dan Memperbaiki AC', 2, 'default-book.png'),
(532, 'Instalasi dan Alat - Alat Listrik', 2, 'default-book.png'),
(533, 'service auto mobil', 1, 'default-book.png'),
(534, 'Pesawat Bantu 1', 1, 'default-book.png'),
(535, '150 Resep herbal untuk menaklukan diabetes mellitus', 1, 'default-book.png'),
(536, 'Alat Ukur dan Teknik Pengukuran (Jilid 1)', 5, 'default-book.png'),
(537, 'Membuat Mesin Pengerjaan Logam', 1, 'default-book.png'),
(538, 'Ganti Oli dan Tune Up', 1, 'default-book.png'),
(539, 'Panduan praktis aplikasi database menggunakan visual foxpro untuk pemula', 1, 'default-book.png'),
(540, 'Berbisnis di era internet dengan e-commerce', 2, 'default-book.png'),
(541, 'Teknik Servis Mobil', 1, 'default-book.png'),
(542, 'Panduan Praktis Tune-up Mesin Mobil', 1, 'default-book.png'),
(543, 'Reparasi sistem rem mobil', 3, 'default-book.png'),
(544, 'Belajar komputer Microsoft Word 2000', 3, 'default-book.png'),
(545, 'kupas tuntas kanker payudara', 1, 'default-book.png'),
(546, '201 Cara untuk mendorong setiap karyawan berkinerja', 2, 'default-book.png'),
(547, 'Pelajaran Teknik Mobil', 1, 'default-book.png'),
(548, 'Merawat dan Memperbaiki Sepeda Motor Matic', 1, 'default-book.png'),
(549, 'Modul Memperbaiki SIstem Rem untuk SMK dan MAK', 2, 'default-book.png'),
(550, 'mahir dalam 5 hari Autocad 3D untuk Teknik Mesin', 3, 'default-book.png'),
(551, 'Struktur dan konstruksi bangunan tinggi sistem Top and Down', 1, 'default-book.png'),
(552, 'Modul Menggunakan Alat - Alat ukur', 1, 'default-book.png'),
(553, 'Hidup Bebas Kanker', 1, 'default-book.png'),
(554, 'Teknik Air Conditioning (AC) Mobil', 1, 'default-book.png'),
(555, 'Instalasi Listrik Tingkat Lanjut', 1, 'default-book.png'),
(556, 'Microsoft Word', 2, 'default-book.png'),
(557, 'Autocad 2008 Teknik Menggambar 3D', 2, 'default-book.png'),
(558, 'Berkisar Merah', 1, 'default-book.png'),
(559, 'Modul Penggunaan dan Pemeliharaan Alat Ukur', 1, 'default-book.png'),
(560, 'Konstruksi Kayu', 2, 'default-book.png'),
(561, 'Teknik Sepeda Motor Jilid 3', 1, 'default-book.png'),
(562, 'Kiat & Rahasia Sukses 8 Tokoh Industri Paling Jempolan di Dunia', 1, 'default-book.png'),
(563, 'Tune-up Ringan Sepeda motor 4-Tak', 1, 'default-book.png'),
(564, 'Belajar komputer Power Point', 1, 'default-book.png'),
(565, 'Akustika Bangunan Prinsip - prinsip dan penerapannya di indonesia', 1, 'default-book.png'),
(566, 'Sistem Pengawatan & Pencarian Kesalahan', 2, 'default-book.png'),
(567, 'Merawat dan Memperbaiki Pompa Air', 1, 'default-book.png'),
(568, 'Matsushita Konosuke (1984-1989) Hidup dan Warisannya', 1, 'default-book.png'),
(569, 'Belajar Sendiri VMWARE Workstation', 1, 'default-book.png'),
(570, 'Pesan Lewat Layang-layang', 1, 'default-book.png'),
(571, 'Standar Kompetensi Konstruksi baja', 1, 'default-book.png'),
(572, 'Teknik Sepeda Motor Jilid 2', 12, 'default-book.png'),
(573, 'Teknik Merawat automobil lengkap', 4, 'default-book.png'),
(574, 'Statistik Jilid', 1, 'default-book.png'),
(575, 'Peralatan Bengkel Mobil', 3, 'default-book.png'),
(576, 'Teknik Transmisi Tenaga Listrik Jilid 3', 1, 'default-book.png'),
(577, 'Piye Kabare..? Penak Jamanku to!', 1, 'default-book.png'),
(578, 'dasar dasar teknik listrik', 2, 'default-book.png'),
(579, 'Membuat Mesin Pengerjaan Logam', 2, 'default-book.png'),
(580, 'Moga Bunda Disayang Allah', 1, 'default-book.png'),
(581, 'Tabel Profil Konstruksi Baja', 1, 'default-book.png'),
(582, 'Kisah Para Pahlawan Bangsa', 1, 'default-book.png'),
(583, 'Fiqih Wanita', 1, 'default-book.png'),
(584, 'Home Cooking ala Xander\'s Kitchen', 1, 'default-book.png'),
(585, 'Teknik membuat Penguat audio', 1, 'default-book.png'),
(586, 'Webster\'s Family Encyclopedia', 1, 'default-book.png'),
(587, 'Teori dan perawatan mesin mobil', 2, 'default-book.png'),
(588, 'Pemeliharaan & Perbaikan dalam Teknik Elektronika', 1, 'default-book.png'),
(589, 'Pelajaran Dasar Televisi', 1, 'default-book.png'),
(590, '6 menit belajar linux dan jaringan', 1, 'default-book.png'),
(591, 'Terjemahan Al Qur\'an secara Lafzhiyah Jilid IV', 1, 'default-book.png'),
(592, 'Seri peluang usaha Reparasi JOK dan Modifikasi Interior', 2, 'default-book.png'),
(593, 'Anak Indonesia dan Pak Harto', 1, 'default-book.png'),
(594, 'Kriptografi untuk keamanan jaringan', 4, 'default-book.png'),
(595, 'Pengolahan Citra Digital 1', 1, 'default-book.png'),
(596, 'Pemeliharan sistem pendinginan dan pelumasan mobil', 1, 'default-book.png'),
(597, 'Aneka Kreasi Paduan Rempah & Biji-bijian', 1, 'default-book.png'),
(598, 'Kesan Pergaulan Bersama Adi Winarso', 1, 'default-book.png'),
(599, 'Dr. Cipto Mangunkusumo Sang Dokter yang Berjiwa Merdeka', 1, 'default-book.png'),
(600, 'Inspirasi Sukses dari Prinsip Hidup Orang-orang hebat Dunia', 1, 'default-book.png'),
(601, 'Mohammad Hatta Menuju Gerbang Kemerdekaan', 1, 'default-book.png'),
(602, 'Bikin Sendiri Alat Instrumentasi Bengekl Kerja Elektronika', 1, 'default-book.png'),
(603, 'Usaha Jasa Pariwasata Jilid 1', 1, 'default-book.png'),
(604, 'Elemen Elemen Elektromagnetika teknik', 3, 'default-book.png'),
(605, 'Teknik Gambar bangunan (Jilid 1 )', 4, 'default-book.png'),
(606, 'Teknik Gambar bangunan (Jilid 3)', 9, 'default-book.png'),
(607, 'Seri Peluang Usaha Servis Radiator', 1, 'default-book.png'),
(608, 'Mikroelektronika sistem digital dan rangkaian analog JILID2', 1, 'default-book.png'),
(609, 'Mejadi Kaya dengan UKM Otomotofif Roda Dua', 2, 'default-book.png'),
(610, 'Pengerjaan Logam dengan mesin', 1, 'default-book.png'),
(611, 'rekayasa perangkat lunak (Jilid 2)', 4, 'default-book.png'),
(612, 'Teknik Bongkar Pasang Kerangka dan Bodi Mobil', 1, 'default-book.png'),
(613, 'Pengetahuan Mesin-mesin', 1, 'default-book.png'),
(614, 'Pedoman Pembinaan dan Pengembangan Usaha Kesehatan Sekolah (UKS)', 1, 'default-book.png'),
(615, 'Rekayasa perangkat lunak (Jilid 1)', 4, 'default-book.png'),
(616, 'Teknik Pendingin (AC, Freezer dan Kulkas)', 1, 'default-book.png'),
(617, 'Perkakas dan Bahan Teknik Otomotif', 2, 'default-book.png'),
(618, 'Kriya kayu Jilid 2', 2, 'default-book.png'),
(619, 'Teknik Produksi Mesin Industri Jilid 1', 1, 'default-book.png'),
(620, 'Hemat BBM Dengan Air', 2, 'default-book.png'),
(621, 'Tata Busana Jilid 1', 1, 'default-book.png'),
(622, 'Aplikasi Elektromagnetik Jilid 2', 1, 'default-book.png'),
(623, 'teknik konstruksi bangunan gedung (jilid 2)', 6, 'default-book.png'),
(624, 'Restoran (Jilid 1)', 1, 'default-book.png'),
(625, 'Restoran (jilid 3)', 1, 'default-book.png'),
(626, 'Ternak Ruminansia (Jilid 3)', 1, 'default-book.png'),
(627, 'Ternak Ruminansia (Jilid 1)', 1, 'default-book.png'),
(628, 'Akomodasi Perhotelan (Jilid 3)', 1, 'default-book.png'),
(629, 'Teknik Budidaya tanaman (Jilid 3)', 1, 'default-book.png'),
(630, 'Sinyal dan Sistem (Jilid 1)', 2, 'default-book.png'),
(631, 'Elemen Elemen ilmu dan rekayasa material (Edisi ke Enam)', 1, 'default-book.png'),
(632, 'Akuntansi Industri (Jilid 1)', 1, 'default-book.png'),
(633, 'Kesekretarisan (Jilid 2)', 1, 'default-book.png'),
(634, 'pokok pokok teknologi struktur untuk konstruksi dan arsitektur', 1, 'default-book.png'),
(635, 'teknologi pangan (Jilid 1)', 1, 'default-book.png'),
(636, 'Prinsip - Prinsip Perancangan Teknik', 2, 'default-book.png'),
(637, 'Konsep dasar Akuntansi dan pelaporan keuangan (Jilid 2)', 1, 'default-book.png'),
(638, 'Nautika kapal Penangkapan Ikan (Jilid 3)', 2, 'default-book.png'),
(639, 'Teknik Perkayuan Jilid 2', 1, 'default-book.png'),
(640, 'Kriya Tekstil (Jilid 3)', 1, 'default-book.png'),
(641, 'Etika Enjiniring (Edisi Kedua)', 2, 'default-book.png'),
(642, 'Ternak Ruminansia (Jilid 3)', 1, 'default-book.png'),
(643, 'Pembangunan Pendidikan SMK', 1, 'default-book.png'),
(644, 'tata kecantikan Kulit (Jilid 3)', 0, 'default-book.png'),
(645, 'Keterampilan Keramik', 2, 'default-book.png'),
(646, 'Psikologi Olahraga Winning The Mind Game', 2, 'default-book.png'),
(647, 'konsep dasar akuntansi dan pelaporan keuangan', 1, 'default-book.png'),
(648, 'Instalasi listrik tingkat lanjut edisi ketiga', 1, 'default-book.png'),
(649, 'merawat sepeda motor matic', 1, 'default-book.png'),
(650, 'Kewirausahaan Menjalankan Usaha Kecil Kelas XII', 2, 'default-book.png'),
(651, 'Pemeliharan Mesin Sepeda Motor ( Jilid 1 )', 1, 'default-book.png'),
(652, 'Budidaya Ikan (Jilid 3)', 1, 'default-book.png'),
(653, 'Teknik Listrik Dasar Otomotif ( Jilid 1 )', 1, 'default-book.png'),
(654, 'Budidaya ikan (Jilid 2)', 1, 'default-book.png'),
(655, 'Memahami Mekanika Tanah', 1, 'default-book.png'),
(656, 'Perilaku Organisasi edisi kedelapan ( jilid 1 )', 1, 'default-book.png'),
(657, 'Usaha Jasa pariwisata (Jilid 2)', 1, 'default-book.png'),
(658, 'Akuntansi Industri (Jilid 2)', 0, 'default-book.png'),
(659, 'Akomodasi Perhotelan (Jilid 2)', 1, 'default-book.png'),
(660, 'Matematika Sekolah Menengah Kejuruan / MAK Kelas XI', 1, 'default-book.png'),
(661, 'Kewirausahaan Sikap & Perilaku Wirausaha Kelas X', 1, 'default-book.png'),
(662, 'Jaringan Dasar untuk SMK/MAK kelas X', 1, 'default-book.png'),
(663, 'Kontruksi Bangunan Gedung Betingkat Rendah ( Edisi Revisi )', 1, 'default-book.png'),
(664, 'Akomodasi Perhotelan (Jilid 1)', 1, 'default-book.png'),
(665, 'Teknologi Pangan (Jilid 2)', 1, 'default-book.png'),
(666, 'Prinsip Dasar Teknologi Jaringan Telekomunikasi', 1, 'default-book.png'),
(667, 'Teknik Pemanfaatan Tenaga Listrik (Jilid 1)', 1, 'default-book.png'),
(668, 'Teknik Produksi mesin Industri (Jilid 3)', 1, 'default-book.png'),
(669, 'Kesekretarisan', 1, 'default-book.png'),
(670, 'Teknik Kontruksi Bangunan Gedung ( Jilid 1 )', 1, 'default-book.png'),
(671, 'Modul pemeliharaan/servis perbaikan, dan overhaul kopling dan komponen komponennya', 2, 'default-book.png'),
(672, 'pembangkitan energi listrik', 2, 'default-book.png'),
(673, 'Tata Kecantikan Kulit ( Jilid 2 )', 1, 'default-book.png'),
(674, 'Teknik Pembangkit Tenaga Listrik ( Jilid 2 )', 1, 'default-book.png'),
(675, 'azas-azas ilmu kimia', 1, 'default-book.png'),
(676, 'Medan ELektromagnetika Terapan', 1, 'default-book.png'),
(677, 'Teknik Permainan Futsal', 1, 'default-book.png'),
(678, 'Modul Pemeriksaan dan pemeliharaan / servis sistem suspensi', 1, 'default-book.png'),
(679, 'Penjelajahan dan Olahraga Alam', 1, 'default-book.png'),
(680, 'Modul Menggunakan Alat - Alat Ukur (Measuring Tools)', 2, 'default-book.png'),
(681, 'Permainan Softball', 1, 'default-book.png'),
(682, 'Permainan Sepak Takraw', 1, 'default-book.png'),
(683, 'Jago Elektronik secara otodidak', 1, 'default-book.png'),
(684, '100 Atlet Legendaris Indonesia', 1, 'default-book.png'),
(685, 'Merakit Sendiri Alat penjernih air untuk rumah tangga', 1, 'default-book.png'),
(686, 'SEMEN Jenis & Aplikasinya', 1, 'default-book.png'),
(687, 'Psikologi Olahraga', 1, 'default-book.png'),
(688, 'Ketrampilan Keramik', 2, 'default-book.png'),
(689, 'tata busana (Jilid 2)', 1, 'default-book.png'),
(690, 'Teknik Bodi Otomotif (Jilid 3)', 1, 'default-book.png'),
(691, 'Konsep Dasar Akuntansi dan pelaporan Keuangan (Jilid 3)', 1, 'default-book.png'),
(692, 'Menghitung Anggaran Biaya Bangunan', 1, 'default-book.png'),
(693, 'Sindrom usus Rengsa', 1, 'default-book.png'),
(694, 'Teknik Pembangkit Tenaga Listrik ( Jilid 3 )', 1, 'default-book.png'),
(695, 'Teknik Produksi Mesin Industri ( Jilid 1 )', 1, 'default-book.png'),
(696, 'Teknik Sepeda Motor ( Jilid 1 )', 1, 'default-book.png'),
(697, 'SINYAL dan SISTEM (Jilid 2)', 2, 'default-book.png'),
(698, 'Teknik Budidaya Tanaman (Jilid 1)', 1, 'default-book.png'),
(699, 'Teknik Pemesinan (Jilid 1)', 1, 'default-book.png'),
(700, 'Desain Beton Bertulang (Jilid 1)', 1, 'default-book.png'),
(701, 'DASAR DASAR ELEKTRONIKA', 1, 'default-book.png'),
(702, 'Menggerinda Pahat dan Alat Potong SMK', 1, 'default-book.png'),
(703, 'Teknologi Beton', 1, 'default-book.png'),
(704, 'Kumpulan Gambar Pengerjaan Bahan Logam', 1, 'default-book.png'),
(705, 'Seri Peluang Usaha Otomotif Servis Radiator', 1, 'default-book.png'),
(706, 'Restoran ( jilid 2 )', 1, 'default-book.png'),
(707, 'Teknologi Dasar Otomotif', 1, 'default-book.png'),
(708, 'Selayang Pandang Dinas Kependudukan dan Pencatatan Sipil Kota Tegal', 1, 'default-book.png'),
(709, 'Merawat dan Memperbaiki AC Mobil', 1, 'default-book.png'),
(710, 'Menciptakan Company Profile dengan Adobe Flash', 4, 'default-book.png'),
(711, 'Kreatif Membuat Ragam Desain Media dengan Corel Draw', 3, 'default-book.png'),
(712, 'Bentuk Struktur bangunan dalam arsitektur modern', 1, 'default-book.png'),
(713, 'Teknik Pengelasan Kapal Jilid 2', 1, 'default-book.png'),
(714, 'Memahami Mekanika Teknik 2', 1, 'default-book.png'),
(715, 'KIMIA TEKNOLOGI DAN INDUSTRI', 1, 'default-book.png'),
(716, 'merawat dan memperbaiki mesin cuci', 1, 'default-book.png'),
(717, 'IPA (Untuk Kelas X)', 1, 'default-book.png'),
(718, 'Cara Praktis Belajar Elektronika', 1, 'default-book.png'),
(719, 'Matematika (Kelas XI)', 2, 'default-book.png'),
(720, 'operational amplifiers edisi ( 5 )', 5, 'default-book.png'),
(721, 'Geometri', 2, 'default-book.png'),
(722, 'Rangkaian Listrik', 2, 'default-book.png'),
(723, 'Membangun Website Bisnis Online dalam Sehari Kerja', 1, 'default-book.png'),
(724, 'KALKULUS', 2, 'default-book.png'),
(725, 'Bullied Teacher Builled Student ( guru dan siswa yang terintimidasi)', 1, 'default-book.png'),
(726, 'Kimia Untuk Pemula', 2, 'default-book.png'),
(727, 'Aljabar Linier', 2, 'default-book.png'),
(728, 'Statistik', 2, 'default-book.png'),
(729, 'Biokimia', 1, 'default-book.png'),
(730, 'Alat Ukur dan Teknik Pengukuran (Jilid 2)', 6, 'default-book.png'),
(731, 'Teknik Sepeda Motor', 1, 'default-book.png'),
(732, 'Keterampilan Komputer dan Pengelolaan Informasi SMK/MAK kelas XI', 1, 'default-book.png'),
(733, 'INSTALASI LISTRIK DASAR', 1, 'default-book.png'),
(734, 'Pengukuran Kapal Indonesia', 1, 'default-book.png'),
(735, 'Manajemen Pengingkatan Mutu Berbasis Sekolah ( edisi 3 )', 1, 'default-book.png'),
(736, 'Teknologi Dasar Otomotif Untuk SMK/MAK Kelas X', 1, 'default-book.png'),
(737, 'Manajemen Proyek Kontruksi Edisi Revisi', 1, 'default-book.png'),
(738, 'Modul Pemeliharaan / Servis Sistem Bahan Bakar Bensin SMK / MAK', 7, 'default-book.png'),
(739, 'Detail Akustik ( edisi 3 )', 2, 'default-book.png'),
(740, 'Fisika (Jilid 2)', 10, 'default-book.png'),
(741, 'Prinsip - Prinsip Elektrornika (Jilid 2)', 4, 'default-book.png'),
(742, 'Rock Climbing Panjat Tebing', 2, 'default-book.png'),
(743, 'Teknik Pemeliharaan dan perbaikan sistem elektronika (Jilid 2)', 4, 'default-book.png'),
(744, 'Buku Panduan Dril Gulat', 1, 'default-book.png'),
(745, 'Teknik Listrik Industri (Jlid 1)', 1, 'default-book.png'),
(746, 'Engineering & Computer Science 1981', 1, 'default-book.png'),
(747, 'Teknik Transmisi Tenaga Listrik (Jilid 1)', 1, 'default-book.png'),
(748, 'Teknik Pemeliharan dan perbaikan sistem elektronika (Jilid 1)', 2, 'default-book.png'),
(749, 'Teknik Pemeliharaan dan perbaikan sistem elektronika (Jilid 3)', 1, 'default-book.png'),
(750, 'Teknik Pemeliharaan dan perbaikan sistem elektronika (Jilid 1)', 1, 'default-book.png'),
(751, 'ENSIKLOPEDI SERI MENGENAL HEWAN LAUT 2', 5, 'default-book.png'),
(752, 'Pengenalan Elektronika Untuk Pemula', 1, 'default-book.png'),
(753, 'tata kecantikan kulit jid 1', 1, 'default-book.png'),
(754, 'Melatih Remaja Gulat', 2, 'default-book.png'),
(755, 'Pokok Pokok Elektronika', 1, 'default-book.png'),
(756, 'TATA ECANTIKAN RAMBUT JID 3', 1, 'default-book.png'),
(757, 'Bikin Sendiri Equalizier', 1, 'default-book.png'),
(758, 'Identifikasi Cedera Pada Olahraga Softball', 1, 'default-book.png'),
(759, 'SENI BUDAYA XI', 1, 'default-book.png'),
(760, 'Teknik Mesin Industri Jilid 2', 1, 'default-book.png'),
(761, 'Struktur Penulisan dan Pengkajian UPACARA TRADISIONAL DI KABUPATEN SRAGEN', 2, 'default-book.png'),
(762, 'Modul Memelihara Unit Final Drive / Gardan', 4, 'default-book.png'),
(763, 'WACANA KAWEDHAR', 1, 'default-book.png'),
(764, 'Gerakan dan Serangan GULAT Peraih Kemenangan', 1, 'default-book.png'),
(765, 'PERMAINAN SOFTBALL', 1, 'default-book.png'),
(766, 'RANCANGAN VISUAL', 1, 'default-book.png'),
(767, 'Modul Memelihara/Servis Engine dan Komponen-Komponennya', 1, 'default-book.png'),
(768, 'BUKU PANDUAN DRIL GULAT', 1, 'default-book.png'),
(769, 'Modul Pemeliharaan / Servis, Perbaikan dan overhaoul sistem Pendingin dan Komponen Komponennya', 12, 'default-book.png'),
(770, 'ILUSTRASI KONSTRUKSI BANGAUNAN', 2, 'default-book.png'),
(771, 'ANIMASI 2D', 1, 'default-book.png'),
(772, 'TEKNIK ANIMASI 3 DIMENSI', 1, 'default-book.png'),
(773, 'Ilmu Pengetahuan Alam Untuk Kelas XII', 1, 'default-book.png'),
(774, 'SENI BUDAYA 1', 2, 'default-book.png'),
(775, 'MEMAHAMI PONDASI', 1, 'default-book.png'),
(776, 'PENJELAJAH DAN OLAHRAGA ALAM', 0, 'default-book.png'),
(777, 'KRIYA TEKSTIL (JILID 2)', 1, 'default-book.png'),
(778, 'Komputer dan Jaringan Dasar Kelas X', 1, 'default-book.png'),
(779, 'PENULISAN DAN PENGKAJIAN UPACARA TRAISIONAL DI KAB REMBANG', 3, 'default-book.png'),
(780, 'LINTAS OLAHRGA SEPEDA', 2, 'default-book.png'),
(781, 'dasar-dasar balap sepeda', 1, 'default-book.png'),
(782, 'SENI RUPA DAN KERAJINAN TANGAN', 1, 'default-book.png'),
(783, 'AYO MEMOTRET DENGAN DSLR', 1, 'default-book.png'),
(784, 'CABANG OLAHRAGA POPULER AKTIVITAS KETANGKASAN DAN BELA DIRI', 1, 'default-book.png'),
(785, 'panduan membangun rumah', 2, 'default-book.png'),
(786, 'SENI BUDAYA UNTUK SMK JILID 2', 1, 'default-book.png'),
(787, 'seni budaya untuk smk jilid 1', 1, 'default-book.png'),
(788, 'SEJARAH LAGU KEBANGSAAN INDONESIA RAYA', 1, 'default-book.png'),
(789, 'petunjuk pelaksanaan wisata siswa', 1, 'default-book.png'),
(790, 'RANCANGAN VISUAL LANSEKAP JALAN', 1, 'default-book.png'),
(791, 'Modul Memelihara Transmisi', 5, 'default-book.png'),
(792, 'Modul Memelihara / servis engine dan komponen komponennya', 4, 'default-book.png'),
(793, 'Las Listrik SMAW dan Pemeriksaan hasil pengelasan', 1, 'default-book.png'),
(794, 'Matematika Bilingual untuk SMA Kelas X', 3, 'default-book.png'),
(795, 'latihan Psikotes (JUNIOR)', 1, 'default-book.png');
INSERT INTO `coba` (`id`, `nama`, `salin`, `gambar`) VALUES
(796, 'Ilmu Pengetahuan Alam Untuk Kelas XI (JILID 2)', 7, 'default-book.png'),
(797, 'Kimia Bilingual Untuk SMA/MA Kelas X Semester 1 dan 2', 4, 'default-book.png'),
(798, 'Kalkulus', 1, 'default-book.png'),
(799, 'Matematika SMK Bisnis dan Manajemen ( jilid 3 )', 1, 'default-book.png'),
(800, 'Pemrograman Dasar Untuk SMK/MAK Kelas X', 1, 'default-book.png'),
(801, 'Fisika Bilingual Untuk SMA / MA Kelas XI', 2, 'default-book.png'),
(802, 'Pekerjaan dasar teknik mesin Bidang Keahlian Teknologi dan rekayasa untuk kelas X', 1, 'default-book.png'),
(803, 'MEtalurgi Fisik Modern & Rekaya Material Edisi Keenam', 1, 'default-book.png'),
(804, 'Serat Optik : Sebuah Pengantar Edisi Ketiga', 1, 'default-book.png'),
(805, 'Biologi Laut : Ilmu pengetahuan tentang biodata Laut', 1, 'default-book.png'),
(806, 'buku guru seni budaya klas xii', 4, 'default-book.png'),
(807, 'buku guru seni budaya klas x', 1, 'default-book.png'),
(808, 'SENI BUDAYA XII', 1, 'default-book.png'),
(809, 'Fisika Bilingual untuk SMA/MA Kelas XII ( Semester 1 dan 2)', 3, 'default-book.png'),
(810, 'Fisika Untuk SMK Teknologi (JILID 2)', 1, 'default-book.png'),
(811, 'Memperbaiki sisitem rem', 3, 'default-book.png'),
(812, 'Prinsip - Prinsip Kimia Modern Edisi Ke Empat (Jilid 2)', 1, 'default-book.png'),
(813, 'Prinsip - Prinsip Kimia Modern Edisi Ke Empat (Jilid 1)', 2, 'default-book.png'),
(814, 'Kimia Bilingual Untuk SMA/MA Untuk Kelas XII Semester 1 dan 2', 3, 'default-book.png'),
(815, 'Gambar Teknik Bidang keahlian Teknologi dan rekayasa SMK/MAK Kelas X Semester 1', 1, 'default-book.png'),
(816, 'Mesin Tangan Industri Kayu', 1, 'default-book.png'),
(817, 'Konstruksi Bangunan Gedung Tidak Bertingkat', 1, 'default-book.png'),
(818, 'Teknik Pemanfaatan Tenaga Listrik (Jilid 2)', 1, 'default-book.png'),
(819, 'Menggunakan Perkakas Tangan SMK Kelas X Semester 1 dan 2', 1, 'default-book.png'),
(820, 'TEKNIK KELISTRIKAN KAPAL', 1, 'default-book.png'),
(821, 'Ilmu Pelayaran Astronomi', 1, 'default-book.png'),
(822, 'DASAR-DASAAR STABILITAS KAPAL', 1, 'default-book.png'),
(823, 'ILMU PELAYARAN', 1, 'default-book.png'),
(824, 'iQUERY & AJAX', 1, 'default-book.png'),
(825, 'Beton Prategang Edisi Ke Tiga (JILID 2)', 1, 'default-book.png'),
(826, 'Gambar Teknik Edisi Kesebelas (JILID 2)', 1, 'default-book.png'),
(827, 'A+ Proyek - Proyek Fisika', 2, 'default-book.png'),
(828, 'Prinsip - Prinsip Statistik Untuk Teknik dan Sains', 1, 'default-book.png'),
(829, 'Fisika Bilingual untuk SMA/MA Kelas X Semester 1 dan 2', 3, 'default-book.png'),
(830, 'Kimia Untuk SMK/MAK Kelas XI (Jilid 2)', 5, 'default-book.png'),
(831, 'Kimia Untuk SMK/MAK Kelas X (Jilid 1)', 7, 'default-book.png'),
(832, 'FISIKA Kelompok Teknologi dan Kesehatan untuk Kelas X (Jilid 1)', 9, 'default-book.png'),
(833, 'Ilmu Pengetahuan Alam Untuk Kelas X (Jilid 1)', 9, 'default-book.png'),
(834, 'Serat Optik : Sebuah Pengantar [edisi Ketiga]', 1, 'default-book.png'),
(835, 'MATEMATIKA UNTUK SMK&MAK KELAS XII (JILID 3)', 4, 'default-book.png'),
(836, 'Matematika Untuk SMK & MAK Kelas XI (JILID 2)', 7, 'default-book.png'),
(837, 'MATEMATIKA UNTUK SMK/MAK KELAS X (JILID 1)', 4, 'default-book.png'),
(838, 'MANAJEMEN PERAWATAN KAPAL', 1, 'default-book.png'),
(839, 'TEKNOLOGI ALAT PENANGKAPAN IKAN', 1, 'default-book.png'),
(840, 'Matematika Bilingual Untuk SMA XII IPA Semester 1 & 2', 3, 'default-book.png'),
(841, 'Prinsip-Prinsip Elektronika Jilid 2', 1, 'default-book.png'),
(842, 'METEOROLOGI DAN OSEANOGRAFI', 1, 'default-book.png'),
(843, 'Fisika Untuk SMK Teknologi (JILID 1)', 3, 'default-book.png'),
(844, 'Fisika Untuk SMK Teknologi (Jilid 2)', 2, 'default-book.png'),
(845, 'HUKUM MARITIM', 1, 'default-book.png'),
(846, 'Fisika Bidang Teknologi dan Rekayasa untuk SMK/MAK Kelas X (Jilid 1)', 3, 'default-book.png'),
(847, 'Kimia Kelas XI', 1, 'default-book.png'),
(848, 'SISTEM PERAWATAN PERMESINAN KAPAL', 1, 'default-book.png'),
(849, 'Matematika SMA/MA/SMK/MAK Kelas X', 2, 'default-book.png'),
(850, 'NAUTIKA BANGUNAN KAPAL STABILITAS KAPAL HUKUM LAUT PESAWAT KAPAL', 1, 'default-book.png'),
(851, 'Fisika SMK Kelas XII', 1, 'default-book.png'),
(852, 'DINAS JAGA', 1, 'default-book.png'),
(853, 'KOMPAS & SISTEM KEMUDI', 1, 'default-book.png'),
(854, 'KIMIA SMK Tingkat 1', 1, 'default-book.png'),
(855, 'Matematika (Buku Guru) Kelas X', 2, 'default-book.png'),
(856, 'TEKNIK KELISTRIKAN KAPAL', 1, 'default-book.png'),
(857, 'Kalkulus Edisi Kedelapan (JILID 1)', 2, 'default-book.png'),
(858, 'Rangkaian Elektronik Prinsip dan Aplikasi', 1, 'default-book.png'),
(859, 'Kalkulus Edisi Kedelapan (JILID 2)', 2, 'default-book.png'),
(860, 'Matematika Bilingual Untuk SMA IPA Kelas XI Semester 1 & 2', 3, 'default-book.png'),
(861, 'Aplikasi Elektromagnetik Edisi Ketiga (JILID 1)', 2, 'default-book.png'),
(862, 'Modul Matematika Teknologi,Kesehatan dan pertanian Untuk SMK Kelas X', 2, 'default-book.png'),
(863, 'Tata Busana (JILID 3)', 1, 'default-book.png'),
(864, 'Matematika Buku Guru SMA/MA/SMK/MAK Kelas XI', 2, 'default-book.png'),
(865, 'Aljabar Linier Elementer Edisi Kedelapan (JILID 2)', 2, 'default-book.png'),
(866, 'Mekanika Fluida Edisi Ke empat (JILID 2)', 1, 'default-book.png'),
(867, 'Pekerjaan Dasar Teknik Otomotif kelas X', 1, 'default-book.png'),
(868, 'Jago Elektronika scara Otodidak', 1, 'default-book.png'),
(869, 'Dasar Kelistrikan Tingkat 1', 1, 'default-book.png'),
(870, 'KETEL UAP, TURBIN UAP DAN TURBIN GAS PENGGERAK UTAMA KAPAL', 1, 'default-book.png'),
(871, 'KAMUS PELAYARAN & MARITIM', 1, 'default-book.png'),
(872, 'KOMUNIKASI DAN DINAS JAGA KAPAL PERIKANAN', 1, 'default-book.png'),
(873, 'LEADERSHIP TEAMWORK DALAM PELAYARAN', 1, 'default-book.png'),
(874, 'MESIN DIESEL PENGGERAK UTAMA KAPAL', 1, 'default-book.png'),
(875, 'Kepedulian Lingkungan Laut', 1, 'default-book.png'),
(876, 'nebula ', 12, 'default-book.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `katalog`
--

CREATE TABLE `katalog` (
  `id` int(11) NOT NULL,
  `ISBN` varchar(30) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `Image-URL-S` varchar(200) NOT NULL,
  `Image-URL-M` varchar(200) NOT NULL,
  `Image-URL-L` varchar(200) NOT NULL,
  `kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `eksemplar` int(11) NOT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(20) DEFAULT NULL,
  `kategori` varchar(40) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`, `keterangan`) VALUES
('K0001', 'Programing', ''),
('K0002', 'Sains', ''),
('K0004', 'Pendidikan', ''),
('K0005', 'Pemula', ''),
('K0006', 'Informatika', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `firstname`, `lastname`, `username`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'M RIZQI', 'FAUZI MAKSUM', 'fauziadmin@gmail.com', '$2y$10$XpU84ZFnCn0WhCYr0y/6nOLcATlxuqaO0lSfpRCxZs7UPphcHEDla', 'admin', '2023-06-22 20:25:46', '2023-06-22 20:25:46'),
(2, 'admin', '2', 'admin2@gmail.com', '$2y$10$XpU84ZFnCn0WhCYr0y/6nOLcATlxuqaO0lSfpRCxZs7UPphcHEDla', 'admin', '2023-08-13 16:18:07', '2023-08-13 16:18:07'),
(20, 'AHMAD', 'FAJRIANSYAH', 'ahmadfajriansyah@gmail.com', '$2y$10$5QXXxawn3BfeiYpCdlU9yuEWe3Q..XXxGhHssOv5GMj/Yg0QTafhq', 'siswa', '2023-07-06 22:07:13', '2023-07-06 22:07:13'),
(24, 'ANGGITA', 'WIBOWO ', 'anggitawibowo96@gmail.com', '$2y$10$PqIAWASXoCKRP9jsaL.qjunaEDelxn/m8R7.nABq2VyfnzXPMxzv.', 'siswa', '2023-07-13 15:27:38', '2023-07-13 15:27:38'),
(25, 'DHIRO', 'BAHARI ', 'dhirobahari@gmail.com', '$2y$10$Tw.ldvvDQ3CDkOr7i6dKxeo4Po0IF6K83ShH/Rpt0gHXS64UkF5X.', 'siswa', '2023-07-12 15:46:12', '2023-07-12 15:46:12'),
(26, 'ozi', 'RIZKY', 'rizkydwisaputrar@gmail.com', '$2y$10$CcvLbja0GzOShFvtskwb7eWjwRFMPuWPh/qPqwtNNRYVrH5Tj5Msu', 'siswa', '2023-07-17 12:49:31', '2023-07-17 12:49:31'),
(27, 'RIZKYDWIS', 'saputra', 'rizkydwisaputrar1@gmail.com', '$2y$10$7KgEzKCaOJCZyV2kLFFTnO06bcn2D4f/sFNJvNgEpTv8zCnSvfAPS', 'siswa', '2023-07-17 12:54:33', '2023-07-17 12:54:33'),
(28, 'ozimaksum', 'ysysgyig', 'gaozimaksum@gmail.com', '$2y$10$oV6kUzbcQvWAIxlK9KvQQOOiCzKuhyKIgKSQyWICYDzMdIXwuxUHy', 'siswa', '2023-07-17 17:01:13', '2023-07-17 17:01:13'),
(29, 'rizqimaksum', 'maksum', 'rizqimaksum123@gmail.com', '$2y$10$WNyZ4hIEcQ0sG0Xa1nRqNeyitLwTMMCN.nAjgXaO82uzMxOJYd83m', 'siswa', '2023-07-18 06:58:21', '2023-07-18 06:58:21'),
(30, 'VIRGIO', 'ARWA SANDHIKA ', 'rizkydwisaputrr@gmail.com', '$2y$10$n3MY14noZSgYon9.pIfM7OY5pnkHJ.QHK9LTYtPqt8AoSXddyPDi2', 'siswa', '2023-07-18 07:26:13', '2023-07-18 07:26:13'),
(31, 'ozimaksum', 'maksum', 'blbla@gmail.com', '$2y$10$.ToBbdT/8iAC7yPzN6sJYOBL6Pva1bkUwQ15.t4p4wyAki4PPmHKq', 'siswa', '2023-07-18 07:39:08', '2023-07-18 07:39:08'),
(32, 'ozicobalagi', 'cobalgi', 'oziicobalagi@gmail.com', '$2y$10$NPQYkLh7fCqEj.r6QZTqAOwwwhVVnaknZz3qqgNId/KtbDveCgZX.', 'siswa', '2023-07-18 14:31:34', '2023-07-18 14:31:34'),
(33, 'AULIA', 'PITALOKA GUNAWAN ', 'auliapitaloka@gmail.com', '$2y$10$5aBONZZE9Pnm8ke.Ntj3LefIGKDXOsDjZzdJ/4iMDU0OhSSEu5C.2', 'siswa', '2023-07-31 22:30:33', '2023-07-31 22:30:33'),
(34, 'AZHARA', 'SALMA SAFITRI ', 'azharasalma@gmail.com', '$2y$10$EHBeiUgoNbwX2fiGi30tMeeXu5RvtNYnPfAO14gfpeWtMquXipYIa', 'siswa', '2023-08-04 20:15:43', '2023-08-04 20:15:43'),
(35, 'admin', '3333', 'admin3@gmail.com', '$2y$10$XpU84ZFnCn0WhCYr0y/6nOLcATlxuqaO0lSfpRCxZs7UPphcHEDla', 'admin', '2023-08-13 17:48:41', '2023-08-13 17:48:41'),
(36, 'ALLENA', 'RAHMA FAOHILA ', 'allena251@gmail.com', '$2y$10$Ifkgx5cR15C/2HgiLgXWp.IiH0BE8J1JCC0fFISD7Z2YEWJi2RSr2', 'siswa', '2023-09-27 19:31:42', '2023-09-27 19:31:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `nis` bigint(20) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `jurusan` varchar(12) NOT NULL,
  `kelas` varchar(4) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id`, `nis`, `fullname`, `jurusan`, `kelas`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(2, 207451, 'ALLENA RAHMA FAOHILA', 'TKJ', 'XII', '213443667', 'allena251@gmail.com', '2023-06-23 00:00:00', '2023-07-26 14:12:24'),
(3, 207452, 'AMANDA NISYA AOERORA', 'TKJ', 'XII', '', 'amanda@gmail.com', '2023-06-24 00:00:00', '2023-06-27 16:36:00'),
(4, 207453, 'ANGGITA WIBOWO', 'TKJ', 'XII', '', 'anggitawibowo96@gmail.com', '2023-06-25 00:00:00', '2023-07-13 15:27:38'),
(5, 207454, 'AULIA PITALOKA GUNAWAN', 'TKJ', 'XII', '', 'auliapitaloka@gmail.com', '2023-06-26 00:00:00', '2023-07-31 22:30:33'),
(6, 207455, 'AZHARA SALMA SAFITRI', 'TKJ', 'XII', '', 'azharasalma@gmail.com', '2023-06-27 00:00:00', '2023-08-04 20:15:43'),
(7, 207456, 'BANI FADHLIH AZKA FEBRIAN', 'TKJ', 'XII', '', '', '2023-06-28 00:00:00', '2023-06-28 00:00:00'),
(8, 207457, 'DHIRO BAHARI', 'TKJ', 'XII', '', 'dhirobahari@gmail.com', '2023-06-29 00:00:00', '2023-07-12 15:46:12'),
(9, 207458, 'DIAN TRESIANA YULIANTI', 'TKJ', 'XII', '', '', '2023-06-30 00:00:00', '2023-06-30 00:00:00'),
(10, 207459, 'DWI HILMAN FEBRIANSYAH', 'TKJ', 'XII', '', '', '2023-07-01 00:00:00', '2023-07-01 00:00:00'),
(11, 207460, 'DYAH AYU SAVITRI', 'TKJ', 'XII', '', 'fauziuser@gmail.com', '2023-07-02 00:00:00', '2023-07-06 23:20:04'),
(12, 207461, 'EKA BAGAS PRASETYA', 'TKJ', 'XII', '', '', '2023-07-03 00:00:00', '2023-07-03 00:00:00'),
(13, 207462, 'ERNESTA AULIA CAHYANI', 'TKJ', 'XII', '', '', '2023-07-04 00:00:00', '2023-07-04 00:00:00'),
(14, 207463, 'ESYA JUANG KURNIA', 'TKJ', 'XII', '', '', '2023-07-05 00:00:00', '2023-07-05 00:00:00'),
(15, 207464, 'FAD ANTIKA HAPSARI', 'TKJ', 'XII', '', '', '2023-07-06 00:00:00', '2023-07-06 00:00:00'),
(16, 207465, 'FINDA AYU KHOIRUNNISA', 'TKJ', 'XII', '', '', '2023-07-07 00:00:00', '2023-07-07 00:00:00'),
(17, 207466, 'JIHAN MAULIDAH AZZAHRA', 'TKJ', 'XII', '', '', '2023-07-08 00:00:00', '2023-07-08 00:00:00'),
(18, 207467, 'LISZA INDANA ZULFA', 'TKJ', 'XII', '', '', '2023-07-09 00:00:00', '2023-07-09 00:00:00'),
(19, 207468, 'LULU NAILA ROMADHONA', 'TKJ', 'XII', '', '', '2023-07-10 00:00:00', '2023-07-10 00:00:00'),
(20, 207469, 'MOHAMMAD FAJAR SUBECHI', 'TKJ', 'XII', '', '', '2023-07-11 00:00:00', '2023-07-11 00:00:00'),
(21, 207470, 'MUCHAMMAD YANUAR ROCHMA', 'TKJ', 'XII', '', '', '2023-07-12 00:00:00', '2023-07-12 00:00:00'),
(22, 207471, 'MUHAMMAD IQBAL', 'TKJ', 'XII', '', '', '2023-07-13 00:00:00', '2023-07-13 00:00:00'),
(23, 207472, 'MUHAMMAD IQBAL SAPUTRA', 'TKJ', 'XII', '', '', '2023-07-14 00:00:00', '2023-07-14 00:00:00'),
(24, 207473, 'MUHAMMAD RAMADITYA', 'TKJ', 'XII', '', '', '2023-07-15 00:00:00', '2023-07-15 00:00:00'),
(25, 207474, 'MUKHAMMAD AKHADDIN', 'TKJ', 'XII', '', '', '2023-07-16 00:00:00', '2023-07-16 00:00:00'),
(26, 207475, 'RADITA ZAHWA ALLIYAH', 'TKJ', 'XII', '', '', '2023-07-17 00:00:00', '2023-07-17 00:00:00'),
(27, 207476, 'RESTA SABRINA', 'TKJ', 'XII', '', '', '2023-07-18 00:00:00', '2023-07-18 00:00:00'),
(28, 207477, 'ROYAN WILDAN NURYAMAN', 'TKJ', 'XII', '', 'royan@gmail.com', '2023-07-19 00:00:00', '2023-06-26 08:29:10'),
(29, 207478, 'SHAFA MAULANA RAMADHANI', 'TKJ', 'XII', '', '', '2023-07-20 00:00:00', '2023-07-20 00:00:00'),
(30, 207479, 'SYAH IRKHAM RAMADHAN', 'TKJ', 'XII', '', '', '2023-07-21 00:00:00', '2023-07-21 00:00:00'),
(31, 207480, 'VIRGIO ARWA SANDHIKA', 'TKJ', 'XII', '', 'rizkydwisaputrr@gmail.com', '2023-07-22 00:00:00', '2023-07-18 07:26:13'),
(32, 207481, 'VITO DIMAS SAPUTRA', 'TKJ', 'XII', '', '', '2023-07-23 00:00:00', '2023-07-23 00:00:00'),
(33, 207483, 'ZAKI ARUNDAYA', 'TKJ', 'XII', '', 'zakiara@gmail.com', '2023-07-24 00:00:00', '2023-06-26 08:38:15'),
(35, 123, 'RIZKYDWIS', '', '', '08928472193', 'rizkydwisaputrar1@gmail.com', '2023-07-17 12:53:38', '2023-07-17 12:54:33'),
(36, 556356, 'ozimaksum', '', '', '082313593935', 'gaozimaksum@gmail.com', '2023-07-17 16:59:52', '2023-07-17 17:01:13'),
(37, 61771818, 'rizqimaksum', '', '', '085800001455', 'rizqimaksum123@gmail.com', '2023-07-18 06:57:16', '2023-07-18 06:58:21'),
(38, 69696, 'ozimaksum', '', '', NULL, 'blbla@gmail.com', '2023-07-18 07:37:28', '2023-07-18 07:39:08'),
(39, 455777, 'ozicobalagi', '', '', NULL, 'oziicobalagi@gmail.com', '2023-07-18 14:30:43', '2023-07-18 14:31:34'),
(40, 17829, 'zami maksum', '', '', NULL, NULL, '2023-07-20 23:05:28', '2023-07-20 23:05:28'),
(41, 425525, 'zamimaksum ozi', '', '', NULL, NULL, '2023-07-20 23:06:41', '2023-07-20 23:06:41'),
(42, 92828298, 'oziiakak', '', '', NULL, NULL, '2023-07-20 23:20:45', '2023-07-20 23:20:45'),
(43, 9090808, 'gozi', '', '', NULL, NULL, '2023-07-20 23:22:54', '2023-07-20 23:22:54'),
(49, 991929, 'xii', '', '', NULL, NULL, '2023-08-20 01:51:28', '2023-08-20 01:51:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `tanggal_pinjam` date DEFAULT current_timestamp(),
  `tanggal_kembali` date NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `member_id`, `book_id`, `tanggal_pinjam`, `tanggal_kembali`, `status`) VALUES
(32, 207453, 0, '2023-08-15', '2023-08-22', 0),
(33, 207455, 0, '2023-08-15', '2023-08-22', 0),
(34, 207455, 0, '2023-08-15', '2023-08-22', 0),
(35, 207455, 0, '2023-08-15', '2023-08-22', 0),
(36, 207455, 0, '2023-08-20', '2023-08-27', 0),
(37, 207455, 0, '2023-08-20', '2023-08-27', 0),
(38, 207455, 0, '2023-08-20', '2023-08-27', 0),
(39, 207455, 0, '2023-08-23', '2023-08-30', 0),
(40, 207455, 0, '2023-08-23', '2023-08-30', 0),
(41, 207455, 0, '2023-08-28', '2023-09-04', 0),
(42, 207455, 0, '2023-09-01', '2023-09-08', 0),
(43, 207455, 0, '2023-09-02', '2023-09-09', 0),
(44, 207455, 0, '2023-09-08', '2023-09-15', 0),
(45, 207455, 0, '2023-09-12', '2023-09-19', 0),
(46, 207455, 0, '2023-09-18', '2023-09-25', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(20) DEFAULT NULL,
  `penerbit` varchar(60) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `penerbit`, `keterangan`) VALUES
('P0001', 'Ria Ricis', ''),
('P0002', 'Boy William', ''),
('P0003', 'Radhian Sobarna', ''),
('P0004', 'Widi P', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengadaan`
--

CREATE TABLE `pengadaan` (
  `id_pengadaan` varchar(10) DEFAULT NULL,
  `id_buku` varchar(60) DEFAULT NULL,
  `asal_buku` varchar(60) DEFAULT NULL,
  `jml` int(4) DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `tgl` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengadaan`
--

INSERT INTO `pengadaan` (`id_pengadaan`, `id_buku`, `asal_buku`, `jml`, `ket`, `tgl`) VALUES
('PNG0001', 'B0003', 'Sumedang', 5, '-', '2020-04-15'),
('PNG0002', 'B0002', 'Sumedang', 6, '-', '2020-04-22'),
('PNG0003', 'B0001', 'Sumedang', 6, '-', '2020-04-21'),
('PNG0004', 'B0004', 'Sumedang', 5, '-', '2020-09-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_kembali` int(10) NOT NULL,
  `tgl_kembali` varchar(20) DEFAULT NULL,
  `id_pinjam` varchar(20) DEFAULT NULL,
  `terlambat` varchar(15) DEFAULT NULL,
  `denda` varchar(15) DEFAULT NULL,
  `id_admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengembalian`
--

INSERT INTO `pengembalian` (`id_kembali`, `tgl_kembali`, `id_pinjam`, `terlambat`, `denda`, `id_admin`) VALUES
(16, '2020-09-15', 'PJM0002', '-', '-', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_user` varchar(20) NOT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `notelp` varchar(13) DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') DEFAULT NULL,
  `level` enum('Petugas','Kepala','Administrasi') DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_user`, `nama`, `email`, `pass`, `notelp`, `status`, `level`, `foto`) VALUES
('U0001', 'Admin', 'admin@gmail.com', 'admin123', '087892878222', 'Aktif', 'Administrasi', 'user.png'),
('U0003', 'Dhea Mawarni', 'dhea@gmail.com', 'petugas123', '087892871888', 'Aktif', 'Petugas', 'dhea.jpg'),
('U0004', 'Radhian Sobarna', 'radhiantsobarna@gmail.com', 'radhiant99', '087817379229', 'Aktif', 'Kepala', 'aeng.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perpusweb_peminjaman`
--

CREATE TABLE `perpusweb_peminjaman` (
  `id_pinjam` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `id_anggota` varchar(5) DEFAULT NULL,
  `tempo` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `usr_input` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `perpusweb_peminjaman`
--

INSERT INTO `perpusweb_peminjaman` (`id_pinjam`, `tgl_pinjam`, `id_anggota`, `tempo`, `status`, `ket`, `usr_input`) VALUES
('PJM0001', '2020-09-15', 'A0003', '2020-09-18', 'Pinjam', '', 'Admin'),
('PJM0002', '2020-09-15', 'A0003', '2020-09-18', 'Kembali', '', 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `p_buku`
--

CREATE TABLE `p_buku` (
  `id_pbuku` int(5) NOT NULL,
  `id_pinjam` varchar(50) DEFAULT NULL,
  `id_buku` varchar(50) DEFAULT NULL,
  `qty` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `p_buku`
--

INSERT INTO `p_buku` (`id_pbuku`, `id_pinjam`, `id_buku`, `qty`) VALUES
(57, 'PJM0001', 'B0004', '10'),
(58, 'PJM0002', 'B0003', '5'),
(59, 'PJM0002', 'B0004', '10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak`
--

CREATE TABLE `rak` (
  `id_rak` varchar(20) DEFAULT NULL,
  `rak` varchar(60) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rak`
--

INSERT INTO `rak` (`id_rak`, `rak`, `keterangan`) VALUES
('Rak-01', 'Khusus Pemula', ''),
('Rak-02', 'Khusus Pelajar', ''),
('Rak-03', 'Sastra', ''),
('Rak-04', 'Coding', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `book_dataset`
--
ALTER TABLE `book_dataset`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `coba`
--
ALTER TABLE `coba`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `katalog`
--
ALTER TABLE `katalog`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nis`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_kembali`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `p_buku`
--
ALTER TABLE `p_buku`
  ADD PRIMARY KEY (`id_pbuku`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `book_dataset`
--
ALTER TABLE `book_dataset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `coba`
--
ALTER TABLE `coba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=877;

--
-- AUTO_INCREMENT untuk tabel `katalog`
--
ALTER TABLE `katalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_kembali` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `p_buku`
--
ALTER TABLE `p_buku`
  MODIFY `id_pbuku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
