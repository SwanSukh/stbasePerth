<!-------------------------------------------------- EMPLOYEE VIEW -------------------------------------------------->
CREATE PROCEDURE `Trigger_Data_Employee`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER 
	Select
    employee.ID As `Employee ID`,
    company.title As Depot,
    employee.code As `Employee Code`,
    employee.ddlcdt As `License Expiry Date`,
    employee.ddlcno As `Licence No`,
    employee.dob As `D.O.B.`,
    employee.phone As `Phone No.`,
    employee.kincno As `Kin Contact Number`,
    employee.full_name As `Employee Name`,
    employee.wwcprno As `WWC Permit No`,
    employee.wwcprdt As `WWC Expiry Date`,
    employee.esdate As `Employee Start Date`,
    employee.lardt As `Letter of Authority Date`,
    employee.ftextID As `F/T Extension`,
    master.title As Gender,
    master1.title As Designation,
    If(employee.casualID = 1, 'Full Time', (If(employee.casualID = 2, 'Part Time', (If(employee.casualID = 3, 'Casual',
    ''))))) As `Casual/Full Time/Part Time`,
    employee.drvrightID As `Drive Right No`,
    employee.arkno As `Air Key No`,
    employee.ftsdate As `Permanent Start Date`,
    employee.csdate As `Casual Start Date`,
    employee.kinname As `Name of KIN`,
    employee.rfID As RFID,
    employee.emailID As `Email Address`,
    employee.fname As `First Name`,
    employee.lname As `Last Name`,
    company.address_1 As `AAddress - 1`,
    employee.address_2 As `Address - 2`,
    employee.phone As Telephone,
    employee.phone_1 As `Mobile No`,
    employee.lockerno As `Locker No`,
    employee.pincode As Postcode,
    suburbs.title As Suburb,
    employee.smartcardNO As `Staff ID Card Number`
From
    employee Inner Join
    company On company.ID = employee.companyID Left Join
    master On master.ID = employee.genderID Left Join
    master master1 On master1.ID = employee.desigID Left Join
    suburbs On suburbs.ID = employee.sid
Where
    employee.ID > 0 And
    employee.status = 1
Order By
    `Employee Code` ASC
	
<!-------------------------------------------------- INFRINGMENT VIEW -------------------------------------------------->
CREATE PROCEDURE `Trigger_Data_Infringment`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER 
Select
    infrgs.ID,
    company.title As Depot,
    infrgs.refno As `Infringement No`,
    infrgs.dateID_3 As `Date Recieved`,
    infrgs.dateID_4 As `Date Sent`,
    infrgs.dateID As `Date of Occurence`,
    infrgs.dplostID As `Demerit Points Lost`,
    infrgs.busID As `Bus No.`,
    infrgs.stcodeID As `Employee Code`,
    master.title As `Infringment Type`,
    infrgs.description_1 As `Location of Infringment`,
    infrgs.timeID As Time,
    employee.full_name As `Employee Name`,
    employee1.fname As `Interviewed By`,
    infrgs.dateID_2 As `Compliance Date`,
    infrgs.dateID_1 As `Issue Date`,
    infrgs.vehicle As `Vehicle Rego No`,
    infrgs.description As `If Other Infringement Type`,
    If(infrgs.statusID = 1, 'Yes', (If(infrgs.statusID = 2, 'No', ''))) As Closed
From
    infrgs Inner Join
    company On company.ID = infrgs.companyID Left Join
    employee employee1 On employee1.ID = infrgs.invID Left Join
    employee On employee.ID = infrgs.staffID Left Join
    master On master.ID = infrgs.inftypeID
Order By
    `Infringement No` ASC
	
<!-------------------------------------------------- SICK-LEAVE VIEW -------------------------------------------------->
CREATE PROCEDURE `Trigger_Data_SickLeaves`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER 
Select
    sicklv.ID,
    company.title As Depot,
    sicklv.dateID As `Date ID`,
    sicklv.empID As `Employee Name`,
    sicklv.sldateID As `Commencement Date`,
    sicklv.duration As Duration,
    master.title As `Leave Type`,
    sicklv.reason As Reason,
    sicklv.ecodeID As `Employee Code`,
    sicklv.timeID As Time,
    If(sicklv.doccertID = 1, 'Yes', 'No') As `Doctor Certificate`,
    If(sicklv.typeID = 1, 'Yes', 'No') As `Work Related`
