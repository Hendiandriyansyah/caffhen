-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2023 at 03:38 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caffhen`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis_menu`
--

CREATE TABLE `tbl_jenis_menu` (
  `id_jenis_menu` int(11) NOT NULL,
  `jenis_menu` varchar(200) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jenis_menu`
--

INSERT INTO `tbl_jenis_menu` (`id_jenis_menu`, `jenis_menu`, `id_pegawai`) VALUES
(40, 'Makanan', 1),
(41, 'Minuman', 1),
(42, 'Coffe', 1),
(43, 'Snack', 1);

--
-- Triggers `tbl_jenis_menu`
--
DELIMITER $$
CREATE TRIGGER `tJenisMenuDelete` BEFORE DELETE ON `tbl_jenis_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - Menghapus nama pegawai : ', old.jenis_menu ));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tJenisMenuTambah` AFTER INSERT ON `tbl_jenis_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - menanbah jenis menu : ', new.jenis_menu));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tJenisMenuUpdate` BEFORE UPDATE ON `tbl_jenis_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - mengubah jenis menu : ', old.jenis_menu, ' menjadi ', new.jenis_menu));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id_log` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `aksi` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`id_log`, `id_pegawai`, `nama_pegawai`, `jabatan`, `aksi`, `date`) VALUES
(648, 1, 'Manager Baru', 'Manajer', 'Jenis menu - mengubah jenis menu : Paket Hemat 1 menjadi Coffe', '2023-02-07 16:13:10'),
(649, 1, 'Manager Baru', 'Manajer', 'Jenis menu - menanbah jenis menu : Snack', '2023-02-07 16:13:18'),
(650, 1, 'Manager Baru', 'Manajer', 'Nama menu - mengubah nama menu : Nasi Liwet menjadi Americano, jenis menu : Makanan menjadi Coffe dan harga dari Rp. 25000 menjadi Rp. 13000', '2023-02-08 11:50:05'),
(651, 1, 'Manager Baru', 'Manajer', 'Nama menu - mengubah nama menu : Telor Dadar menjadi IceCappuchino, jenis menu : Makanan menjadi Coffe dan harga dari Rp. 3500 menjadi Rp. 15000', '2023-02-08 11:50:51'),
(652, 1, 'Manager Baru', 'Manajer', 'Nama menu - mengubah nama menu : Es Jeruk menjadi Coffe Beer, jenis menu : Minuman menjadi Coffe dan harga dari Rp. 10000 menjadi Rp. 10000', '2023-02-08 11:51:31'),
(653, 1, 'Manager Baru', 'Manajer', 'Nama menu - mengubah nama menu : Es Campur menjadi Mochacinno, jenis menu : Minuman menjadi Coffe dan harga dari Rp. 15000 menjadi Rp. 13000', '2023-02-08 11:53:16'),
(654, 1, 'Manager Baru', 'Manajer', 'Nama menu - mengubah nama menu : Tahu + Tempe  menjadi Matcha, jenis menu : Coffe menjadi Coffe dan harga dari Rp. 3000 menjadi Rp. 13000', '2023-02-08 11:54:10'),
(655, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Red Velvet, jenis menu : Minuman dan harga : Rp. 13000', '2023-02-08 11:55:50'),
(656, 1, 'Manager Baru', 'Manajer', 'Nama menu - mengubah nama menu : Matcha menjadi Matcha, jenis menu : Coffe menjadi Minuman dan harga dari Rp. 13000 menjadi Rp. 13000', '2023-02-08 11:56:08'),
(657, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Es Teh, jenis menu : Minuman dan harga : Rp. 6000', '2023-02-08 12:23:03'),
(658, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : French Fries, jenis menu : Snack dan harga : Rp. 8000', '2023-02-08 12:28:42'),
(659, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Keripik Ubi, jenis menu : Snack dan harga : Rp. 5000', '2023-02-08 12:29:38'),
(660, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Roti Bakar, jenis menu : Makanan dan harga : Rp. 10000', '2023-02-08 12:30:05'),
(661, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Dimsum Ayam, jenis menu : Makanan dan harga : Rp. 15000', '2023-02-08 12:30:40'),
(662, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Dimsum Sapi, jenis menu : Makanan dan harga : Rp. 18000', '2023-02-08 12:31:06'),
(663, 1, 'Manager Baru', 'Manajer', 'Nama menu - mengubah nama menu : Roti Bakar menjadi Roti Bakar, jenis menu : Makanan menjadi Snack dan harga dari Rp. 10000 menjadi Rp. 10000', '2023-02-08 12:31:38'),
(664, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Dimsum Jamur, jenis menu : Makanan dan harga : Rp. 17000', '2023-02-08 12:32:21'),
(665, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Nasi Goreng, jenis menu : Makanan dan harga : Rp. 16000', '2023-02-08 12:34:10'),
(666, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Mie Ayam, jenis menu : Makanan dan harga : Rp. 16000', '2023-02-08 12:34:31'),
(667, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Nasi Uduk, jenis menu : Makanan dan harga : Rp. 7000', '2023-02-08 12:35:11'),
(668, 1, 'Manager Baru', 'Manajer', 'Nama menu - menanbah nama menu : Nasi Putih, jenis menu : Makanan dan harga : Rp. 5000', '2023-02-08 12:35:32'),
(669, 1, 'Manager Baru', 'Manajer', 'Pegawai - Mengubah nama pegawai : Manager Baru menjadi Zalfa, jenis kelamin : Perempuan menjadi Perempuan, alamat : Jl. Jakarta menjadi Jl. Jakarta , telp : 081 menjadi 081', '2023-02-08 13:39:33'),
(670, 2, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Administrator menjadi Hendi, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Subang menjadi Jl. Subang , telp : 081 menjadi 081', '2023-02-08 13:39:46'),
(671, 17, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Siswa menjadi Udin, jenis kelamin : Perempuan menjadi Laki-laki, alamat : Jl. Banda No. 1 menjadi Jl. Banda No. 1 , telp : 081 menjadi 081', '2023-02-08 13:40:56'),
(672, 18, 'Edi Kribo', 'Kasir', 'Transaksi detail - menjual Americano sebanyak 4 dengan harga Rp. 13000', '2023-02-09 13:43:35'),
(673, 18, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Edi Kribo menjadi Jamal, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Sunda No. 1 menjadi Jl. Sunda No. 1, telp : 081234 menjadi 081234', '2023-02-09 13:46:04'),
(674, 18, 'Jamal', 'Kasir', 'Transaksi detail - menjual Coffe Beer sebanyak 10 dengan harga Rp. 10000', '2023-02-13 13:33:39'),
(675, 18, 'Jamal', 'Kasir', 'Transaksi detail - menjual Es Teh sebanyak 3 dengan harga Rp. 6000', '2023-02-14 12:16:07'),
(676, 1, 'Zalfa', 'Manajer', 'Jenis menu - menanbah jenis menu : tes', '2023-02-14 13:01:59'),
(677, 1, 'Zalfa', 'Manajer', 'Jenis menu - Menghapus nama pegawai : tes', '2023-02-14 13:02:03'),
(678, 2, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Hendi menjadi Hendi, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Subang  menjadi Jl. Subang  , telp : 081 menjadi 081', '2023-02-14 13:09:57'),
(679, 17, 'Hendi', 'Admin', 'Login : menghapus username kasir1', '2023-02-15 13:27:14'),
(680, 17, 'Zalfa', 'Manajer', 'Pegawai - Menghapus nama pegawai : Udin', '2023-02-15 13:28:27'),
(681, 2, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Hendi menjadi Hendi, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Subang   menjadi Jl. Subang   , telp : 081 menjadi 081', '2023-02-15 13:29:37'),
(682, 18, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Jamal menjadi Jamal, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Sunda No. 1 menjadi Jl. Sunda No. 1 , telp : 081234 menjadi 085', '2023-02-15 13:30:22'),
(683, 18, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Jamal menjadi Zalfa, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Sunda No. 1  menjadi Jl. Sunda No. 1  , telp : 085 menjadi 085', '2023-02-15 13:31:05'),
(684, 18, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Zalfa menjadi Zalfa, jenis kelamin : Laki-laki menjadi Perempuan, alamat : Jl. Sunda No. 1   menjadi Jl. Sunda No. 1   , telp : 085 menjadi 085', '2023-02-15 13:31:16'),
(685, 1, 'Zalfa', 'Manajer', 'Pegawai - Mengubah nama pegawai : Zalfa menjadi Adit, jenis kelamin : Perempuan menjadi Laki-laki, alamat : Jl. Jakarta  menjadi Jl. Jakarta  , telp : 081 menjadi 081', '2023-02-15 13:31:43'),
(686, 19, 'Adit', 'Manajer', 'Pegawai - menanbah nama pegawai : Putri dan jabatan sebagai Kasir', '2023-02-15 13:33:26'),
(687, 2, 'Hendi', 'Admin', 'Login : menambahkan username : putri', '2023-02-15 13:34:03'),
(688, 2, 'Hendi', 'Admin', 'Login : merubah username : putri menjadi putri', '2023-02-15 13:34:47'),
(689, 19, 'Hendi', 'Admin', 'Login : menghapus username putri', '2023-02-15 13:35:17'),
(690, 19, 'Adit', 'Manajer', 'Pegawai - Menghapus nama pegawai : Putri', '2023-02-15 13:36:10'),
(691, 2, 'Adit', 'Manajer', 'Pegawai - Mengubah nama pegawai : Hendi menjadi Adit, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Subang    menjadi Jl. Subang    , telp : 081 menjadi 081', '2023-02-15 13:36:58'),
(692, 1, 'Adit', 'Manajer', 'Pegawai - Mengubah nama pegawai : Adit menjadi Hendi, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Jakarta   menjadi Jl. Jakarta   , telp : 081 menjadi 081', '2023-02-15 13:37:12'),
(693, 2, 'Hendi', 'Manajer', 'Pegawai - Mengubah nama pegawai : Adit menjadi Adit, jenis kelamin : Laki-laki menjadi Laki-laki, alamat : Jl. Subang     menjadi Jl. Subang     , telp : 081 menjadi 081', '2023-02-15 13:39:03'),
(694, 20, 'Hendi', 'Manajer', 'Pegawai - menanbah nama pegawai : Danu dan jabatan sebagai Admin', '2023-02-15 13:40:02'),
(695, 2, 'Adit', 'Admin', 'Login : menambahkan username : danu', '2023-02-15 13:40:39'),
(696, 2, 'Adit', 'Admin', 'Login : merubah username : kasir menjadi zalfa', '2023-02-15 13:41:39'),
(697, 2, 'Adit', 'Admin', 'Login : merubah username : admin menjadi adit', '2023-02-15 13:41:57'),
(698, 2, 'Adit', 'Admin', 'Login : merubah username : manajer menjadi hendi', '2023-02-15 13:42:08'),
(699, 20, 'Danu', 'Admin', 'Login : merubah username : hendi menjadi admin', '2023-02-15 13:44:25'),
(700, 20, 'Danu', 'Admin', 'Login : merubah username : adit menjadi manajer', '2023-02-15 13:44:39'),
(701, 20, 'Danu', 'Admin', 'Login : merubah username : zalfa menjadi kasir', '2023-02-15 13:44:50'),
(702, 20, 'Adit', 'Admin', 'Login : menghapus username danu', '2023-02-15 13:45:56'),
(703, 2, 'Adit', 'Admin', 'Login : merubah username : admin menjadi hendi', '2023-02-15 13:47:50'),
(704, 2, 'Adit', 'Admin', 'Login : merubah username : manajer menjadi admin', '2023-02-15 13:48:00'),
(705, 2, 'Adit', 'Admin', 'Login : merubah username : hendi menjadi manajer', '2023-02-15 13:48:10'),
(706, 20, 'Hendi', 'Manajer', 'Pegawai - Menghapus nama pegawai : Danu', '2023-02-15 13:55:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id_login` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id_login`, `id_pegawai`, `username`, `password`, `id_admin`) VALUES
(93, 1, 'manajer', '202cb962ac59075b964b07152d234b70', 2),
(94, 2, 'admin', '202cb962ac59075b964b07152d234b70', 2),
(113, 18, 'kasir', '202cb962ac59075b964b07152d234b70', 2);

--
-- Triggers `tbl_login`
--
DELIMITER $$
CREATE TRIGGER `tLoginHapus` BEFORE DELETE ON `tbl_login` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Login : menghapus username ', old.username));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tLoginTambah` AFTER INSERT ON `tbl_login` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_admin, nm_peg, jbt, CONCAT('Login : menambahkan username : ', new.username));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tLoginUpdate` BEFORE UPDATE ON `tbl_login` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_admin, nm_peg, jbt, CONCAT('Login : merubah username : ', old.username, ' menjadi ', new.username));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `id_jenis_menu` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `img` varchar(150) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `nama_menu`, `id_jenis_menu`, `harga`, `img`, `id_pegawai`) VALUES
(46, 'Americano', 42, 13000, '08022023125005americano.jpg', 1),
(47, 'IceCappuchino', 42, 15000, '08022023125051IceCappucino.jpg', 1),
(48, 'Coffe Beer', 42, 10000, '08022023125131Coffee_Beer.jpg', 1),
(49, 'Mochacinno', 42, 13000, '08022023125316Mochacinno.jpg', 1),
(50, 'Matcha', 41, 13000, '08022023125410matcha.jpg', 1),
(51, 'Red Velvet', 41, 13000, '08022023125550redvalvet.jpg', 1),
(52, 'Es Teh', 41, 6000, '08022023132303Esteh.jpg', 1),
(53, 'French Fries', 43, 8000, '08022023132842FrenchFries.jpg', 1),
(54, 'Keripik Ubi', 43, 5000, '08022023132938keripikubi.jpg', 1),
(55, 'Roti Bakar', 43, 10000, '08022023133005RotiBakar.jpg', 1),
(56, 'Dimsum Ayam', 40, 15000, '08022023133040dimsumayam.jpg', 1),
(57, 'Dimsum Sapi', 40, 18000, '08022023133106dimsumsapi.jpg', 1),
(58, 'Dimsum Jamur', 40, 17000, '08022023133221dimsumjamur.jpg', 1),
(59, 'Nasi Goreng', 40, 16000, '08022023133410nasgor.jpg', 1),
(60, 'Mie Ayam', 40, 16000, '08022023133431mieayam.jpg', 1),
(61, 'Nasi Uduk', 40, 7000, '08022023133511nasduk.jpg', 1),
(62, 'Nasi Putih', 40, 5000, '08022023133532nasput.jpg', 1);

--
-- Triggers `tbl_menu`
--
DELIMITER $$
CREATE TRIGGER `tMenuDelete` BEFORE DELETE ON `tbl_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - Menghapus nama menu : ', old.nama_menu ));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tMenuTambah` AFTER INSERT ON `tbl_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 DECLARE jm VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;
 SELECT jenis_menu INTO jm FROM tbl_jenis_menu WHERE id_jenis_menu = new.id_jenis_menu;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - menanbah nama menu : ', new.nama_menu, ', jenis menu : ', jm, ' dan harga : Rp. ', new.harga));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tMenuUpdate` BEFORE UPDATE ON `tbl_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 DECLARE jm VARCHAR(100);
 DECLARE jm1 VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;
 SELECT jenis_menu INTO jm FROM tbl_jenis_menu WHERE id_jenis_menu = new.id_jenis_menu;
  SELECT jenis_menu INTO jm1 FROM tbl_jenis_menu WHERE id_jenis_menu = old.id_jenis_menu;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - mengubah nama menu : ', old.nama_menu, ' menjadi ', new.nama_menu, ', jenis menu : ', jm1, ' menjadi ', jm, ' dan harga dari Rp. ', old.harga, ' menjadi Rp. ', new.harga));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(100) NOT NULL,
  `jabatan` enum('Kasir','Manajer','Admin') NOT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`id_pegawai`, `nama_pegawai`, `jenis_kelamin`, `alamat`, `telp`, `jabatan`, `photo`, `id_admin`) VALUES
(1, 'Hendi', 'Laki-laki', 'Jl. Jakarta   ', '081', 'Manajer', '', 1),
(2, 'Adit', 'Laki-laki', 'Jl. Subang     ', '081', 'Admin', '15022023143903male.png', 1),
(18, 'Zalfa', 'Perempuan', 'Jl. Sunda No. 1   ', '085', 'Kasir', '', 1);

--
-- Triggers `tbl_pegawai`
--
DELIMITER $$
CREATE TRIGGER `tPegawaiHapus` BEFORE DELETE ON `tbl_pegawai` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - Menghapus nama pegawai : ', old.nama_pegawai ));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tPegawaiTambah` AFTER INSERT ON `tbl_pegawai` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - menanbah nama pegawai : ', new.nama_pegawai, ' dan jabatan sebagai ', new.jabatan));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tPegawaiUpdate` BEFORE UPDATE ON `tbl_pegawai` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - Mengubah nama pegawai : ', old.nama_pegawai, ' menjadi ', new.nama_pegawai, ', jenis kelamin : ', old.jenis_kelamin, ' menjadi ', new.jenis_kelamin,', alamat : ', old.alamat, ' menjadi ', new.alamat, ', telp : ', old.telp, ' menjadi ', new.telp ));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `tgl_transaksi`, `no_transaksi`, `total_transaksi`, `no_meja`, `total_bayar`, `id_pegawai`) VALUES
(226, '2023-02-09', '20230209000000226', 52000, 12, 55000, 18),
(227, '2023-02-13', '20230213000000227', 100000, 15, 100000, 18),
(228, '2023-02-14', '20230214000000228', 18000, 2, 20000, 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_detail`
--

CREATE TABLE `tbl_transaksi_detail` (
  `id_detail` int(11) NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaksi_detail`
--

INSERT INTO `tbl_transaksi_detail` (`id_detail`, `no_transaksi`, `id_menu`, `qty`, `harga`, `id_pegawai`) VALUES
(306, '20230209000000226', 46, 4, 13000, 18),
(307, '20230213000000227', 48, 10, 10000, 18),
(308, '20230214000000228', 52, 3, 6000, 18);

--
-- Triggers `tbl_transaksi_detail`
--
DELIMITER $$
CREATE TRIGGER `tTransaksiTambah` AFTER INSERT ON `tbl_transaksi_detail` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 DECLARE nmMenu VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;
 SELECT nama_menu INTO nmMenu FROM tbl_menu WHERE id_menu = new.id_menu;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Transaksi detail - menjual ', nmMenu, ' sebanyak ', new.qty, ' dengan harga Rp. ', new.harga));
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  ADD PRIMARY KEY (`id_jenis_menu`),
  ADD UNIQUE KEY `jenis_menu` (`jenis_menu`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_jenis_menu_2` (`id_jenis_menu`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  MODIFY `id_jenis_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=707;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD CONSTRAINT `tbl_transaksi_detail_ibfk_2` FOREIGN KEY (`no_transaksi`) REFERENCES `tbl_transaksi` (`no_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
