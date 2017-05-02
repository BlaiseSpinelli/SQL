-- CREATE STATEMENTS-----------------------------

-- people table--
CREATE TABLE people (
   PID			char(5)		not null,
   FirstName	text		not null,
   LastName		text		not null,
   Age 			integer 	not null,
   ZipCode		integer		not null references states(ZipCode),
primary key (PID)
    );


-- states table--
CREATE TABLE states (
	ZipCode 	integer 	not null,
    City		text		not null,
    State		text		not null,
primary key (ZipCode)
    );
    
-- coaches table ---
CREATE TABLE coaches (
    CID 			char(5) 	not null unique references people(PID),
    DateHired 		date		not null,
    DateReleased 	date,
    SalaryUSD 		integer 	not null,
primary key (CID)
);

-- players table ----
CREATE TABLE players (
    PLID 			char(5)		not null unique references people(PID),
    position 		text		not null,
    CombineID		char(5) 	not null unique references nflcombineresults(CombineID),
    UID				char(5) 	not null unique references schools(UID),
primary key (PLID),
foreign key (CombineID) references nflcombineresults(CombineID),
foreign key (UID) references schools(UID)
 );

-- nflcombineresults table----
CREATE TABLE nflcombineresults (
    CombineID				char(5)		not null,
    fortyfirstattempt 		char(5),
    fortysecondattempt		char(5),
    shuttlefirstattempt		char(5),
    shuttlesecondattempt	char(5),
    weightLBs				integer		not null,
    heightIns				integer		not null,
primary key(CombineID)
    );
   
-- schools table ----
CREATE TABLE schools (
    UID 			char(5) 		not null unique,
    name			text			not null unique,
    conference 		text,
    divisionlevel	char(5)			not null,
primary key(UID)
    );
 
-- interviews table---------
CREATE TABLE interviews (
	CID 					char(5)			not null references coaches(CID),
    PLID					char(5)			not null references players(PLID),
    interviewdate			date,
    interviewlettergrade	char(2),
primary key(CID,PLID)
    );
    
-- medicalhistory table---------------------
CREATE TABLE medicalhistory (
    PLID				char(5)				not null references players(PLID),
    patientID			char(5)				references surgeries(patientID),
primary key(PLID,patientID)
    );

-- surgeries table--------------------
CREATE TABLE surgeries (
    patientID			char(5),
    injury 				text,
    surgerydate 		date,
primary key(patientID)
    );
 
-- backgroundcheck table--------------------
CREATE TABLE backgroundcheck (
    PID					char(5) 		not null references people(PID),
    passedcheck 		boolean 		not null,
    criminalID			char(5)			not null references crimecommitted(criminalID),
primary key(PID,criminalID)
    );
    
-- crimecommitted table------------
CREATE TABLE crimecommitted (
    criminalID 			char(5) 		not null,
    offense 			text			not null,
primary key(criminalID)
    );
    
    
  -- Drop Tables----------------------------  
    
DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS states CASCADE;
DROP TABLE IF EXISTS coaches CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS nflcombineresults CASCADE;
DROP TABLE IF EXISTS schools CASCADE;
DROP TABLE IF EXISTS interviews CASCADE;
DROP TABLE IF EXISTS crimecommitted CASCADE;
DROP TABLE IF EXISTS backgroundcheck CASCADE;
DROP TABLE IF EXISTS medicalhistory CASCADE;
DROP TABLE IF EXISTS surgeries CASCADE;

-- People data---------------------------------------------------------------------------------
insert into people 
values ('p1','Todd','Bowles','47','17032');
    
insert into people 
values ('p2','Mike','Caldwell','45','17032');
    
insert into people 
values ('p3','Brant','Boyer','45','17032');    

insert into people 
values ('p4','Alan','Labouseur','41','17032');
    
insert into people 
values ('p5','Kacy','Rodgers','42','17032');
    
insert into people 
values ('p6','Tim','Atkins','48','17032'); 

insert into people 
values ('p7','Jeremy','Bates','44','17032');
    
insert into people 
values ('p8','Ryan','Wilson','20','78701');
    
insert into people 
values ('p9','Dakota','Rogers','21','90001');
    
insert into people 
values ('p10','Jeremiah','Williams','20','60601');
    
insert into people 
values ('p11','Andrew','Reese','22','11798');
    
insert into people 
values ('p12','Tate','Armstrong','21','30301');
    