From
    sicklv Inner Join
    company On company.ID = sicklv.companyID Left Join
    master On master.ID = sicklv.lvtypeID
Order By
    `Date ID` ASC
				       
	
<!-------------------------------------------------- ACCIDENTS VIEW -------------------------------------------------->
CREATE PROCEDURE `Trigger_Data_Accidents`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER
Select
    accident_regis.ID,
    company.title As Depot,
    accident_regis.busID As `Bus No`,
    suburbs.title As Suburb,
    accident_regis.description As Description,
    accident_regis.rprcost As `Bus Repair Cost`,
    employee1.full_name As `Interviewed By`,
    accident_regis.outcome As `Investigation Outcome`,
    accident_regis.timeID As `Acident Time`,
    master1.title As `Accident Category`,
    accident_regis.othcost As `Other Related Costs`,
    accident_regis.outcome As Reccomendations,
    accident_regis.dateID As `Accident Date`,
    accident_regis.scodeID As `Driver Code`,
    employee.full_name As `Driver Name`,
    accident_regis.thpnameID As `Third Party Name`,
    accident_regis.regisnoID As `Third Party Rego No`,
    accident_regis.thcontactID As `Third Party Contact Info`,
    accident_regis.insurer As Insurer,
    accident_regis.claimno As `Claim NO`,
    accident_regis.invno As `Invoice NO`,
    accident_regis.location As Location,
    accident_regis.description As Reason,
    If(accident_regis.optID_3 = 1, 'No', (If(accident_regis.optID_3 = 2, 'Swan', (If(accident_regis.optID_3 = 3,
    'Police', (If(accident_regis.optID_3 = 4, 'Both', ''))))))) As `Driver Drug Tested`,
    If(accident_regis.optID_1 = 1, 'Yes', (If(accident_regis.optID_1 = 2, 'No', ''))) As `Photographs of Damage`,
    If(accident_regis.optID_2 = 1, 'No', (If(accident_regis.optID_2 = 2, 'Swan', (If(accident_regis.optID_2 = 3,
    'Police', (If(accident_regis.optID_2 = 4, 'Both', ''))))))) As `Driver Breath Tested`,
    accident_regis.outcome As `Investigation Outcome`,
    If(accident_regis.disciplineID = 1, 'Yes', (If(accident_regis.disciplineID = 2, 'No', ''))) As `Discipline Related`,
    accident_regis.refno As `Reference No`,
    If(accident_regis.tickID_2 = 1, 'Yes', (If(accident_regis.tickID_2 = 2, 'No', ''))) As `Trainee Accident`,
    If(accident_regis.tickID_1 = 1, 'Yes', (If(accident_regis.tickID_1 = 2, 'No', ''))) As `Driver Not Applicable`,
    If(accident_regis.plcntID = 1, 'Yes', (If(accident_regis.plcntID = 2, 'No', ''))) As `Police Notified`,
    If(accident_regis.engdoneID = 1, 'Yes', (If(accident_regis.engdoneID = 2, 'No', ''))) As `Engineering Completed`,
    If(accident_regis.oprdoneID = 1, 'Yes', (If(accident_regis.oprdoneID = 2, 'No', ''))) As `Operations Completed`,
    If(accident_regis.progressID = 1, 'Complete', (If(accident_regis.progressID = 2, 'Pending',
    (If(accident_regis.progressID = 3, 'Written Off', ''))))) As Progress,
    If(accident_regis.responsibleID = 1, 'Yes', (If(accident_regis.responsibleID = 2, 'No',
    ''))) As `Driver Responsible`,
    master.title As `Accident Details`
