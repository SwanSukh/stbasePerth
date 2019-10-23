ALTER TABLE `complaint` ADD `cmltypeID` INT(25) NOT NULL DEFAULT '0' COMMENT 'Comment Line Type' AFTER `address`; 
ALTER TABLE `complaint` ADD `intvID` INT(25) NOT NULL DEFAULT '0' COMMENT 'Interviewed By' AFTER `disciplineID`; 
ALTER TABLE `complaint` ADD `intvDate` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'Interviewed Date' AFTER `intvID`; 

ALTER TABLE `inspc` ADD `intvID` INT(25) NOT NULL DEFAULT '0' COMMENT 'Interviewed By' AFTER `disciplineID`; 
ALTER TABLE `inspc` ADD `intvDate` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'Interviewed Date' AFTER `intvID`; 

ALTER TABLE `infrgs` ADD `intvID` INT(25) NOT NULL DEFAULT '0' COMMENT 'Interviewed By' AFTER `disciplineID`; 
ALTER TABLE `infrgs` ADD `intvDate` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'Interviewed Date' AFTER `intvID`; 

ALTER TABLE `accident_regis` ADD `damagetobusID` SMALLINT NOT NULL DEFAULT '0' COMMENT 'Damage to Bus' AFTER `responsibleID`; 
ALTER TABLE `accident_regis` ADD `intvID` INT(25) NOT NULL DEFAULT '0' COMMENT 'Interviewed By' AFTER `disciplineID`; 
ALTER TABLE `accident_regis` ADD `intvDate` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'Interviewed Date' AFTER `intvID`; 
ALTER TABLE `accident_regis` ADD `admindoneID` TINYINT NOT NULL DEFAULT '0' COMMENT 'Admin Complete' AFTER `engdoneID`; 
ALTER TABLE `accident_regis` ADD `witnessID` TINYINT NOT NULL DEFAULT '0' AFTER `invno`; 
ALTER TABLE `accident_regis` ADD `witnessDesc` TEXT NOT NULL COMMENT 'Witness Details' AFTER `witnessID`;
ALTER TABLE `accident_regis` CHANGE `witnessID` `witnessID` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Accident for Witness - Status';  

ALTER TABLE `incident_regis` ADD `intvID` INT(25) NOT NULL DEFAULT '0' COMMENT 'Interviewed By' AFTER `disciplineID`; 
ALTER TABLE `incident_regis` ADD `intvDate` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'Interviewed Date' AFTER `intvID`; 
ALTER TABLE `incident_regis` CHANGE `intvID` `invID` INT(25) NOT NULL DEFAULT '0' COMMENT 'Investigated By'; 
ALTER TABLE `incident_regis` CHANGE `intvDate` `invDate` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'Investigated Date'; 
ALTER TABLE `incident_regis` ADD `intvDate` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'Interviewed Date' AFTER `intvID`; 
ALTER TABLE `incident_regis` CHANGE `actbyID` `actbyID` INT(25) NOT NULL DEFAULT '0' COMMENT 'Interviewed By';
ALTER TABLE `incident_regis` ADD `actbyDate` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'Interviewed Date' AFTER `actbyID`; 