insert into people 
values ('p13','James','Cot','22','44101');
    
insert into people 
values ('p14','Austin','McDonald','20','33124');
    
insert into people 
values ('p15','Rara','Cucumba','21','15201');
    
insert into people 
values ('p16','Darnell','King','20','37201');
    
insert into people 
values ('p17','Titus','Booker','21','97201');
    
insert into people 
values ('p18','Jamal','Freeman','20','11798');
    
insert into people 
values ('p19','James','Tyler','22','30301');
    
insert into people 
values ('p20','Scott','Thomson','21','60601');
    
insert into people 
values ('p21','Martin','Harris','20','11798');
    
insert into people 
values ('p22','Bryant','Cobb','21','30301');
    
insert into people 
values ('p23','Trey','Sengs','20','44101');
    
insert into people 
values ('p24','Drake','Ovo','22','33124');
    
insert into people 
values ('p25','Owen','Charles','21','15201');
    
insert into people 
values ('p26','Mike','Coyle','22','37201');
    
insert into people 
values ('p27','Rob','Mora','20','97201');
    
insert into people 
values ('p28','Justin','Brackler','21','78701');
    
insert into people 
values ('p29','Derek','Merck','20','90001');
    
insert into people 
values ('p30','Andre','Gomez','20','60601');
    
insert into people 
values ('p31','Nick','Dip','21','11798');
    
insert into people 
values ('p32','YaYa','Sewid','22','30301');
    
insert into people 
values ('p33','Brandon','Bond','20','44101');
    
insert into people 
values ('p34','Brady','Bunch','21','33124');
    
insert into people 
values ('p35','Thomas','Gallo','20','15201');
    
insert into people 
values ('p36','LaQuan','Noil','21','37201');
    
insert into people 
values ('p37','Johnny','Oats','22','97201');

insert into people 
values ('p38','Mark', 'Rajovic','21','97201');


-- States Data-------------------------------------------------------------------------------------
insert into states 
values ('17032','Hoboken','New Jersey');
insert into states
values ('90001','Los Angeles','California');
insert into states
values ('60601','Chicago','Illinois');
insert into states
values ('11798','Wheatley Heights','New York');
insert into states
values ('30301','Atlanta','Georgia');
insert into states
values ('44101','Cleveland','Ohio');
insert into states
values ('78701','Austin','Texas');
insert into states
values ('33124','Miami','Florida');
insert into states
values ('15201','Pittsburgh','Pennsylvania');
insert into states
values ('37201','Nashville','Tennessee');
       
insert into states
values ('97201','Portland','Oregon');

-- coaches data------------------------------------------------------------------------------------
insert into coaches 
values ('p1','3/15/2014',NULL,'3000000');
insert into coaches 
values ('p2','3/16/2014',NULL,'2500000');
insert into coaches 
values ('p3','3/16/2014',NULL,'1700000');
insert into coaches 
values ('p4','3/16/2014',NULL,'8500000');
insert into coaches 
values ('p5','4/11/2014',NULL,'1000000');
insert into coaches 
values ('p6','4/15/2014',NULL,'500000');
insert into coaches 
values ('p7','4/15/2014',NULL,'600000');