From
    accident_regis Inner Join
    company On company.ID = accident_regis.companyID Left Join
    suburbs On suburbs.ID = accident_regis.suburb Left Join
    employee On employee.ID = accident_regis.staffID Left Join
    employee employee1 On employee1.ID = accident_regis.invID Left Join
    master On master.ID = accident_regis.accID Left Join
    master master1 On master1.ID = accident_regis.acccatID
Order By
    Depot ASC


<!-------------------------------------------------- COMPLAINTS VIEW -------------------------------------------------->
CREATE PROCEDURE `Trigger_Data_Complaints`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER
Select
    complaint.ID,
    company.title As Depot,
    complaint.location As Location,
    complaint.refno As `Comment Line Ref No`,
    complaint.serDT As `Comment Received On`,
    complaint.dateID As `Incident Date`,
    complaint.timeID As `Incident Time`,
    If(complaint.trisID = 1, 'Yes', '') As `Tris Complete`,
    complaint.busID As `Bus No`,
    complaint.routeID As `Route No`,
    suburbs.title As Suburb,
    complaint.cmp_name As `Customers Name`,
    complaint.mobile As `Telephone No`,
    complaint.cmemailID As `Customer Email ID`,
    complaint.address As Address,
    master.title As `Comment Line Reason`,
    If(complaint.tickID_1 = 1, 'Yes', '') As `Driver Not Applicable`,
    complaint.description As Description,
    complaint.dcodeID As `Driver ID`,
    master1.title As `Comment Line Type`,
    If(complaint.substanID = 1, 'Yes', (If(complaint.substanID = 2, 'No', ''))) As Substantiated,
    If(complaint.substanID = 1, (If(complaint.faultID = 1, 'At Fault - Driver', (If(complaint.faultID = 2,
    'At Fault - Engineering', (If(complaint.faultID = 3, 'At Fault - Operations', (If(complaint.faultID = 4,
    'Not At Fault', '')))))))), (If(complaint.substanID = 2, (If(complaint.faultID = 4, 'Not Applicable',
    (If(complaint.faultID = 5, 'Not At Fault', '')))), ''))) As `Fault/Not at Fault`,
    employee1.full_name As `Interviewed By`,
    complaint.invdate As `Interviewed Date`,
    complaint.furaction As `Customer Response Details`,
    master2.title As `Response Method`,
    complaint.resdate As `Response Date`,
    complaint.outcome As `Action Taken / Recommendations`,
    If(complaint.statusID = 1, 'Yes', (If(complaint.statusID = 2, 'No', ''))) As Closed,
    If(complaint.disciplineID = 1, 'Yes', (If(complaint.disciplineID = 2, 'No', ''))) As `Discipline Required`,
    employee.full_name As `Driver Name`
From
    complaint Inner Join
    company On company.ID = complaint.companyID Left Join
    master On master.ID = complaint.creasonID Left Join
    employee On employee.ID = complaint.driverID Left Join
    suburbs On suburbs.ID = complaint.suburb Left Join
    master master1 On master1.ID = complaint.accID Left Join
    employee employee1 On employee1.ID = complaint.invID Left Join
    master master2 On master2.ID = complaint.respID
Order By
    `Comment Line Ref No` ASC
	
