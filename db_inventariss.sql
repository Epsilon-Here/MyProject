-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2025 at 10:52 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventariss`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `jumlah` int(11) NOT NULL,
  `jumlah_tersedia` int(11) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `deskripsi`, `jumlah`, `jumlah_tersedia`, `lokasi`, `kode`, `created_at`) VALUES
(1, 'Buku GLS', 'Buku panduan cara mempelajari tata bahasa dengan baik', 300, 300, 'Perpustakaan', '0001', '2025-11-23 20:58:16'),
(2, 'Sapu', 'Sapu kelas', 200, 200, 'gudang 1', '0002', '2025-11-23 20:55:20'),
(3, 'laptop', 'laptop baru', 10, 9, 'gedung 2', '0003', '2025-11-23 21:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kategori` enum('pinjam','kembali') NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `catatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_barang`, `peminjam`, `jumlah`, `kategori`, `tanggal`, `catatan`) VALUES
(1, 1, 'Agus', 1, 'pinjam', '0000-00-00 00:00:00', 'gg'),
(2, 2, 'Agus', 1, 'pinjam', '2025-11-23 20:49:51', 'q'),
(3, 1, 'Agus', 1, 'kembali', '2025-11-23 20:50:26', 'wee'),
(4, 2, 'Agus', 1, 'kembali', '2025-11-23 20:55:20', 'qte'),
(5, 1, 'ugu', 1, 'pinjam', '2025-11-23 20:57:59', 'uuu'),
(6, 1, 'tttt', 1, 'kembali', '2025-11-23 20:58:16', 'tttt'),
(7, 3, 'Agus', 1, 'pinjam', '2025-11-23 21:42:55', 'agus');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` enum('admin','superadmin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `created_at`, `role`) VALUES
(1, 'Admin', 'Adminn', '$2y$10$Jb/NSphX6I13HZ.DrbmlXOltZnM.WRcm4jaddlnqfmy/51tn8VMl.', '2025-11-23 20:06:39', 'superadmin'),
(3, 'Shiroko', 'Shiroko Abydos', '$2y$10$.vCufCJzNf7pe81LxAy4nuSU7OXA2ZAi.WhIVwxhSZXRZwuD37Hbu', '2025-11-23 20:54:50', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