-- nflcombineresults data-----------------------------------------------------------------------------------
insert into nflcombineresults
values ('p8', '4.59','4.58', '4.00','4.01','212','73');
insert into nflcombineresults
values ('p9', '4.82','4.90', '4.36','4.31','226','75');
insert into nflcombineresults
values ('p10', '4.33','4.38', '4.01','3.91','197','71');
insert into nflcombineresults
values ('p11', '4.66','4.62', '4.22','4.25','246','74');
insert into nflcombineresults
values ('p12', '4.92','5.01', '4.65','4.60','308','73');
insert into nflcombineresults
values ('p13', '4.99','5.13', '4.55','4.64','313','77');
insert into nflcombineresults
values ('p14', '5.29','5.23', '4.71','4.69','311','78');
insert into nflcombineresults
values ('p15', '4.22','4.20', '3.90','3.99','208','71');
insert into nflcombineresults
values ('p16', '4.49','4.45', '4.10','4.09','213','73');
insert into nflcombineresults
values ('p17', '4.25','4.22', '4.02','4.00','215','75');
insert into nflcombineresults
values ('p18', '4.50','4.52', '4.13','4.17','236','74');
insert into nflcombineresults
values ('p19', '4.72','4.72', '4.33','4.27','242','73');
insert into nflcombineresults
values ('p20', '4.52','4.51', '4.13','4.19','211','73');
insert into nflcombineresults
values ('p21', '4.40','4.37', '4.03','4.19','202','70');
insert into nflcombineresults
values ('p22', '4.56','4.57', '4.23','4.19','213','73');
insert into nflcombineresults
values ('p23', '4.26','4.27', '4.00','4.00','193','71');
insert into nflcombineresults
values ('p24', '4.79','4.72', '4.40','4.45','289','74');
insert into nflcombineresults
values ('p25', '4.52','4.53', '4.20','4.25','282','73');
insert into nflcombineresults
values ('p26', '4.22','4.25', '3.82','3.95','202','72');
insert into nflcombineresults
values ('p27', '4.52','4.55', '4.02','4.05','219','74');
insert into nflcombineresults
values ('p28', '4.58','4.50', '4.18','4.15','227','74');
insert into nflcombineresults
values ('p29', '4.58','4.63', '4.28','4.30','211','73');
insert into nflcombineresults
values ('p30', '4.48','4.49', '4.30','4.27','271','72');
insert into nflcombineresults
values ('p31', '4.78','4.79', '4.49','4.57','230','76');
insert into nflcombineresults
values ('p32', '4.98','5.09', '4.69','4.67','320','77');
insert into nflcombineresults
values ('p33', '4.28','4.24', '3.89','3.77','208','71');
insert into nflcombineresults
values ('p34', '4.58','4.54', '4.19','4.20','225','71');
insert into nflcombineresults
values ('p35', '4.78','4.84', '4.49','4.50','305','73');
insert into nflcombineresults
values ('p36', '4.98','4.92', '4.59','4.50','227','76');
insert into nflcombineresults
values ('p37', '4.48','4.42', '4.09','4.10','227','75');


-- schools data----------------------------------------------------------------------------------------------
insert into schools 
values ('p8', 'LSU', 'SEC', '1');
insert into schools 
values ('p9', 'FSU', 'ACC', '1');
insert into schools 
values ('p10', 'TCU', 'Big 12', '1');
insert into schools 
values ('p11', 'Oregon', 'Pac 12', '1');
insert into schools 
values ('p12', 'Auburn', 'SEC', '3');
insert into schools 
values ('p13', 'Vanderbilt', 'SEC', '1');
insert into schools 
values ('p14', 'Michigan', 'Big 10', '1');
insert into schools 
values ('p15', 'Penn State', 'Big 10', '1');
insert into schools 
values ('p16', 'Arizona State', 'Pac 12', '1');
insert into schools 
values ('p17', 'Miami', 'ACC', '1');
insert into schools 
values ('p18', 'Clemson', 'ACC', '1');
insert into schools 
values ('p19', 'Iowa', 'Big 10', '1');
insert into schools 
values ('p20', 'Texas', 'Big 12', '1');
insert into schools 
values ('p21', 'Oklahoma', 'Big 12', '1');
insert into schools 
values ('p22', 'Georgia', 'SEC', '1');
insert into schools 
values ('p23', 'Alabama', 'SEC', '1');
insert into schools 
values ('p24', 'Nebraska', 'Big 10', '1');
insert into schools 
values ('p25', 'Boston College', 'ACC', '1');
insert into schools 
values ('p26', 'Ohio State', 'Big 10', '1');
insert into schools 
values ('p27', 'USC', 'Pac 12', '1');
insert into schools 
values ('p28', 'Baylor', 'Big 12', '1');
insert into schools 
values ('p29', 'Utah', 'Pac 12', '1');
insert into schools 
values ('p30', 'Pitt', 'ACC', '1');
insert into schools 
values ('p31', 'Kansas', 'Big 12', '1');
insert into schools 
values ('p32', 'Colorado', 'Pac 12', '1');
insert into schools 
values ('p33', 'Duke', 'ACC', '1');
insert into schools 
values ('p34', 'Kentucky', 'SEC', '1');
insert into schools 
values ('p35', 'Wisconsin', 'Big 10', '1');
insert into schools 
values ('p36', 'UCLA', 'Pac 12', '1');
insert into schools 
values ('p37', 'West Virginia', 'Big 12', '1');

