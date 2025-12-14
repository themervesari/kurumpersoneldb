-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: kurumpersoneldb
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `birimbilgileri`
--

DROP TABLE IF EXISTS birimbilgileri;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE birimbilgileri (
  BirimID int NOT NULL AUTO_INCREMENT,
  KurumID int NOT NULL,
  UstBirimID int DEFAULT NULL,
  BirimAdi varchar(150) COLLATE utf8mb4_turkish_ci NOT NULL,
  OlusturmaZamani datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (BirimID),
  KEY KurumID (KurumID),
  KEY UstBirimID (UstBirimID),
  CONSTRAINT birimbilgileri_ibfk_1 FOREIGN KEY (KurumID) REFERENCES kurumbilgileri (KurumID),
  CONSTRAINT birimbilgileri_ibfk_2 FOREIGN KEY (UstBirimID) REFERENCES birimbilgileri (BirimID)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birimbilgileri`
--

LOCK TABLES birimbilgileri WRITE;
/*!40000 ALTER TABLE birimbilgileri DISABLE KEYS */;
INSERT INTO birimbilgileri VALUES (1,1,NULL,'Rektörlük','2025-12-10 22:33:28'),(2,1,1,'Mühendislik, Mimarlık ve Tasarım Fakültesi','2025-12-10 22:33:28'),(3,1,2,'Bilgisayar Mühendisliği','2025-12-10 22:33:28'),(4,1,NULL,'Rektörlük','2025-12-10 22:44:50'),(5,1,4,'Mühendislik, Mimarlık ve Tasarım Fakültesi','2025-12-10 22:44:50'),(6,1,5,'Bilgisayar Mühendisliği','2025-12-10 22:44:50'),(7,4,NULL,'Destek Hizmetleri Başkanlığı','2025-12-14 16:25:49'),(8,4,4,'Destek Hizmetleri Başkanlığı','2025-12-14 16:26:09'),(9,4,8,'Destek Hizmetleri Başkan Yardımcılığı','2025-12-14 16:26:41'),(10,4,9,'Destek Hizmetlerli Birimi','2025-12-14 16:38:26'),(11,5,NULL,'Rektörlük','2025-12-14 17:16:56'),(12,5,1,'Bilgi İşlem Daire Bşk.','2025-12-14 17:16:56');
/*!40000 ALTER TABLE birimbilgileri ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egitimbilgileri`
--

DROP TABLE IF EXISTS egitimbilgileri;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE egitimbilgileri (
  EgitimID int NOT NULL AUTO_INCREMENT,
  PersonelID int NOT NULL,
  TahsilTuru enum('Lise','Ön Lisans','Lisans','Yüksek Lisans','Doktora') COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  LiseAdi varchar(200) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  UniversiteAdi varchar(200) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  FakulteAdi varchar(150) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  BolumAdi varchar(150) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  DiplomaNo varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  MezuniyetTarihi date DEFAULT NULL,
  OlusturmaZamani timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (EgitimID),
  KEY PersonelID (PersonelID),
  CONSTRAINT egitimbilgileri_ibfk_1 FOREIGN KEY (PersonelID) REFERENCES personelbilgileri (PersonelID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egitimbilgileri`
--

LOCK TABLES egitimbilgileri WRITE;
/*!40000 ALTER TABLE egitimbilgileri DISABLE KEYS */;
INSERT INTO egitimbilgileri VALUES (1,8,'Lisans',NULL,'Selçuk Üniversitesi','Mühendislik Fak.','Bilgisayar Müh.','DIP-12345','2019-06-20','2025-12-14 13:41:06');
/*!40000 ALTER TABLE egitimbilgileri ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gorevtanimlari`
--

DROP TABLE IF EXISTS gorevtanimlari;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE gorevtanimlari (
  GorevTanimID int NOT NULL AUTO_INCREMENT,
  GorevAdi varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  GorevKodu varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  Aciklama varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  OlusturmaZamani datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (GorevTanimID)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gorevtanimlari`
--

LOCK TABLES gorevtanimlari WRITE;
/*!40000 ALTER TABLE gorevtanimlari DISABLE KEYS */;
INSERT INTO gorevtanimlari VALUES (1,'Bölüm Başkanı','YNT-001',NULL,'2025-12-10 22:33:28'),(2,'Araştırma Görevlisi','AKD-002',NULL,'2025-12-10 22:33:28'),(3,'Fakülte Sekreteri','IDR-001',NULL,'2025-12-10 22:33:28'),(4,'Bölüm Başkanı','YNT-001',NULL,'2025-12-10 22:44:50'),(5,'Araştırma Görevlisi','AKD-002',NULL,'2025-12-10 22:44:50'),(6,'Fakülte Sekreteri','IDR-001',NULL,'2025-12-10 22:44:50'),(7,'Destek Hizmetleri Birim Sorumlusu','DH-001',NULL,'2025-12-14 16:45:23'),(8,'Test Mühendisi','TST-ENG-001','Sistemi test eden personel','2025-12-14 17:16:56');
/*!40000 ALTER TABLE gorevtanimlari ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS kullanici;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE kullanici (
  KullaniciID int NOT NULL AUTO_INCREMENT,
  PersonelID int DEFAULT NULL,
  KullaniciAdi varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  SifreHash varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  Aktif tinyint(1) DEFAULT '1',
  OlusturmaZamani datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (KullaniciID),
  UNIQUE KEY KullaniciAdi (KullaniciAdi),
  KEY PersonelID (PersonelID),
  CONSTRAINT kullanici_ibfk_1 FOREIGN KEY (PersonelID) REFERENCES personelbilgileri (PersonelID)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici`
--

LOCK TABLES kullanici WRITE;
/*!40000 ALTER TABLE kullanici DISABLE KEYS */;
INSERT INTO kullanici VALUES (1,8,'merve.sari','123456',1,'2025-12-14 17:29:39');
/*!40000 ALTER TABLE kullanici ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanicirolleri`
--

DROP TABLE IF EXISTS kullanicirolleri;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE kullanicirolleri (
  KullaniciRolID int NOT NULL AUTO_INCREMENT,
  KullaniciID int NOT NULL,
  RolID int NOT NULL,
  VerilisTarihi datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (KullaniciRolID),
  KEY KullaniciID (KullaniciID),
  KEY RolID (RolID),
  CONSTRAINT kullanicirolleri_ibfk_1 FOREIGN KEY (KullaniciID) REFERENCES kullanici (KullaniciID),
  CONSTRAINT kullanicirolleri_ibfk_2 FOREIGN KEY (RolID) REFERENCES rol (RolID)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicirolleri`
--

LOCK TABLES kullanicirolleri WRITE;
/*!40000 ALTER TABLE kullanicirolleri DISABLE KEYS */;
INSERT INTO kullanicirolleri VALUES (1,1,1,'2025-12-14 17:29:39');
/*!40000 ALTER TABLE kullanicirolleri ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurumbilgileri`
--

DROP TABLE IF EXISTS kurumbilgileri;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE kurumbilgileri (
  KurumID int NOT NULL AUTO_INCREMENT,
  KurumAdi varchar(150) COLLATE utf8mb4_turkish_ci NOT NULL,
  Adres varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  Telefon varchar(15) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  EPosta varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  KepAdresi varchar(100) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  OlusturmaZamani datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (KurumID)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurumbilgileri`
--

LOCK TABLES kurumbilgileri WRITE;
/*!40000 ALTER TABLE kurumbilgileri DISABLE KEYS */;
INSERT INTO kurumbilgileri VALUES (1,'Bartın Üniversitesi','Bartın Merkez','03782230000',NULL,NULL,'2025-12-10 22:33:28'),(4,'Bartın İl Sağlık Müdürlüğü','Kırtepe Mah.','0378 228 36 55','bartin@saglik.gov.tr','bartin.saglikmud@hs01.kep.tr','2025-12-14 16:20:26'),(5,'Test Üniversitesi','Kampüs','03782223344','info@test.edu.tr','kep@test.kep.tr','2025-12-14 17:16:56');
/*!40000 ALTER TABLE kurumbilgileri ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personelbilgileri`
--

DROP TABLE IF EXISTS personelbilgileri;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE personelbilgileri (
  PersonelID int NOT NULL AUTO_INCREMENT,
  TCKimlikNo char(11) COLLATE utf8mb4_turkish_ci NOT NULL,
  SicilNumarasi varchar(45) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  Ad varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  Soyad varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  DogumTarihi date DEFAULT NULL,
  Unvan varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  Brans varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  IseGirisTarihi date DEFAULT NULL,
  PersonelDurumu enum('Aktif','Pasif','Izinli','Emekli') COLLATE utf8mb4_turkish_ci DEFAULT 'Aktif',
  Adres varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  Telefon varchar(15) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  EPosta varchar(100) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  IstihdamSekli varchar(150) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  OlusturmaZamani datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (PersonelID),
  UNIQUE KEY TCKimlikNo (TCKimlikNo),
  UNIQUE KEY SicilNumarasi (SicilNumarasi)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personelbilgileri`
--

LOCK TABLES personelbilgileri WRITE;
/*!40000 ALTER TABLE personelbilgileri DISABLE KEYS */;
INSERT INTO personelbilgileri VALUES (3,'22222222222',NULL,'Ayşe','Demir',NULL,NULL,NULL,'2020-01-15','Aktif',NULL,NULL,NULL,NULL,'2025-12-10 22:35:13'),(8,'31733397488','SCL-2025-001','Merve','SARI','1997-05-26','Mühendis','Bilgisayar','2025-12-14','Aktif','Gölbucağı Mah. No:9 Bartın','05434242747','mervesari0597@mail.com','Sözleşmeli','2025-12-14 16:39:39'),(10,'11111111111','SICIL-001','Davut','Işık','1995-01-01','Mühendis','Yazılım','2025-12-14','Aktif','Merkez/Bartın','05550001122','davut@test.com','Kadrolu','2025-12-14 17:19:12'),(26,'33333333333','scl-003','Melike','SARI','2001-05-26','Uzman','Uzman','2025-12-14','Aktif','bartın','05433279395','melike.sari@saglik.gov.tr','Kadrolu','2025-12-14 20:29:57');
/*!40000 ALTER TABLE personelbilgileri ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personelgorevhareketleri`
--

DROP TABLE IF EXISTS personelgorevhareketleri;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE personelgorevhareketleri (
  HareketID int NOT NULL AUTO_INCREMENT,
  PersonelID int NOT NULL,
  BirimID int NOT NULL,
  GorevTanimID int NOT NULL,
  BaslangicTarihi date NOT NULL,
  BitisTarihi date DEFAULT NULL,
  AktifGorevMi tinyint(1) DEFAULT '1',
  OlusturmaZamani datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (HareketID),
  KEY PersonelID (PersonelID),
  KEY BirimID (BirimID),
  KEY GorevTanimID (GorevTanimID),
  CONSTRAINT personelgorevhareketleri_ibfk_1 FOREIGN KEY (PersonelID) REFERENCES personelbilgileri (PersonelID),
  CONSTRAINT personelgorevhareketleri_ibfk_2 FOREIGN KEY (BirimID) REFERENCES birimbilgileri (BirimID),
  CONSTRAINT personelgorevhareketleri_ibfk_3 FOREIGN KEY (GorevTanimID) REFERENCES gorevtanimlari (GorevTanimID)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personelgorevhareketleri`
--

LOCK TABLES personelgorevhareketleri WRITE;
/*!40000 ALTER TABLE personelgorevhareketleri DISABLE KEYS */;
INSERT INTO personelgorevhareketleri VALUES (2,3,3,1,'2020-01-15',NULL,1,'2025-12-10 22:35:13'),(3,8,10,1,'2025-12-14',NULL,1,'2025-12-14 16:39:39'),(4,10,12,8,'2025-12-14',NULL,1,'2025-12-14 17:19:12'),(8,26,7,1,'2025-12-14',NULL,1,'2025-12-14 20:29:57');
/*!40000 ALTER TABLE personelgorevhareketleri ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS rol;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE rol (
  RolID int NOT NULL AUTO_INCREMENT,
  RolAdi varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  Aciklama varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  PRIMARY KEY (RolID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES rol WRITE;
/*!40000 ALTER TABLE rol DISABLE KEYS */;
INSERT INTO rol VALUES (1,'Admin','Sistem Yöneticisi, her yetkiye sahip.'),(2,'Personel','Standart kullanıcı, sadece kendi verisini görür.');
/*!40000 ALTER TABLE rol ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistemloglari`
--

DROP TABLE IF EXISTS sistemloglari;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE sistemloglari (
  LogID int NOT NULL AUTO_INCREMENT,
  TabloAdi varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  IslemTuru varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  KayitID int DEFAULT NULL,
  Aciklama text COLLATE utf8mb4_turkish_ci,
  IslemYapan varchar(100) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  IslemTarihi datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (LogID)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistemloglari`
--

LOCK TABLES sistemloglari WRITE;
/*!40000 ALTER TABLE sistemloglari DISABLE KEYS */;
INSERT INTO sistemloglari VALUES (1,'KurumBilgileri','EKLEME',5,'Test Üniversitesi eklendi.','root@localhost','2025-12-14 17:16:56'),(2,'BirimBilgileri','EKLEME',11,'Rektörlük birimi eklendi.','root@localhost','2025-12-14 17:16:56'),(3,'BirimBilgileri','EKLEME',12,'Bilgi İşlem Daire Bşk. birimi eklendi.','root@localhost','2025-12-14 17:16:56'),(4,'gorevtanimlari','EKLEME',8,'Test Mühendisi (TST-ENG-001) eklendi.','root@localhost','2025-12-14 17:16:56'),(5,'egitimbilgileri','EKLEME',2,'PersonelID: 1 için Bartın Üniversitesi eklendi.','root@localhost','2025-12-14 17:16:56'),(6,'PersonelBilgileri','GÜNCELLEME',1,'Personel Güncellendi. Soyad: Yılmaztürk -> Öztürk. ','root@localhost','2025-12-14 17:16:56'),(7,'PersonelGorevHareketleri','SİLME',1,'PersonelID: 1 ye ait görev kaydı (ID: 1) silindi.','root@localhost','2025-12-14 17:16:56'),(8,'egitimbilgileri','SİLME',2,'PersonelID: 1 ait eğitim kaydı silindi.','root@localhost','2025-12-14 17:16:56'),(9,'PersonelBilgileri','SİLME',1,'Ali Öztürk silindi.','root@localhost','2025-12-14 17:16:56'),(10,'PersonelBilgileri','EKLEME',10,'Davut Işık eklendi.','root@localhost','2025-12-14 17:19:12'),(11,'PersonelGorevHareketleri','EKLEME',4,'PersonelID: 10 için yeni görev ataması yapıldı. (BirimID: 12, GörevID: 8)','root@localhost','2025-12-14 17:19:12'),(12,'Roller','EKLEME',1,'Yeni Rol: Admin','root@localhost','2025-12-14 17:29:39'),(13,'Roller','EKLEME',2,'Yeni Rol: Personel','root@localhost','2025-12-14 17:29:39'),(14,'Kullanicilar','EKLEME',1,'Kullanıcı: merve.sari (PersonelID: 8)','root@localhost','2025-12-14 17:29:39'),(15,'KullaniciRolleri','YETKİLENDİRME',1,'KullaniciID: 1 -> RolID: 1 yetkisi verildi.','root@localhost','2025-12-14 17:29:39'),(16,'PersonelBilgileri','EKLEME',23,'Melike SARI eklendi.','root@localhost','2025-12-14 19:34:23'),(17,'PersonelGorevHareketleri','EKLEME',5,'PersonelID: 23 için yeni görev ataması yapıldı. (BirimID: 7, GörevID: 2)','root@localhost','2025-12-14 19:34:23'),(18,'PersonelGorevHareketleri','SİLME',5,'PersonelID: 23 ye ait görev kaydı (ID: 5) silindi.','root@localhost','2025-12-14 19:34:34'),(19,'PersonelBilgileri','SİLME',23,'Melike SARI silindi.','root@localhost','2025-12-14 19:34:34'),(20,'PersonelBilgileri','EKLEME',24,'Melike SARI eklendi.','root@localhost','2025-12-14 19:43:34'),(21,'PersonelGorevHareketleri','EKLEME',6,'PersonelID: 24 için yeni görev ataması yapıldı. (BirimID: 7, GörevID: 1)','root@localhost','2025-12-14 19:43:34'),(22,'PersonelGorevHareketleri','SİLME',6,'PersonelID: 24 ye ait görev kaydı (ID: 6) silindi.','root@localhost','2025-12-14 19:44:56'),(23,'PersonelBilgileri','SİLME',24,'Melike SARI silindi.','root@localhost','2025-12-14 19:44:56'),(24,'PersonelBilgileri','EKLEME',25,'Melike SARI eklendi.','root@localhost','2025-12-14 19:49:31'),(25,'PersonelGorevHareketleri','EKLEME',7,'PersonelID: 25 için yeni görev ataması yapıldı. (BirimID: 7, GörevID: 1)','root@localhost','2025-12-14 19:49:31'),(26,'PersonelGorevHareketleri','SİLME',7,'PersonelID: 25 ye ait görev kaydı (ID: 7) silindi.','root@localhost','2025-12-14 20:29:14'),(27,'PersonelBilgileri','SİLME',25,'Melike SARI silindi.','root@localhost','2025-12-14 20:29:14'),(28,'PersonelBilgileri','EKLEME',26,'Melike SARI eklendi.','root@localhost','2025-12-14 20:29:57'),(29,'PersonelGorevHareketleri','EKLEME',8,'PersonelID: 26 için yeni görev ataması yapıldı. (BirimID: 7, GörevID: 1)','root@localhost','2025-12-14 20:29:57');
/*!40000 ALTER TABLE sistemloglari ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-14 20:46:49
