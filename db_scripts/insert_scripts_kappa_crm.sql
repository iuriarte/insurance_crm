INSERT INTO crm.employee VALUES (DEFAULT,'Juanita','Salas','1980-01-23','F','jsalas@kappainsure.com',8325404804,TRUE,1,now(),now());
INSERT INTO crm.employee VALUES (DEFAULT,'Jordan','Ping','1979-04-17','M','jping@kappainsure.com',7138675309,TRUE,2,now(),now());
INSERT INTO crm.employee VALUES (DEFAULT,'Faysal','Cantu','1985-09-04','M','fcantu@kappainsure.com',8325678945,TRUE,3,now(),now());
INSERT INTO crm.employee VALUES (DEFAULT,'Meesha','Patel','1975-05-02','F','mpatel@kappainsure.com',8326693568,TRUE,4,now(),now());
INSERT INTO crm.employee VALUES (DEFAULT,'Emy','Saldana','1985-01-01','F','esaldana@kappainsure.com',8321234567,TRUE,5,now(),now());
INSERT INTO crm.employee VALUES (DEFAULT,'Hector','Saldana','1985-01-01','M','hsaldana@kappainsure.com',8321234568,TRUE,6,now(),now());
INSERT INTO crm.employee VALUES (DEFAULT,'Perla','Agent','1985-01-01','F','psaldana@kappainsure.com',8321234569,TRUE,7,now(),now());
INSERT INTO crm.customer VALUES (DEFAULT,1,'Salah','Doe','1990-04-04','M','Married','Analyst','sdoe@gmail.com',2813308004,'Texas ID','08992103','832 Woodland Trl','Houston','TX',77098,'English',3,FALSE,FALSE,NULL,'',TRUE,1,0,FALSE,'A',now(),1,now());
INSERT INTO crm.customer VALUES (DEFAULT,1,'Nisha','Doe','1991-02-17','F','Married','Professor','ndoe@gmail.com',2813308005,'Texas ID','76382933','832 Woodland Trl','Houston','TX',77098,'English',5,FALSE,FALSE,NULL,'',TRUE,1,0,FALSE,'A',now(),1,now());
INSERT INTO crm.customer VALUES (DEFAULT,2,'Noe','Abarca','1988-05-14','M','Single','Banker','nabarca@gmail.com',2814992004,'Passport','31749003','217 Celestial Dr','Houston','TX',77006,'Spanish',5,TRUE,TRUE,6,'Liberty Mutual',FALSE,0,0,FALSE,'A',now(),2,now());
INSERT INTO crm.customer VALUES (DEFAULT,3,'Trisha','Tremblay','1970-01-26','F','Married','CFO','ttremblay@gmail.com',8324457889,'Texas ID','43112806','1711 Old Spanish Trl','Houston','TX',77054,'English',5,TRUE,TRUE,12,'Progressive Auto',FALSE,0,0,FALSE,'A',now(),3,now());
INSERT INTO crm.customer VALUES (DEFAULT,3,'Rishi','Tremblay','1970-07-25','M','Married','Unemployed','rtremblay@gmail.com',8325679856,'Texas ID','42568976','1712 Old Spanish Trl','Houston','TX',77054,'English',5,TRUE,TRUE,12,'Progressive Auto',FALSE,0,2,FALSE,'A',now(),3,now());
INSERT INTO crm.customer VALUES (DEFAULT,3,'Tyler','Tremblay','1993-08-17','M','Single','Student','tytremblay@gmail.com',8325678523,'Texas ID','48795643','1713 Old Spanish Trl','Houston','TX',77054,'English',4,FALSE,TRUE,12,'Progressive Auto',TRUE,1,0,TRUE,'A',now(),3,now());
INSERT INTO crm.customer VALUES (DEFAULT,3,'Emily','Tremblay','1995-02-14','F','Single','Student','etremblay@gmail.com',8325789635,'Texas ID','49154864','1714 Old Spanish Trl','Houston','TX',77054,'English',5,FALSE,TRUE,12,'Progressive Auto',FALSE,0,0,FALSE,'A',now(),3,now());
INSERT INTO crm.customer VALUES (DEFAULT,1,'Lilly','Blandon','1968-11-24','F','Widowed','','',2814567745,'No ID','','1256 Lake St','Sugar Land','TX',77478,'Spanish',5,TRUE,FALSE,NULL,'',FALSE,0,0,FALSE,'P',now(),1,now());
INSERT INTO crm.customer VALUES (DEFAULT,4,'Jonathan','Bohn','1993-09-13','M','Married','Engineer','jbohn@gmail.com',2815623489,'Texas ID','37456982','1456 Cherry Grove','Woodlands','TX',77354,'English',5,FALSE,TRUE,8,'Geico',FALSE,0,0,FALSE,'I',now(),4,now());
INSERT INTO crm.customer VALUES (DEFAULT,4,'Samantha','Bohn','1992-10-13','F','Married','Consutant','sbohn@gmail.com',2812861891,'Texas ID','38794563','1457 Cherry Grove','Woodlands','TX',77354,'English',5,FALSE,TRUE,8,'Geico',FALSE,0,0,FALSE,'I',now(),4,now());
INSERT INTO crm.company VALUES (DEFAULT,'dealership','','Russell & Smith Mazda',7138934878,NULL,'3340 S Loop W','Houston','TX',77025);
INSERT INTO crm.company VALUES (DEFAULT,'carrier','geico.com/policy','Geico',8008412964,NULL,'1403 Spring Cypress Road, Suite 104','Spring','TX',77373);
INSERT INTO crm.company VALUES (DEFAULT,'lienholder','','Houston Federal Credit Union',8666874328,NULL,'16320 Kensington Drive','Sugar Land','TX',77479);
INSERT INTO crm.company VALUES (DEFAULT,'dealership','','Momentum Volkswagen of Upper Kirby',8448945462,NULL,'2405 Richmond Ave','Houston','TX',77098);
INSERT INTO crm.company (type, name) VALUES ('carrier','Progressive');
INSERT INTO crm.company (type, name) VALUES ('carrier','Infinity');
INSERT INTO crm.company (type, name) VALUES ('carrier','Empower');
INSERT INTO crm.company (type, name) VALUES ('carrier','Foremost');
INSERT INTO crm.company (type, name) VALUES ('carrier','Mercury');
INSERT INTO crm.company (type, name) VALUES ('carrier','Hallmark');
INSERT INTO crm.policy VALUES (DEFAULT,1,2,'auto','23906',185,'04290',now(),'2018-04-07','2018-03-30',6,'2018-10-01','Autopay',85.00,NULL,now());
INSERT INTO crm.policy VALUES (DEFAULT,2,2,'auto','54390',220.00,'03454',now(),'2018-02-11','2018-02-01',12,'2019-02-01','Autopay',120.00,NULL,now());
INSERT INTO crm.policy VALUES (DEFAULT,3,5,'auto','69874',720.33,'87986',now(),'2018-03-27','2018-03-01',3,'2018-06-01','Renewal',620.33,NULL,now());
INSERT INTO crm.policy VALUES (DEFAULT,1,5,'auto','89425',150,'',now(),NULL,NULL,NULL,NULL,'Quote',NULL,NULL,now());
INSERT INTO crm.policy VALUES (DEFAULT,4,2,'auto','98756',280,'69856',now(),'2018-01-01','2018-01-01',6,'2018-07-01','Cancelled',180,'2018-03-01',now());
INSERT INTO crm.policy_payment VALUES (DEFAULT,1,1,'2018-04-01','P',now(),now(),1);
INSERT INTO crm.policy_payment VALUES (DEFAULT,1,2,'2018-05-01','U',now(),now(),1);
INSERT INTO crm.policy_payment VALUES (DEFAULT,1,3,'2018-06-01','U',now(),now(),1);
INSERT INTO crm.policy_payment VALUES (DEFAULT,1,4,'2018-07-01','U',now(),now(),1);
INSERT INTO crm.policy_payment VALUES (DEFAULT,1,5,'2018-08-01','U',now(),now(),1);
INSERT INTO crm.policy_payment VALUES (DEFAULT,1,6,'2018-09-01','U',now(),now(),1);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,1,'2018-02-01','P',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,2,'2018-03-01','P',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,3,'2018-04-01','P',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,4,'2018-05-01','P',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,5,'2018-06-01','U',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,6,'2018-07-01','U',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,7,'2018-08-01','U',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,8,'2018-09-01','U',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,9,'2018-10-01','U',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,10,'2018-11-01','U',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,11,'2018-12-01','U',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,2,12,'2019-01-01','U',now(),now(),2);
INSERT INTO crm.policy_payment VALUES (DEFAULT,3,1,'2018-03-01','P',now(),now(),3);
INSERT INTO crm.policy_payment VALUES (DEFAULT,3,2,'2018-04-01','P',now(),now(),3);
INSERT INTO crm.policy_payment VALUES (DEFAULT,3,3,'2018-05-01','P',now(),now(),3);
INSERT INTO crm.policy_payment VALUES (DEFAULT,5,1,'2018-01-01','P',now(),now(),4);
INSERT INTO crm.policy_payment VALUES (DEFAULT,5,2,'2018-02-01','P',now(),now(),4);
INSERT INTO crm.policy_payment VALUES (DEFAULT,5,3,'2018-03-01','P',now(),now(),4);
INSERT INTO crm.policy_payment VALUES (DEFAULT,5,4,'2018-04-01','C',now(),now(),4);
INSERT INTO crm.policy_payment VALUES (DEFAULT,5,5,'2018-05-01','C',now(),now(),4);
INSERT INTO crm.policy_payment VALUES (DEFAULT,5,6,'2018-06-01','C',now(),now(),4);
INSERT INTO crm.policy_customer VALUES (DEFAULT,1,1,TRUE,'',1,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,1,2,FALSE,'Mother',1,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,2,3,TRUE,'',1,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,3,4,TRUE,'',1,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,3,5,FALSE,'Husband',1,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,3,6,FALSE,'Son',1,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,3,7,FALSE,'Daughter',1,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,4,8,TRUE,'',null,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,5,9,TRUE,'',0,now(),now());
INSERT INTO crm.policy_customer VALUES (DEFAULT,5,10,FALSE,'Wife',0,now(),now());
INSERT INTO crm.car VALUES (DEFAULT,3,1,'12345678901234567','Mazda','Mazda3',2010,now(),now());
INSERT INTO crm.car VALUES (DEFAULT,null,null,'23456789012345600','Chevy','Equinox',2017,now(),now());
INSERT INTO crm.car VALUES (DEFAULT,null,4,'34567890123456789','Volkswagen','Golf',2014,now(),now());
INSERT INTO crm.car VALUES (DEFAULT,null,4,'45678901234567890','Volkswagen','Beetle',2015,now(),now());
INSERT INTO crm.car VALUES (DEFAULT,3,null,'34567890123456789','Ford','F-150',2008,now(),now());
INSERT INTO crm.car VALUES (DEFAULT,null,1,'45678978945612307','Mazda','CX-6',2016,now(),now());
INSERT INTO crm.coverage VALUES (DEFAULT,1,1,'Liability',null,FALSE,FALSE,FALSE,FALSE,1,now(),now());
INSERT INTO crm.coverage VALUES (DEFAULT,2,2,'Full Collision',500,TRUE,TRUE,TRUE,TRUE,1,now(),now());
INSERT INTO crm.coverage VALUES (DEFAULT,3,3,'Full Comprehensive',300,TRUE,TRUE,FALSE,FALSE,1,now(),now());
INSERT INTO crm.coverage VALUES (DEFAULT,3,4,'Full Comprehensive',300,TRUE,TRUE,TRUE,TRUE,1,now(),now());
INSERT INTO crm.coverage VALUES (DEFAULT,4,5,'Liability',null,FALSE,FALSE,FALSE,FALSE,NULL,now(),now());
INSERT INTO crm.coverage VALUES (DEFAULT,5,6,'Full Collision',600,FALSE,FALSE,TRUE,TRUE,0,now(),now());
INSERT INTO crm.contact_info VALUES (DEFAULT, 1,'Mobile Phone','8322813003',now(),now());
INSERT INTO crm.contact_info VALUES (DEFAULT, 2,'Work Phone','7138324005',now(),now());
INSERT INTO crm.contact_info VALUES (DEFAULT, 3,'Home Phone','7132568978',now(),now());
INSERT INTO crm.contact_info VALUES (DEFAULT, 3,'Work Phone','2815462457',now(),now());
INSERT INTO crm.contact_info VALUES (DEFAULT, 4,'PO BOX','124587',now(),now());
INSERT INTO crm.contact_info VALUES (DEFAULT, 9,'Work Address','117 Irving St Woodlands, TX 77354',now(),now());
INSERT INTO crm.payment_info VALUES (DEFAULT,1,'DD','Chase Bank','0000-0000','','',null,now(),TRUE);
INSERT INTO crm.payment_info VALUES (DEFAULT,3,'CC','Capital One Visa','4255654376548760','8760','214','2020-07-01',now(),TRUE);
INSERT INTO crm.payment_info VALUES (DEFAULT,4,'DD','Wells Fargo','1111-1111','','',null,now(),TRUE);
INSERT INTO crm.payment_info VALUES (DEFAULT,9,'DD','IBC Bank','2222-2222','','',null,now(),TRUE);
INSERT INTO crm.note VALUES (DEFAULT,1,now(),'Spoke with Salah. Will follow up on delayed payment.',1,now());
INSERT INTO crm.note VALUES (DEFAULT,3,now(),'Noe is not pronounced like no.',2,now());
INSERT INTO crm.note VALUES (DEFAULT,4,now(),'Trisha wants a requote excluding her son Tyler.',3,now());
INSERT INTO crm.note VALUES (DEFAULT,8,now(),'Hay que revisar sus documentos.',1,now());
INSERT INTO crm.note VALUES (DEFAULT,9,now(),'Goes by Jon. May be looking to add another car to policy.',4,now());
INSERT INTO crm.rep VALUES (DEFAULT,2,'Jerry','Coker','',7132243426,null,'jcoker@geico.com','');
INSERT INTO crm.rep VALUES (DEFAULT,5,'Shawn','Rackley','General Manager',7135963301,null,'shaun.rackley@momentumvolkswagen.com','Dealership extension x450');