-- players data-----------------------------------------------------------------------------------------------
insert into players
values ('p8','RB','p8','p8');
insert into players
values ('p9','QB','p9','p9');
insert into players
values ('p10','WR','p10','p10');
insert into players
values ('p11','WR','p11','p11');
insert into players
values ('p12','OL','p12','p12');
insert into players
values ('p13','OL','p13','p13');
insert into players
values ('p14','OL','p14','p14');
insert into players
values ('p15','DB','p15','p15');
insert into players
values ('p16','DB','p16','p16');
insert into players
values ('p17','DB','p17','p17');
insert into players
values ('p18','LB','p18','p18');
insert into players
values ('p19','LB','p19','p19');
insert into players
values ('p20','QB','p20','p20');
insert into players
values ('p21','RB','p21','p21');
insert into players
values ('p22','DB','p22','p22');
insert into players
values ('p23','WR','p23','p23');
insert into players
values ('p24','DL','p24','p24');
insert into players
values ('p25','DL','p25','p25');
insert into players
values ('p26','RB','p26','p26');
insert into players
values ('p27','QB','p27','p27');
insert into players
values ('p28','LB','p28','p28');
insert into players
values ('p29','WR','p29','p29');
insert into players
values ('p30','DL','p30','p30');
insert into players
values ('p31','QB','p31','p31');
insert into players
values ('p32','OL','p32','p32');
insert into players
values ('p33','RB','p33','p33');
insert into players
values ('p34','LB','p34','p34');
insert into players
values ('p35','DL','p35','p35');
insert into players
values ('p36','QB','p36','p36');
insert into players
values ('p37','QB','p37','p37');
-- interviews data ---------------------------------------------------------------------------------------------------------------------
insert into interviews (CID,PLID,interviewdate,interviewlettergrade)
values 
		('p4','p8','3/10/2017','B'),
        ('p3','p9','3/10/2017','B'),
        ('p2','p10','3/10/2017','C'),
        ('p2','p11','3/10/2017','A'),
        ('p3','p12','3/10/2017','A'),
        ('p1','p13','3/10/2017','C'),
        ('p3','p14','3/10/2017','A'),
        ('p1','p15','3/10/2017','A'),
        ('p1','p16','3/10/2017','B'),
        ('p3','p17','3/10/2017','B'),
        ('p7','p18','3/10/2017','B'),
        ('p2','p19','3/10/2017','C'),
        ('p3','p20','3/10/2017','A'),
        ('p1','p21','3/10/2017','C'),
        ('p5','p22','3/10/2017','F'),
        ('p3','p23','3/10/2017','A'),
        ('p3','p24','3/10/2017','A'),
        ('p3','p25','3/10/2017','C'),
        ('p3','p26','3/10/2017','F'),
        ('p7','p27','3/10/2017','B'),
        ('p1','p28','3/10/2017','B'),
        ('p4','p29','3/10/2017','B'),
        ('p6','p30','3/10/2017','F'),
        ('p3','p31','3/10/2017','B'),
        ('p2','p32','3/10/2017','A'),
        ('p1','p33','3/10/2017','B'),
        ('p5','p34','3/10/2017','C'),
        ('p7','p35','3/10/2017','B'),
        ('p2','p36','3/10/2017','B'),
        ('p3','p37','3/10/2017','A');
        
-- medicalhistory data--------------------------------------------------------------------------------------------------------------
insert into medicalhistory (PLID,patientID)
values 
		('p8','pat1'),
        ('p9','pat2'),
        ('p10','pat3'),
        ('p11','pat4'),
        ('p12','pat5'),
        ('p13','pat23'),
        ('p14','pat6'),
        ('p15','pat24'),
        ('p16','pat7'),
        ('p17','pat25'),
        ('p18','pat26'),
        ('p19','pat8'),
        ('p20','pat27'),
        ('p21','pat9'),
        ('p22','pat28'),
        ('p23','pat10'),
        ('p24','pat11'),
        ('p25','pat12'),
        ('p26','pat13'),
        ('p27','pat29'),
        ('p28','pat30'),
        ('p29','pat14'),
        ('p30','pat15'),
        ('p31','pat16'),
        ('p32','pat17'),
        ('p33','pat18'),
        ('p34','pat19'),
        ('p35','pat20'),
        ('p36','pat21'),
        ('p37','pat22');
 
