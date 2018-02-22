-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2018 at 04:14 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `istana_warna`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode_brg` varchar(10) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jenis_brg` varchar(20) DEFAULT NULL,
  `ukuran_brg` varchar(50) DEFAULT NULL,
  `stok_brg` int(5) NOT NULL DEFAULT '0',
  `satuan_brg` varchar(20) NOT NULL DEFAULT 'Pcs',
  `harga_brg` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hutang`
--

CREATE TABLE IF NOT EXISTS `hutang` (
`id_hutang` int(3) NOT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `keterangan` enum('Lunas','Belum Lunas','','') NOT NULL,
  `nama_hutang` varchar(50) NOT NULL,
  `total_hutang` int(20) NOT NULL,
  `tgl_hutang` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `kode_pelanggan` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `kontak_pelanggan` varchar(30) DEFAULT NULL,
  `alamat_pelanggan` varchar(50) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_hutang`
--

CREATE TABLE IF NOT EXISTS `pembayaran_hutang` (
  `id_pembayaran` int(11) NOT NULL,
  `id_hutang` int(11) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `pembayaran` enum('Tunai','Transfer','','') NOT NULL,
  `total_pembayaran` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_piutang`
--

CREATE TABLE IF NOT EXISTS `pembayaran_piutang` (
  `id_pembayaran_piutang` int(6) NOT NULL,
  `id_hutang` int(6) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `jumlah` int(12) NOT NULL,
  `keterangan` enum('Tunai','Transfer','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
`id_pembelian` int(11) NOT NULL,
  `kode_brg` varchar(10) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `kode_toko` varchar(10) NOT NULL,
  `stok_brg` int(5) NOT NULL,
  `harga_satuan` int(10) NOT NULL,
  `total_pembayaran` int(20) NOT NULL,
  `tunai` int(12) DEFAULT NULL,
  `hutang` int(12) DEFAULT NULL,
  `ket_pembayaran` enum('Tunai','Hutang','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
`id_penjualan` int(11) NOT NULL,
  `no_nota` int(11) NOT NULL,
  `nama_pembeli` int(11) NOT NULL,
  `kode_pelanggan` int(11) DEFAULT NULL,
  `tgl_penjualan` date NOT NULL,
  `kd_brg` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_brg` int(11) NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `tunai` int(12) DEFAULT NULL,
  `kredit` int(12) DEFAULT NULL,
  `pembayaran` enum('Tunai','Kredit','','') NOT NULL,
  `pekerjaan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `percetakan`
--

CREATE TABLE IF NOT EXISTS `percetakan` (
`id_percetakan` int(6) NOT NULL,
  `id_penjualan` int(6) NOT NULL,
  `uk_tinggi` int(6) NOT NULL,
  `uk_panjang` int(6) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `design` varchar(20) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `lebih_atas` int(2) NOT NULL DEFAULT '0',
  `lebih_kanan` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `piutang`
--

CREATE TABLE IF NOT EXISTS `piutang` (
`id_piutang` int(3) NOT NULL,
  `no_nota` int(11) NOT NULL,
  `keterangan_piutang` varchar(200) NOT NULL,
  `kode_pelanggan` varchar(10) DEFAULT NULL,
  `tgl_piutang` date NOT NULL,
  `total_piutang` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE IF NOT EXISTS `toko` (
  `kode_toko` varchar(10) NOT NULL,
  `nama_toko` varchar(30) NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(2) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
 ADD PRIMARY KEY (`kode_brg`);

--
-- Indexes for table `hutang`
--
ALTER TABLE `hutang`
 ADD PRIMARY KEY (`id_hutang`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
 ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
 ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
 ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `percetakan`
--
ALTER TABLE `percetakan`
 ADD PRIMARY KEY (`id_percetakan`);

--
-- Indexes for table `piutang`
--
ALTER TABLE `piutang`
 ADD PRIMARY KEY (`id_piutang`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
 ADD PRIMARY KEY (`kode_toko`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hutang`
--
ALTER TABLE `hutang`
MODIFY `id_hutang` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `percetakan`
--
ALTER TABLE `percetakan`
MODIFY `id_percetakan` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `piutang`
--
ALTER TABLE `piutang`
MODIFY `id_piutang` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
