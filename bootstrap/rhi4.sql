-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 05, 2025 at 11:15 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rhi4`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `Id` int NOT NULL,
  `Kd_karyawan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `Jam_masuk` time DEFAULT NULL,
  `Jam_keluar` time DEFAULT NULL,
  `Status_masuk` enum('0','1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '0:Hadir?, 1:Sakit?, 2:Izin?, 3:Alpha?',
  `Keterangan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kd_user` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lokasi_absen_id` int DEFAULT NULL COMMENT 'FK to lokasi_absen.id, indicating the validated location'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `Kd_jabatan` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nm_jabatan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gaji_pokok` decimal(15,2) DEFAULT '0.00',
  `Uang_transport` decimal(15,2) DEFAULT '0.00',
  `Uang_makan` decimal(15,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `Kd_karyawan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nm_karyawan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kd_jabatan` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kelamin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Agama` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Alamat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `No_telp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tempat_lahir` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tgl_lahir` date DEFAULT NULL,
  `Id_ptkp` int DEFAULT NULL,
  `Tgl_masuk` date DEFAULT NULL,
  `nip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_ktp` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rek` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lembur`
--

CREATE TABLE `lembur` (
  `Id` int NOT NULL,
  `Kd_karyawan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `Jam_masuk` time DEFAULT NULL,
  `Jam_keluar` time DEFAULT NULL,
  `Jml_jam` decimal(5,2) DEFAULT '0.00',
  `Uang_lembur` decimal(15,2) DEFAULT '0.00',
  `Total_upah` decimal(15,2) DEFAULT '0.00',
  `Keterangan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kd_user` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_absen`
--

CREATE TABLE `lokasi_absen` (
  `id` int NOT NULL,
  `nama_lokasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Human-readable name (e.g., Kantor Pusat, Gudang BSD)',
  `alamat_lengkap` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Optional full address text',
  `latitude` decimal(10,7) NOT NULL COMMENT 'Latitude coordinate',
  `longitude` decimal(11,7) NOT NULL COMMENT 'Longitude coordinate',
  `radius_meter` int UNSIGNED NOT NULL DEFAULT '50' COMMENT 'Allowed radius in meters from the coordinate for valid check-in',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Flag to enable/disable location (1=Active, 0=Inactive)',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores valid geofenced locations for attendance';

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `No_pinjaman` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kd_karyawan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tanggal` date NOT NULL,
  `Besar_pinjaman` decimal(15,2) DEFAULT '0.00',
  `keterangan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status_lunas` enum('Hutang','lunas') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Hutang',
  `Kd_user` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penggajian`
--

CREATE TABLE `penggajian` (
  `No_penggajian` int NOT NULL,
  `Kd_karyawan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Periode_gaji` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tanggal` date NOT NULL,
  `Gaji_pokok` decimal(15,2) DEFAULT '0.00',
  `Tunj_transport` decimal(15,2) DEFAULT '0.00',
  `Tunj_makan` decimal(15,2) DEFAULT '0.00',
  `Total_lembur` decimal(15,2) DEFAULT '0.00',
  `Total_bonus` decimal(15,2) DEFAULT '0.00',
  `Total_pinjaman` decimal(15,2) DEFAULT '0.00',
  `Kd_user` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permohonan_peminjaman`
--

CREATE TABLE `permohonan_peminjaman` (
  `id` int NOT NULL,
  `Kd_karyawan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timedate` datetime NOT NULL,
  `Besar_pinjaman` decimal(15,2) DEFAULT '0.00',
  `keterangan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_user` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_permohonan` enum('Pending','Approved','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pph21`
--

CREATE TABLE `pph21` (
  `no_pph21` int NOT NULL,
  `Kd_karyawan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Periode_gaji` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tanggal` date NOT NULL,
  `Gaji_pokok` decimal(15,2) DEFAULT '0.00',
  `Tunj_transport` decimal(15,2) DEFAULT '0.00',
  `Tunj_makan` decimal(15,2) DEFAULT '0.00',
  `Total_lembur` decimal(15,2) DEFAULT '0.00',
  `Total_bonus` decimal(15,2) DEFAULT '0.00',
  `Bruto` decimal(15,2) DEFAULT '0.00',
  `Biaya_jabatan` decimal(15,2) DEFAULT '0.00',
  `Netto_sebulan` decimal(15,2) DEFAULT '0.00',
  `Netto_setahun` decimal(15,2) DEFAULT '0.00',
  `Total_ptkp` decimal(15,2) DEFAULT '0.00',
  `Pkp` decimal(15,2) DEFAULT '0.00',
  `Pph21_setahun` decimal(15,2) DEFAULT '0.00',
  `Pph21_sebulan` decimal(15,2) DEFAULT '0.00',
  `Kd_user` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ptkp`
--

CREATE TABLE `ptkp` (
  `Id_ptkp` int NOT NULL,
  `Kd_ptkp` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Total_ptkp` decimal(15,2) DEFAULT '0.00',
  `Keterangan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Kd_user` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kd_karyawan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nm_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `uq_absensi_karyawan_tanggal` (`Kd_karyawan`,`tanggal`),
  ADD KEY `idx_absensi_tanggal` (`tanggal`),
  ADD KEY `fk_absensi_user` (`Kd_user`),
  ADD KEY `idx_absensi_lokasi` (`lokasi_absen_id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`Kd_jabatan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`Kd_karyawan`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD KEY `idx_karyawan_nama` (`Nm_karyawan`),
  ADD KEY `fk_karyawan_jabatan` (`Kd_jabatan`),
  ADD KEY `fk_karyawan_ptkp` (`Id_ptkp`);

--
-- Indexes for table `lembur`
--
ALTER TABLE `lembur`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idx_lembur_tanggal` (`tanggal`),
  ADD KEY `fk_lembur_karyawan` (`Kd_karyawan`),
  ADD KEY `fk_lembur_user` (`Kd_user`);

--
-- Indexes for table `lokasi_absen`
--
ALTER TABLE `lokasi_absen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_nama_lokasi` (`nama_lokasi`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`No_pinjaman`),
  ADD KEY `idx_peminjaman_tanggal` (`Tanggal`),
  ADD KEY `fk_peminjaman_karyawan` (`Kd_karyawan`),
  ADD KEY `fk_peminjaman_user` (`Kd_user`);

--
-- Indexes for table `penggajian`
--
ALTER TABLE `penggajian`
  ADD PRIMARY KEY (`No_penggajian`),
  ADD UNIQUE KEY `uq_penggajian_karyawan_periode` (`Kd_karyawan`,`Periode_gaji`),
  ADD KEY `idx_penggajian_periode` (`Periode_gaji`),
  ADD KEY `fk_penggajian_user` (`Kd_user`);

--
-- Indexes for table `permohonan_peminjaman`
--
ALTER TABLE `permohonan_peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_permohonan_pinjaman_tanggal` (`timedate`),
  ADD KEY `fk_permohonan_karyawan` (`Kd_karyawan`),
  ADD KEY `fk_permohonan_user` (`kd_user`);

--
-- Indexes for table `pph21`
--
ALTER TABLE `pph21`
  ADD PRIMARY KEY (`no_pph21`),
  ADD UNIQUE KEY `uq_pph21_karyawan_periode` (`Kd_karyawan`,`Periode_gaji`),
  ADD KEY `idx_pph21_periode` (`Periode_gaji`),
  ADD KEY `fk_pph21_user` (`Kd_user`);

--
-- Indexes for table `ptkp`
--
ALTER TABLE `ptkp`
  ADD PRIMARY KEY (`Id_ptkp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Kd_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `Kd_karyawan` (`Kd_karyawan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lembur`
--
ALTER TABLE `lembur`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lokasi_absen`
--
ALTER TABLE `lokasi_absen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penggajian`
--
ALTER TABLE `penggajian`
  MODIFY `No_penggajian` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permohonan_peminjaman`
--
ALTER TABLE `permohonan_peminjaman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pph21`
--
ALTER TABLE `pph21`
  MODIFY `no_pph21` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `fk_absensi_karyawan` FOREIGN KEY (`Kd_karyawan`) REFERENCES `karyawan` (`Kd_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_absensi_lokasi` FOREIGN KEY (`lokasi_absen_id`) REFERENCES `lokasi_absen` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_absensi_user` FOREIGN KEY (`Kd_user`) REFERENCES `user` (`Kd_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_karyawan_jabatan` FOREIGN KEY (`Kd_jabatan`) REFERENCES `jabatan` (`Kd_jabatan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_karyawan_ptkp` FOREIGN KEY (`Id_ptkp`) REFERENCES `ptkp` (`Id_ptkp`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lembur`
--
ALTER TABLE `lembur`
  ADD CONSTRAINT `fk_lembur_karyawan` FOREIGN KEY (`Kd_karyawan`) REFERENCES `karyawan` (`Kd_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lembur_user` FOREIGN KEY (`Kd_user`) REFERENCES `user` (`Kd_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_peminjaman_karyawan` FOREIGN KEY (`Kd_karyawan`) REFERENCES `karyawan` (`Kd_karyawan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_peminjaman_user` FOREIGN KEY (`Kd_user`) REFERENCES `user` (`Kd_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `penggajian`
--
ALTER TABLE `penggajian`
  ADD CONSTRAINT `fk_penggajian_karyawan` FOREIGN KEY (`Kd_karyawan`) REFERENCES `karyawan` (`Kd_karyawan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penggajian_user` FOREIGN KEY (`Kd_user`) REFERENCES `user` (`Kd_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `permohonan_peminjaman`
--
ALTER TABLE `permohonan_peminjaman`
  ADD CONSTRAINT `fk_permohonan_karyawan` FOREIGN KEY (`Kd_karyawan`) REFERENCES `karyawan` (`Kd_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_permohonan_user` FOREIGN KEY (`kd_user`) REFERENCES `user` (`Kd_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pph21`
--
ALTER TABLE `pph21`
  ADD CONSTRAINT `fk_pph21_karyawan` FOREIGN KEY (`Kd_karyawan`) REFERENCES `karyawan` (`Kd_karyawan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pph21_user` FOREIGN KEY (`Kd_user`) REFERENCES `user` (`Kd_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_karyawan` FOREIGN KEY (`Kd_karyawan`) REFERENCES `karyawan` (`Kd_karyawan`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