-- surgeries data-------------------------------------------------------------------------------------------------------------
insert into surgeries (patientID,injury,surgerydate)
values 
		('pat1','Torn ACL','1/3/2017'),
        ('pat2','Torn MCL','12/13/2016 '),
        ('pat3','Torn ACL','10/23/2014 '),
        ('pat4',NULL,'3/30/2015 '),
        ('pat5','Torn ACL','11/3/2016 '),
        ('pat6',NULL,'2/5/2017 '),
        ('pat7',NULL,'4/3/2014 '),
        ('pat8','Broken Leg','7/3/2016 '),
        ('pat9','Torn ACL','1/3/2015 '),
        ('pat10',NULL,'12/3/2014 '),
        ('pat11',NULL,'6/3/2014 '),
        ('pat12',' Torn MCL','7/23/2014 '),
        ('pat13',NULL,'8/13/2016 '),
        ('pat14','Torn ACL','9/3/2013 '),
        ('pat15',NULL,'2/23/2015 '),
        ('pat16',NULL,'4/3/2016 '),
        ('pat17',NULL,'1/13/2015 '),
        ('pat18','Torn labrum','10/13/2014 '),
        ('pat19',NULL,'11/13/2015 '),
        ('pat20',NULL,'12/3/2016 '),
        ('pat21',NULL,'4/23/2016 '),
        ('pat22',NULL,'5/23/2016 '),
        ('pat23','Torn PCL','5/13/2016 '),
        ('pat24',NULL,'1/3/2014 '),
        ('pat25',NULL,'2/13/2015 '),
        ('pat26','Torn PCL','11/3/2015 '),
        ('pat27',NULL,'12/23/2013 '),
        ('pat28',NULL,'8/23/2016 '),
        ('pat29','Broken nose','9/13/2015 '),
        ('pat30',NULL,'9/3/2016 ');
        
-- crimecommitted data -------------------------------------------------------------------------------------       
insert into crimecommitted (criminalID, offense)
values 
		('cr01','sexual assault'),
        ('cr02','theft'),
        ('cr03','dui'),
        ('cr04','drugs'),
        ('cr05','theft'),
        ('cr06','theft'),
        ('cr07','sexual assault'),
        ('cr08','dui'),
        ('cr09','CLEAN'),
        ('cr10','CLEAN'),
        ('cr11','CLEAN'),
        ('cr12','CLEAN'),
        ('cr13','CLEAN'),
        ('cr14','CLEAN'),
        ('cr15','CLEAN'),
        ('cr16','CLEAN'),
        ('cr17','CLEAN'),
        ('cr18','CLEAN'),
        ('cr19','CLEAN'),
        ('cr20','CLEAN'),
        ('cr21','CLEAN'),
        ('cr22','CLEAN'),
        ('cr23','CLEAN'),
        ('cr24','CLEAN'),
        ('cr25','CLEAN'),
        ('cr26','CLEAN'),
        ('cr27','CLEAN'),
        ('cr28','CLEAN'),
        ('cr29','CLEAN'),
        ('cr30','CLEAN');
       
       
-- backgroundcheck data--------------------------------------------------------------------------------------
insert into backgroundcheck (PID, passedcheck, criminalID)
values 
		('p8',true,'cr09 '),
        ('p9',true,'cr10 '),
        ('p10',true ,'cr11 '),
        ('p11',false,'cr01'),
        ('p12',true,'cr12 '),
        ('p13',true,'cr13 '),
        ('p14',false,'cr02'),
        ('p15',false,'cr03'),
        ('p16',true,'cr14 '),
        ('p17',true,'cr15 '),
        ('p18',false,'cr04'),
        ('p19',true,'cr16 '),
        ('p20',true,'cr17 '),
        ('p21',true,'cr18 '),
        ('p22',true,'cr19 '),
        ('p23',true,'cr20 '),
        ('p24',false,'cr05'),
        ('p25',true,'cr21 '),
        ('p26',true,'cr22 '),
        ('p27',true,'cr23 '),
        ('p28',true,'cr24 '),
        ('p29',false,'cr06'),
        ('p30',true,'cr25 '),
        ('p31',true,'cr26 '),
        ('p32',false,'cr07'),
        ('p33',true,'cr27 '),
        ('p34',true,'cr28 '),
        ('p35',false,'cr08'),
        ('p36',true,'cr29 '),
        ('p37',true,'cr30 ');
        
        
