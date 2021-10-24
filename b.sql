DROP DATABASE IF EXISTS HOSPITAL1;
CREATE SCHEMA HOSPITAL1;
USE HOSPITAL1;

DROP TABLE IF EXISTS `Room`;
CREATE TABLE `Room` (
`Cost per day` INT NOT NULL,
`Status` BOOLEAN NOT NULL,
`No.of days stayed` INT NOT NULL,
`Room No` INT NOT NULL,
`Floor No` INT NOT NULL,
PRIMARY KEY(`Room No`,`Floor No`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
 LOCK TABLES `Room` WRITE;
 INSERT INTO `Room` VALUES(2000,1,6,2,1),(3000,1,4,1,2),(2000,0,0,1,1),(3000,0,0,2,2);
 UNLOCK TABLES;


DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department`
(
  `Department Id` INT AUTO_INCREMENT,
  `Department Name` VARCHAR(50) ,
  PRIMARY KEY(`Department Id`,`Department Name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

 LOCK TABLES `Department` WRITE;
 INSERT INTO `Department` VALUES(1,'Cardiology'),(2,'General'),(3,'Emergengy Care');
 UNLOCK TABLES;

DROP TABLE IF EXISTS `Staff`;
CREATE TABLE `Staff`(
  `Staff Id` int,
  `Dept_Id` int, 
  `Date`  int NOT NULL,
  `Month` int NOT NULL,
  `Year`  int NOT NULL,
  `Salary` int NOT NULL,
  `H.no`  varchar(20) NOT NULL,
  `Pin_Code` int NOT NULL,
  `Street.no` int,
  `City`  varchar(50) NOT NULL,
  `State`  varchar(50) NOT NULL,
  `Gender` varchar(2) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50),
  `Last_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Staff Id`),
  CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`Dept_Id`) REFERENCES `Department` (`Department Id`) 
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

LOCK TABLES `Staff` WRITE;
 INSERT INTO `Staff` VALUES(1,1,2,10,2002,100000,'1/2-1',500016,38,'Hyderabad','Telangana','F','Astha', NULL, 'Gill'),
 (2,2,2,10,2002,300000,'1/2-1',500016,39,'Hyderabad','Telangana','M','Warner', NULL, 'David'),
 (3,3,4,12,2003,250000,'1/2-5',500018,60,'Hyderabad','Andhra','F','Samantha', 'Ruthprabhu', 'Akkineni'),
 (4,1,14,2,2001,200000,'1/21-56',500018,44,'Jaipur','Rajasthan','F','Ameya', NULL, 'Sharma'),
 (5,2,17,4,2003,200000,'3/2-51',500028,43,'Vizag','Andhra','M','Vithesh', 'Reddy', 'Adala'),
 (6,3,28,2,1999,15000,'1/2',500018,40,'Mumbai','Maharashtra','F','Shreeya', NULL, 'Gupta'),
 (7,3,20,8,1990,18000,'1/4-81B',500088,49,'Kolkata','West bengal','M','Praneeth', 'Varma', 'smith');
 UNLOCK TABLES;

