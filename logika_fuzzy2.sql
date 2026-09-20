
CREATE DATABASE IF NOT EXISTS db_logika_fuzzy_tugas2;
USE db_logika_fuzzy_tugas2;

CREATE TABLE IF NOT EXISTS domain_kategori_usia (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL,
    rentang_usia VARCHAR(30) NOT NULL,
    titik_a_kiri DOUBLE NOT NULL,
    titik_b_puncak1 DOUBLE NOT NULL,
    titik_c_puncak2 DOUBLE NOT NULL,
    titik_d_kanan DOUBLE NOT NULL,
    persamaan_naik VARCHAR(100) NOT NULL,
    persamaan_turun VARCHAR(100) NOT NULL
);

INSERT INTO domain_kategori_usia 
(nama_kategori, rentang_usia, titik_a_kiri, titik_b_puncak1, titik_c_puncak2, titik_d_kanan, persamaan_naik, persamaan_turun) 
VALUES
('Bayi / Balita', '0 - 5 tahun', 0.0, 0.0, 2.0, 5.0, 'mu(x) = 1 (konstan)', 'mu(x) = (5 - x) / 3'),
('Anak-anak', '6 - 11 tahun', 5.0, 7.0, 10.0, 12.0, 'mu(x) = (x - 5) / 2', 'mu(x) = (12 - x) / 2'),
('Remaja', '10 - 19 tahun', 10.0, 13.0, 16.0, 19.0, 'mu(x) = (x - 10) / 3', 'mu(x) = (19 - x) / 3'),
('Pemuda', '15 - 24 tahun', 15.0, 18.0, 21.0, 24.0, 'mu(x) = (x - 15) / 3', 'mu(x) = (24 - x) / 3'),
('Dewasa', '20 - 65 tahun', 20.0, 30.0, 55.0, 65.0, 'mu(x) = (x - 20) / 10', 'mu(x) = (65 - x) / 10'),
('Lansia', '>= 65 tahun', 65.0, 80.0, 80.0, 80.0, 'mu(x) = (x - 65) / 15', 'mu(x) = 1 (konstan)');


-- A. TABEL BAYI
CREATE TABLE IF NOT EXISTS domain_bayi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kondisi_x VARCHAR(50) NOT NULL,
    rumus_perhitungan VARCHAR(100) NOT NULL,
    derajat_keanggotaan_mu VARCHAR(20) NOT NULL
);

INSERT INTO domain_bayi (kondisi_x, rumus_perhitungan, derajat_keanggotaan_mu) VALUES
('x < 0 atau x > 5', 'Di luar interval', '0'),
('0 <= x <= 2', 'mu(x) = 1', '1 (Puncak)'),
('2 < x <= 5', 'mu(x) = (5 - x) / 3', 'Sisi Turun');


-- B. TABEL ANAK-ANAK
CREATE TABLE IF NOT EXISTS domain_anak (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kondisi_x VARCHAR(50) NOT NULL,
    rumus_perhitungan VARCHAR(100) NOT NULL,
    derajat_keanggotaan_mu VARCHAR(20) NOT NULL
);

INSERT INTO domain_anak (kondisi_x, rumus_perhitungan, derajat_keanggotaan_mu) VALUES
('x < 5 atau x > 12', 'Di luar interval', '0'),
('5 <= x <= 7', 'mu(x) = (x - 5) / 2', 'Sisi Naik'),
('7 < x <= 10', 'mu(x) = 1', '1 (Puncak)'),
('10 < x <= 12', 'mu(x) = (12 - x) / 2', 'Sisi Turun');


-- C. TABEL REMAJA
CREATE TABLE IF NOT EXISTS domain_remaja (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kondisi_x VARCHAR(50) NOT NULL,
    rumus_perhitungan VARCHAR(100) NOT NULL,
    derajat_keanggotaan_mu VARCHAR(20) NOT NULL
);

INSERT INTO domain_remaja (kondisi_x, rumus_perhitungan, derajat_keanggotaan_mu) VALUES
('x < 10 atau x > 19', 'Di luar interval', '0'),
('10 <= x <= 13', 'mu(x) = (x - 10) / 3', 'Sisi Naik'),
('13 < x <= 16', 'mu(x) = 1', '1 (Puncak)'),
('16 < x <= 19', 'mu(x) = (19 - x) / 3', 'Sisi Turun');


-- D. TABEL PEMUDA
CREATE TABLE IF NOT EXISTS domain_pemuda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kondisi_x VARCHAR(50) NOT NULL,
    rumus_perhitungan VARCHAR(100) NOT NULL,
    derajat_keanggotaan_mu VARCHAR(20) NOT NULL
);

INSERT INTO domain_pemuda (kondisi_x, rumus_perhitungan, derajat_keanggotaan_mu) VALUES
('x < 15 atau x > 24', 'Di luar interval', '0'),
('15 <= x <= 18', 'mu(x) = (x - 15) / 3', 'Sisi Naik'),
('18 < x <= 21', 'mu(x) = 1', '1 (Puncak)'),
('21 < x <= 24', 'mu(x) = (24 - x) / 3', 'Sisi Turun');


-- E. TABEL DEWASA
CREATE TABLE IF NOT EXISTS domain_dewasa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kondisi_x VARCHAR(50) NOT NULL,
    rumus_perhitungan VARCHAR(100) NOT NULL,
    derajat_keanggotaan_mu VARCHAR(20) NOT NULL
);

INSERT INTO domain_dewasa (kondisi_x, rumus_perhitungan, derajat_keanggotaan_mu) VALUES
('x < 20 atau x > 65', 'Di luar interval', '0'),
('20 <= x <= 30', 'mu(x) = (x - 20) / 10', 'Sisi Naik'),
('30 < x <= 55', 'mu(x) = 1', '1 (Puncak)'),
('55 < x <= 65', 'mu(x) = (65 - x) / 10', 'Sisi Turun');


-- F. TABEL LANSIA
CREATE TABLE IF NOT EXISTS domain_lansia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kondisi_x VARCHAR(50) NOT NULL,
    rumus_perhitungan VARCHAR(100) NOT NULL,
    derajat_keanggotaan_mu VARCHAR(20) NOT NULL
);

INSERT INTO domain_lansia (kondisi_x, rumus_perhitungan, derajat_keanggotaan_mu) VALUES
('x < 65', 'Di luar interval', '0'),
('65 <= x <= 80', 'mu(x) = (x - 65) / 15', 'Sisi Naik'),
('x > 80', 'mu(x) = 1', '1 (Puncak)');