ALTER TABLE complaint ADD CONSTRAINT `FK_driverID` FOREIGN KEY (`driverID`) REFERENCES `employee` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,

ALTER TABLE `accident_regis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_companyID_idx` (`companyID`),
  ADD KEY `FK_wrtpeID_idx` (`wrtypeID`),
  ADD KEY `FK_accID_idx` (`accID`),
  ADD KEY `FK_acccatID_idx` (`acccatID`);



ALTER TABLE incident_regis ADD KEY `FK_driverID_idx` (`driverID`);
ALTER TABLE incident_regis ADD KEY `FK_actbyID_idx` (`actbyID`);
ALTER TABLE incident_regis ADD KEY `FK_plcactionID_idx` (`plcactionID`);
ALTER TABLE incident_regis ADD KEY `wrtypeID` (`wrtypeID`);


ALTER TABLE infrgs ADD KEY `FK_staffID_idx` (`staffID`);
ALTER TABLE infrgs ADD KEY `FK_invID_idx` (`invID`);
ALTER TABLE infrgs ADD KEY `FK_inftypeID_idx` (`inftypeID`);
ALTER TABLE infrgs ADD KEY `wrtypeID` (`wrtypeID`);
ALTER TABLE infrgs ADD KEY `FK_companyID_idx` (`companyID`);

ALTER TABLE inspc ADD KEY `FK_empID_idx` (`empID`);
ALTER TABLE inspc ADD KEY `FK_insrypeID_idx` (`insrypeID`);
ALTER TABLE inspc ADD KEY `FK_fineID_idx` (`fineID`);
ALTER TABLE inspc ADD KEY `FK_invstID_idx` (`invstID`);
ALTER TABLE inspc ADD KEY `wrtypeID` (`wrtypeID`);
ALTER TABLE inspc ADD KEY `FK_companyID_idx` (`companyID`);

ALTER TABLE mechanic_mst ADD KEY `FK_empID_idx` (`empID`);

ALTER TABLE mng_cmn ADD KEY `FK_staffID_idx` (`staffID`);
ALTER TABLE mng_cmn ADD KEY `FK_invID_idx` (`invID`);
ALTER TABLE mng_cmn ADD KEY `wrtypeID` (`wrtypeID`);
ALTER TABLE mng_cmn ADD KEY `FK_companyID_idx` (`companyID`);

ALTER TABLE employee ADD KEY `FK_sid_idx` (`sid`);
ALTER TABLE complaint ADD KEY `FK_suburb_idx` (`suburb`);
ALTER TABLE incident_regis ADD KEY `FK_suburb_idx` (`suburb`);
ALTER TABLE accident_regis ADD KEY `FK_suburb_idx` (`suburb`);
ALTER TABLE stfare_regis ADD KEY `FK_suburbID_idx` (`suburbID`);


ALTER TABLE inspc ADD KEY `FK_empID_idx` (`empID`);
ALTER TABLE infrgs ADD KEY `FK_lvtypeID_idx` (`lvtypeID`);
ALTER TABLE infrgs ADD KEY `FK_companyID_idx` (`companyID`);


ALTER TABLE api_senders ADD KEY `FK_companyID_idx` (`companyID`);
ALTER TABLE api_senders_logs ADD KEY `FK_companyID_idx` (`companyID`);
ALTER TABLE api_senders_r ADD KEY `FK_companyID_idx` (`companyID`);

ALTER TABLE stops ADD KEY `FK_companyID_idx` (`companyID`);


ALTER TABLE srvdtls_stops ADD KEY `FK_serviceID_idx` (`serviceID`);
ALTER TABLE srvdtls_stops ADD KEY `FK_stopID_idx` (`stopID`);
ALTER TABLE srvdtls_stops ADD KEY `FK_companyID_idx` (`companyID`) 
ALTER TABLE stops ADD KEY `FK_companyID_idx` (`companyID`);

ALTER TABLE api_senders ADD KEY `FK_refID_idx` (`refID`);
ALTER TABLE api_senders_logs ADD KEY `FK_refID_idx` (`refID`);
ALTER TABLE api_senders_r ADD KEY `FK_refID_idx` (`refID`);