DROP TABLE IF EXISTS `Doctor`;
CREATE TABLE `Doctor`
(
  `Fees` INT NOT NULL,
  `Starting Hour` varchar(6) NOT NULL,
  `Ending Hour` varchar(6) NOT NULL,
  `Staff Id` INT,
  PRIMARY KEY(`Staff Id`),
  CONSTRAINT `Doctor_1` FOREIGN KEY (`Staff Id`) REFERENCES `Staff` (`Staff Id`) 
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

LOCK TABLES `Doctor` WRITE;
INSERT INTO `Doctor` VALUES(1000,'11:00','15:00',1),(2000,'09:00','12:00',2),(3000,'10:00','14:00',3);
 UNLOCK TABLES;


DROP TABLE IF EXISTS `Nurse 1`;
CREATE TABLE `Nurse 1`
(
  `Staff Id` INT , 
  `Nurse Id` INT ,
  PRIMARY KEY(`Staff Id`),
  CONSTRAINT `Nurse 1_1` FOREIGN KEY (`Staff Id`) REFERENCES `Staff` (`Staff Id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

LOCK TABLES `Nurse 1` WRITE;
INSERT INTO `Nurse 1` VALUES(4,4),(5,5),(6,7),(7,7);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Nurse 2`;
CREATE TABLE `Nurse 2`
(
  `Nurse Id` INT, 
  `No. of days per month` INT NOT NULL,
  PRIMARY KEY(`Nurse Id`),
  CONSTRAINT `Nurse 2_1` FOREIGN KEY (`Nurse Id`) REFERENCES `Nurse 1` (`Staff Id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

 LOCK TABLES `Nurse 2` WRITE;
 INSERT INTO `Nurse 2` VALUES (4,27),(5,28),(6,20),(7,24);
 UNLOCK TABLES;

DROP TABLE IF EXISTS `Billing`;
CREATE TABLE `Billing`
(
  `Bill number` int AUTO_INCREMENT NOT NULL,
  `Patient Id` int NOT NULL,
  `Room Cost` int NOT NULL,
  `Doctor Cost` int NOT NULL,
  `Date of Bill` varchar(11) NOT NULL,
  PRIMARY KEY (`Bill number`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
LOCK TABLES `Billing` WRITE;
INSERT INTO  `Billing` VALUES (1,1,1500,1500,'24/10/2021'),(2,2,3000,1000,'22/10/2021'),(3,3,3000,2000,'24/10/2021'),(4,4,3000,500,'25/10/2021');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Patient Info`;
CREATE TABLE `Patient Info`(
  `Patient Id` int,
  `Date` int NOT NULL,
  `Month` int NOT NULL,
  `Year` int NOT NULL,
  `Gender` varchar(2) NOT NULL,
  `Height` int NOT NULL,
  `Weight` int NOT NULL,
  PRIMARY KEY (`Patient Id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
LOCK TABLES `Patient Info` WRITE;
INSERT INTO `Patient Info` VALUES (1,22,10,2003,'F',180,54),(2,1,1,2001,'F',175,55),(3,2,2,2002,'F',175,56),(4,4,4,2004,'F',176,30);
UNLOCK TABLES;


DROP TABLE IF EXISTS `Inpatient`;
CREATE TABLE `Inpatient`
(
`Patient Id` INT NOT NULL,
`First name` VARCHAR(50) NOT NULL,
`Middle name` VARCHAR(50),
`Last name` VARCHAR(50) NOT NULL,
`H.no` varchar(20),
`Pin_code` INT NOT NULL,
`Street no.` INT,
`City` VARCHAR(50) NOT NULL,
`State` varchar(50) NOT NULL,
`Date of admission` varchar(11) NOT NULL,
`Date of discharge` varchar(11) NOT NULL,
PRIMARY KEY (`Patient Id`),
CONSTRAINT `Inpatient_ibfk_2` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Info` (`Patient Id`)
  ON UPDATE RESTRICT ON DELETE RESTRICT
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

LOCK TABLES `Inpatient` WRITE;
INSERT INTO  `Inpatient` VALUES(1,'Sai','Pranathi','Kokkalla','2-1/1','500018','21','Hyd','Telangana','23/10/2021','26/10/2021'),(2,'Indra','Deepika','Evuri','2-1/5','500018','22','Hyd','Telangana','24/10/2021','27/10/2021');
UNLOCK TABLES;


DROP TABLE IF EXISTS `Outpatient`;
CREATE TABLE `Outpatient`
(
`Patient Id` INT NOT NULL,
`First name` VARCHAR(50) NOT NULL,
`Middle name` VARCHAR(50) NOT NULL,
`Last name` VARCHAR(50) NOT NULL,
`H.no` varchar(20),
`Pin_code` INT NOT NULL,
`Street no.` INT,
`City` VARCHAR(50) NOT NULL,
`State` VARCHAR(50) NOT NULL,
PRIMARY KEY (`Patient Id`),
CONSTRAINT `Outpatient_ibfk_1` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Info` (`Patient Id`)
  ON UPDATE RESTRICT ON DELETE RESTRICT
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

LOCK TABLES `Outpatient` WRITE;
INSERT INTO  `Outpatient` VALUES(3,'Sri','Loukya','Pappula','2-1/10','500020','21','Hyd','Telangana'),(4,'Divya','Varshini','Yakkanti','2-1/50','500050','22','Panaji','Goa');
UNLOCK TABLES;


DROP TABLE IF EXISTS `Hospital Stay`;
CREATE TABLE `Hospital Stay`
(
  `Bill number` INT NOT NULL,
  `Patient Id` INT NOT NULL,
  `Staff Id` INT NOT NULL,
  `Room No` INT NOT NULL,
  `Floor No` INT NOT NULL,
  PRIMARY KEY (`Bill number`, `Patient Id`, `Staff Id`, `Room No`,`Floor No`),
  CONSTRAINT `Hospital_Stay_ibfk_1` FOREIGN KEY (`Bill number`) REFERENCES `Billing` (`Bill number`),
  CONSTRAINT `Hospital_Stay_ibfk_2` FOREIGN KEY (`Patient Id`) REFERENCES `Inpatient`(`Patient Id`),
  CONSTRAINT `Hospital_Stay_ibfk_3` FOREIGN KEY (`Staff Id`) REFERENCES `Staff`(`Staff Id`),
  CONSTRAINT `Hospital_Stay_ibfk_4` FOREIGN KEY (`Room No`,`Floor No`) REFERENCES `Room`(`Room No`,`Floor No`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
LOCK TABLES `Hospital Stay` WRITE;
INSERT INTO `Hospital Stay` VALUES (1,1,2,1,2),(1,1,5,1,2),(2,2,3,2,1),(2,2,6,2,1);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Finance1`;
CREATE TABLE `Finance1`(
  `Bill number` int NOT NULL,
  `Month` int NOT NULL,
  PRIMARY KEY (`Bill number`,`Month`),
  CONSTRAINT `Finance1_ibfk_1` FOREIGN KEY (`Bill number`) REFERENCES `Billing` (`Bill number`)
  ON UPDATE RESTRICT ON DELETE RESTRICT
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
LOCK TABLES `Finance1` WRITE;
INSERT INTO `Finance1` VALUES (1,10),(2,10);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Finance2`;
CREATE TABLE `Finance2`(
  `Expenditure` int NOT NULL,
  `Income` int NOT NULL,
  `Bill number` int NOT NULL,
  PRIMARY KEY (`Bill number`),
  CONSTRAINT `Finance2_ibfk_1` FOREIGN KEY (`Bill number`) REFERENCES `Billing` (`Bill number`) 
  ON UPDATE RESTRICT ON DELETE RESTRICT
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
LOCK TABLES `Finance2` WRITE;
INSERT INTO `Finance2` VALUES (2000,3000,1),(2000,4000,2);
UNLOCK TABLES;


DROP TABLE IF EXISTS `Treatment`;
CREATE TABLE `Treatment`(
  `Bill number` int, 
  `Staff Id` int, 
  `Patient Id` int, 
  PRIMARY KEY (`Bill number`,`Staff Id`,`Patient Id`),
  CONSTRAINT `Treatment_ibfk_1` FOREIGN KEY (`Bill number`) REFERENCES `Billing` (`Bill number`)
  ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `Treatment_ibfk_2` FOREIGN KEY (`Staff Id`) REFERENCES `Staff` (`Staff Id`)
  ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `Treatment_ibfk_3` FOREIGN KEY (`Patient Id`) REFERENCES `Outpatient` (`Patient Id`)
  ON UPDATE RESTRICT ON DELETE RESTRICT
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
LOCK TABLES `Treatment` WRITE;
INSERT INTO `Treatment` VALUES (3,1,3),(3,4,3),(4,2,4),(4,5,4);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Contact_number`;
CREATE TABLE `Contact_number`(
  `Phone number` varchar(11),
  `Patient Id` int,
  PRIMARY KEY (`Phone number`,`Patient Id`),
  CONSTRAINT `Contact_number_ibfk_1` FOREIGN KEY (`Patient Id`) REFERENCES `Outpatient` (`Patient Id`)
  ON UPDATE RESTRICT ON DELETE RESTRICT
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
LOCK TABLES `Contact_number` WRITE;
INSERT INTO `Contact_number` VALUES (9999999910,3),(9999999999,3),(9876543210,4);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Issues`;
CREATE TABLE `Issues`(
  `Issues` varchar(50),
  `Patient Id` int,
  PRIMARY KEY (`Issues`,`Patient Id`),
  CONSTRAINT `Issues_ibfk_1` FOREIGN KEY (`Patient Id`) REFERENCES `Patient Info` (`Patient Id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
LOCK TABLES `Issues` WRITE;
INSERT INTO `Issues` VALUES ('Stomach pain',1),('Heart attack',2),('Body pains',3),('eye checkup',4);
UNLOCK TABLES;