<!-------------------------------------------------- INCIDENTS VIEW -------------------------------------------------->
CREATE PROCEDURE `Trigger_Data_Incidents`() NOT DETERMINISTIC NO SQL SQL SECURITY DEFINER
Select
    incident_regis.ID,
    incident_regis.dateID As `Date Occured`,
    incident_regis.timeID As `Time Occured`,
    incident_regis.shiftID As `Shift No`,
    incident_regis.reportby As `Reported By`,
    employee.full_name As `Driver Name`,
    incident_regis.plrefno As `Police Ref No`,
    incident_regis.description As Description,
    incident_regis.action As Action,
    incident_regis.plrefID As `Police (Notified)`,
    incident_regis.routeID As `Route No`,
    incident_regis.busID As `Bus No`,
    master.title As `Incident Type`,
    company.title As Depot,
    incident_regis.refno As `Ref No`,
    suburbs.title As Suburb,
    incident_regis.dcodeID As `Driver Code`,
    incident_regis.location As Location,
    If(incident_regis.disciplineID = 1, 'Yes', (If(incident_regis.disciplineID = 2, 'No',
    ''))) As `Discipline Required`,
    If(incident_regis.brs_statusID = 1, 'Yes', '') As `Bus/Route/Shift Number(Applicable)`,
    employee1.full_name As `Action Taken By`,
    incident_regis.cmrno As `CRM No`,
    incident_regis.rpdateID As `Report Date`,
    incident_regis.pta_refNO As `PTA Ref No`,
    incident_regis.dmvalue As `Damage Value`,
    master2.title As Weapons,
    incident_regis.crossst As `Cross Street`,
    incident_regis.dmginjury As `Damage/Injury`,
    master1.title As `Offence Type`,
    incident_regis.grfcolour As `Graffiti Colour`,
    master3.title As `Graffiti Item`,
    incident_regis.whbwdescription As `What has been written`,
    incident_regis.depotnotes As `Depot Notes`,
    incident_regis.plcadno As `Police CAD No`,
    If(incident_regis.attendedID_2 = 1, 'Yes', '') As `Police (Attended)`,
    incident_regis.plcvehicle As `Police Vehicle`,
    incident_regis.policename As `Police Name`,
    master4.title As `Police Action`,
    If(incident_regis.inc_statusID = 1, 'Yes', (If(incident_regis.inc_statusID = 2, 'No',
    ''))) As `Incident Status (Complete)`,
    If(incident_regis.notifiedID_1 = 1, 'Yes', '') As `Radio (Notified)`,
    If(incident_regis.attendedID_1 = 1, 'Yes', '') As `Radio (Attended)`,
    If(incident_regis.notifiedID_3 = 1, 'Yes', '') As `Transperth Security (Notified)`,
    If(incident_regis.attendedID_3 = 1, 'Yes', '') As `Transperth Security (Attended)`,
    If(incident_regis.attendedID_8 = 1, 'Yes', '') As `Fire Brigade (Attended)`,
    If(incident_regis.attendedID_9 = 1, 'Yes', '') As `Ambulance (Attended)`,
    If(incident_regis.notifiedID_4 = 1, 'Yes', '') As `Duty Ops(Notified)`,
    If(incident_regis.attendedID_4 = 1, 'Yes', '') As `Duty Ops(Attended)`,
    If(incident_regis.notifiedID_5 = 1, 'Yes', '') As `Depot Manager (Notified)`,
    If(incident_regis.attendedID_5 = 1, 'Yes', '') As `Depot Manager (Attended)`,
    If(incident_regis.attendedID_6 = 1, 'Yes', '') As `PTA (Attended)`,
    If(incident_regis.notifiedID_6 = 1, 'Yes', '') As `PTA (Notified)`,
    If(incident_regis.attendedID_7 = 1, 'Yes', '') As `Westrail (Attended)`,
    If(incident_regis.notifiedID_7 = 1, 'Yes', '') As `Westrail (Notified)`,
    If(incident_regis.notifiedID_8 = 1, 'Yes', '') As `Video Footage Available`,
    If(incident_regis.sincID = 1, 'Security Incident', 'General') As `Security Incident`,
    offence.title As `Offence Details`
From
    incident_regis Inner Join
    company On company.ID = incident_regis.companyID Left Join
    employee On employee.ID = incident_regis.driverID Left Join
    master On master.ID = incident_regis.inctypeID Left Join
    employee employee1 On employee1.ID = incident_regis.actbyID Left Join
    master master1 On master1.ID = incident_regis.offtypeID Left Join
    master master2 On master2.ID = incident_regis.weaponsID Left Join
    suburbs On suburbs.ID = incident_regis.suburb Left Join
    offence On offence.ID = incident_regis.offdtlsID Left Join
    master master3 On master3.ID = incident_regis.grfitemID Left Join
    master master4 On master4.ID = incident_regis.plcactionID
Order By
    `Date Occured` ASC
	