-- 1st Query: Shows what prospects are at least 6'2"-------------------------------------------------------------------------
select nflcombineresults.heightIns, people.firstname, people.lastname, players.position, schools.name, schools.conference
from players
inner join schools on schools.uid = players.plid
inner join people on people.pid = players.plid
inner join nflcombineresults on nflcombineresults.combineID = players.plid
where nflcombineresults.heightIns > '73'
order by nflcombineresults.heightIns DESC
;
-- 2nd Query: Shows all prospects who ran the 40 yard dash in under 4.4 seconds  -------------------------------------------
select nflcombineresults.fortyfirstattempt, people.firstname, people.lastname, players.position, schools.name, schools.conference
from players
inner join nflcombineresults on nflcombineresults.combineid = players.plid
inner join people on people.pid = players.plid
inner join schools on schools.uid = players.plid
where nflcombineresults.fortyfirstattempt < '4.50'
order by nflcombineresults.fortyfirstattempt ASC
; 
-- 3rd Query: Which coach has the highest salary and where they reside --------------------------------------------------------------
select people.firstname, people.lastname, people.age, states.state, states.city, coaches.salaryusd
from people
inner join states on states.zipcode = people.zipcode
inner join coaches on people.pid = coaches.cid
order by coaches.salaryusd DESC
;
-- 1st View : returns all prospects who have a criminal record  -------------------------------------------------------------------------
DROP VIEW IF EXISTS Players_with_criminal_record;
CREATE VIEW Players_with_criminal_record as
select crimecommitted.offense, backgroundcheck.pid, backgroundcheck.criminalID, people.firstname, people.lastname,backgroundcheck.passedcheck
from crimecommitted 
inner join backgroundcheck on backgroundcheck.criminalID = crimecommitted.criminalID
inner join people on people.pid = backgroundcheck.pid
;
-- Example query for view--------
select * 
from Players_with_criminal_record
where passedcheck = false and
offense = 'theft'
order by firstname
;

-- 2nd View : returns all prospects who have had surgery on their ACL and the date ----------------------------------------------
DROP VIEW IF EXISTS PlayerSurgeries;
CREATE VIEW PlayerSurgeries as
select people.firstname, people.lastname, surgeries.surgerydate, surgeries.injury
from people
inner join players on players.plid = people.pid 
inner join medicalhistory on medicalhistory.plid = players.plid
inner join surgeries on surgeries.patientid = medicalhistory.patientid
;
-- Example query for view--------
select *
from ACLSurgeries
where injury = 'Torn ACL' 
;
-- 3rd View : coaches can check which players did did the best during the formal interview 
DROP VIEW IF EXISTS InterviewResults;
CREATE VIEW InterviewResults as
select people.firstname, people.lastname, interviews.interviewlettergrade
from people 
inner join players on players.plid = people.pid
inner join interviews on interviews.plid = players.plid
ORDER BY interviews.interviewlettergrade DESC
;
-- Example query for view--------
select * 
from InterviewResults
where interviewlettergrade = 'A'
;


-- Stored Procedures---------------------------------------------------------

CREATE OR REPLACE FUNCTION Valid_combine_input()
RETURNS TRIGGER AS
$$ BEGIN
IF NEW.fortyfirstattempt IS NULL and NEW.shuttlefirstattempt IS NULL THEN
RAISE EXCEPTION 'player must have at least one recorded event';
END IF;
IF NEW.weightLBs IS NULL and NEW.heightIns IS NULL THEN
RAISE EXCEPTION 'height and weight must be recorded at the combine';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers------------------------------------------------------------------
CREATE TRIGGER Valid_combine_input
BEFORE INSERT OR UPDATE ON nflcombineresults
FOR EACH ROW
EXECUTE PROCEDURE Valid_combine_input();

-- Sample input for trigger--------------------------------------------
INSERT INTO nflcombineresults 
values 
		('p35',null,'4.50',null,'4.4','74','300');

-- Security Features-------------------------------------------------

CREATE ROLE ExecStaff;
GRANT ALL ON ALL TABLES
IN SCHEMA PUBLIC
TO ExecStaff;

CREATE ROLE CoachingStaff;
GRANT ALL ON ALL TABLES
IN SCHEMA PUBLIC
TO CoachingStaff;


CREATE ROLE Guests;
GRANT SELECT ON players, 
				coaches, 
                medicalhistory, 
                surgeries, 
                schools, 
                nflcombineresults
TO Guests;

