--------------------------------------------------------
--  File created - вівторок-січня-24-2017   
--------------------------------------------------------
DROP TABLE "DIARY" cascade constraints;
DROP TABLE "FACGROUPS" cascade constraints;
DROP TABLE "FACULTY" cascade constraints;
DROP TABLE "GROUPS" cascade constraints;
DROP TABLE "ORGANIZATION_FOR_PRACTICE" cascade constraints;
DROP TABLE "STUDENT" cascade constraints;
DROP TABLE "TEACHER" cascade constraints;
DROP TABLE "USERS" cascade constraints;
DROP VIEW "DIARYVIEW";
DROP VIEW "PLACES";
DROP VIEW "PRACTICEVIEW";
DROP VIEW "TEACHERVIEW";
DROP VIEW "USERSVIEW";
DROP PROCEDURE "ADDMARK";
DROP PROCEDURE "LOGIN";
DROP PROCEDURE "PLACETHEME";
DROP PROCEDURE "REGISTRATION";
DROP PROCEDURE "WEEKUPDATE";
--------------------------------------------------------
--  DDL for Table DIARY
--------------------------------------------------------

  CREATE TABLE "DIARY" 
   (	"MARK_ONE" NUMBER, 
	"WEEK_THREE" VARCHAR2(1000 BYTE), 
	"UPDATE_DATE" DATE, 
	"ST_NAME_FK" VARCHAR2(200 BYTE), 
	"THEME" VARCHAR2(60 BYTE), 
	"WEEK_ONE" VARCHAR2(1000 BYTE), 
	"WEEK_TWO" VARCHAR2(1000 BYTE), 
	"MARK_TWO" NUMBER, 
	"MARK_THREE" NUMBER
   );
--------------------------------------------------------
--  DDL for Table FACGROUPS
--------------------------------------------------------

  CREATE TABLE "FACGROUPS" 
   (	"FACULTY_NAME" VARCHAR2(20 BYTE), 
	"GROUP_NAME" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Table FACULTY
--------------------------------------------------------

  CREATE TABLE "FACULTY" 
   (	"FACULTY_NAME" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Table GROUPS
--------------------------------------------------------

  CREATE TABLE "GROUPS" 
   (	"GROUP_NAME" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Table ORGANIZATION_FOR_PRACTICE
--------------------------------------------------------

  CREATE TABLE "ORGANIZATION_FOR_PRACTICE" 
   (	"ORGANIZATION_NAME" VARCHAR2(100 BYTE), 
	"ADRESS" VARCHAR2(100 BYTE), 
	"LONGITUDE" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"LATITUDE" VARCHAR2(20 BYTE) DEFAULT 0
   );
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "STUDENT" 
   (	"ST_NAME" VARCHAR2(200 BYTE), 
	"ST_DEPARTMENT" VARCHAR2(50 BYTE), 
	"ST_GROUP" VARCHAR2(20 BYTE), 
	"ORGANIZATION_NAME_FK" VARCHAR2(100 BYTE), 
	"ST_LOGIN_FK" VARCHAR2(30 BYTE)
   );
--------------------------------------------------------
--  DDL for Table TEACHER
--------------------------------------------------------

  CREATE TABLE "TEACHER" 
   (	"T_NAME" VARCHAR2(200 BYTE), 
	"ACADEMIC_DEGREE" VARCHAR2(100 BYTE), 
	"T_DEPARTMENT" VARCHAR2(50 BYTE), 
	"T_LOGIN_FK" VARCHAR2(30 BYTE)
   );
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"LOGIN" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(30 BYTE), 
	"ROLE" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for View DIARYVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "DIARYVIEW" ("MARK_ONE", "WEEK_THREE", "UPDATE_DATE", "ST_NAME_FK", "THEME", "WEEK_ONE", "WEEK_TWO", "MARK_TWO", "MARK_THREE", "SGROUP") AS 
  SELECT "MARK_ONE","WEEK_THREE","UPDATE_DATE","ST_NAME_FK","THEME","WEEK_ONE","WEEK_TWO","MARK_TWO","MARK_THREE",
s.st_group sgroup
    
FROM diary JOIN Student s ON st_name_fk=s.st_name;
--------------------------------------------------------
--  DDL for View PLACES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "PLACES" ("ORGANIZATION_NAME", "ADRESS", "LONGITUDE", "LATITUDE") AS 
  SELECT "ORGANIZATION_NAME","ADRESS","LONGITUDE","LATITUDE"
    
FROM organization_for_practice;
--------------------------------------------------------
--  DDL for View PRACTICEVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "PRACTICEVIEW" ("STUDENT_NAME", "PLACE", "PLACE_ADRESS", "LATITUDE", "LONGTITUDE", "THEME") AS 
  SELECT s.st_name student_name, pr.organization_name place,
pr.adress place_adress, pr.latitude latitude, pr.longitude longtitude, dr.theme
    
FROM Student s  LEFT OUTER JOIN 
organization_for_practice pr ON pr.organization_name=s.organization_name_fk JOIN Diary dr ON
dr.st_name_fk=s.st_name;
--------------------------------------------------------
--  DDL for View TEACHERVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "TEACHERVIEW" ("LOGIN", "NPASSWORD", "UROLE", "T_NAME", "FACULTY", "T_DEGREE") AS 
  SELECT u.login, u.password npassword, u.role urole, tr.t_name, tr.t_department faculty,
tr.academic_degree t_degree
FROM Users u JOIN teacher tr ON u.login=tr.t_login_fk;
--------------------------------------------------------
--  DDL for View USERSVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "USERSVIEW" ("LOGIN", "NPASSWORD", "UROLE", "ST_NAME", "FACULTY", "SGROUP") AS 
  SELECT u.login, u.password npassword, u.role urole, s.st_name, s.st_department faculty,
s.st_group sgroup
FROM Users u JOIN Student s ON u.login=s.st_login_fk;

--------------------------------------------------------
--  DDL for Index FACULTY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FACULTY_PK" ON "FACULTY" ("FACULTY_NAME");
--------------------------------------------------------
--  DDL for Index TEACHER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEACHER_PK" ON "TEACHER" ("T_NAME");
--------------------------------------------------------
--  DDL for Index DIARY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DIARY_PK" ON "DIARY" ("ST_NAME_FK");
--------------------------------------------------------
--  DDL for Index GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GROUPS_PK" ON "GROUPS" ("GROUP_NAME");
--------------------------------------------------------
--  DDL for Index FACGROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FACGROUPS_PK" ON "FACGROUPS" ("GROUP_NAME");
--------------------------------------------------------
--  DDL for Index STUDENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STUDENT_PK" ON "STUDENT" ("ST_NAME");
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERS_PK" ON "USERS" ("LOGIN");
--------------------------------------------------------
--  DDL for Index ORGANIZATION_FOR_PRACTICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORGANIZATION_FOR_PRACTICE_PK" ON "ORGANIZATION_FOR_PRACTICE" ("ORGANIZATION_NAME");
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "STUDENT" ADD CONSTRAINT "STUDENT_PK" PRIMARY KEY ("ST_NAME");
 
  ALTER TABLE "STUDENT" MODIFY ("ST_LOGIN_FK" NOT NULL ENABLE);
 
  ALTER TABLE "STUDENT" MODIFY ("ST_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GROUPS
--------------------------------------------------------

  ALTER TABLE "GROUPS" ADD CONSTRAINT "GROUPS_PK" PRIMARY KEY ("GROUP_NAME");
 
  ALTER TABLE "GROUPS" MODIFY ("GROUP_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FACULTY
--------------------------------------------------------

  ALTER TABLE "FACULTY" ADD CONSTRAINT "FACULTY_PK" PRIMARY KEY ("FACULTY_NAME");
 
  ALTER TABLE "FACULTY" MODIFY ("FACULTY_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DIARY
--------------------------------------------------------

  ALTER TABLE "DIARY" ADD CONSTRAINT "DIARY_PK" PRIMARY KEY ("ST_NAME_FK");
 
  ALTER TABLE "DIARY" MODIFY ("ST_NAME_FK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORGANIZATION_FOR_PRACTICE
--------------------------------------------------------

  ALTER TABLE "ORGANIZATION_FOR_PRACTICE" ADD CONSTRAINT "ORGANIZATION_FOR_PRACTICE_PK" PRIMARY KEY ("ORGANIZATION_NAME");
 
  ALTER TABLE "ORGANIZATION_FOR_PRACTICE" MODIFY ("LATITUDE" NOT NULL ENABLE);
 
  ALTER TABLE "ORGANIZATION_FOR_PRACTICE" MODIFY ("LONGITUDE" NOT NULL ENABLE);
 
  ALTER TABLE "ORGANIZATION_FOR_PRACTICE" MODIFY ("ORGANIZATION_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FACGROUPS
--------------------------------------------------------

  ALTER TABLE "FACGROUPS" ADD CONSTRAINT "FACGROUPS_PK" PRIMARY KEY ("GROUP_NAME");
 
  ALTER TABLE "FACGROUPS" MODIFY ("GROUP_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" MODIFY ("ROLE" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("LOGIN" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("LOGIN");
--------------------------------------------------------
--  Constraints for Table TEACHER
--------------------------------------------------------

  ALTER TABLE "TEACHER" MODIFY ("T_LOGIN_FK" NOT NULL ENABLE);
 
  ALTER TABLE "TEACHER" MODIFY ("T_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "TEACHER" ADD CONSTRAINT "TEACHER_PK" PRIMARY KEY ("T_NAME");
--------------------------------------------------------
--  Ref Constraints for Table DIARY
--------------------------------------------------------

  ALTER TABLE "DIARY" ADD CONSTRAINT "DIARY_FK1" FOREIGN KEY ("ST_NAME_FK")
	  REFERENCES "STUDENT" ("ST_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FACGROUPS
--------------------------------------------------------

  ALTER TABLE "FACGROUPS" ADD CONSTRAINT "FACGROUPS_FK1" FOREIGN KEY ("FACULTY_NAME")
	  REFERENCES "FACULTY" ("FACULTY_NAME") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "FACGROUPS" ADD CONSTRAINT "FACGROUPS_FK2" FOREIGN KEY ("GROUP_NAME")
	  REFERENCES "GROUPS" ("GROUP_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "STUDENT" ADD CONSTRAINT "STUDENT_FK1" FOREIGN KEY ("ST_LOGIN_FK")
	  REFERENCES "USERS" ("LOGIN") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "STUDENT" ADD CONSTRAINT "STUDENT_FK2" FOREIGN KEY ("ORGANIZATION_NAME_FK")
	  REFERENCES "ORGANIZATION_FOR_PRACTICE" ("ORGANIZATION_NAME") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "STUDENT" ADD CONSTRAINT "STUDENT_FK3" FOREIGN KEY ("ST_DEPARTMENT")
	  REFERENCES "FACULTY" ("FACULTY_NAME") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "STUDENT" ADD CONSTRAINT "STUDENT_FK4" FOREIGN KEY ("ST_GROUP")
	  REFERENCES "GROUPS" ("GROUP_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TEACHER
--------------------------------------------------------

  ALTER TABLE "TEACHER" ADD CONSTRAINT "TEACHER_FK1" FOREIGN KEY ("T_LOGIN_FK")
	  REFERENCES "USERS" ("LOGIN") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "TEACHER" ADD CONSTRAINT "TEACHER_FK2" FOREIGN KEY ("T_DEPARTMENT")
	  REFERENCES "FACULTY" ("FACULTY_NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADDMARK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADDMARK" 
(name_in IN char, first_in IN char, second_in IN char, third_in IN char) 
IS
tmp_header char(150);
tmp_name char(200);
BEGIN
select st_name_fk into tmp_name from diaryview where st_name_fk=name_in;
if (tmp_name = name_in) then
begin
update diaryview set 
        mark_one=NVL(first_in,mark_one), 
        mark_two=NVL(second_in,mark_two),
        mark_three=NVL(third_in,mark_three)
        where st_name_fk=name_in;
end;
end if;
end addmark;

/
--------------------------------------------------------
--  DDL for Procedure LOGIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "LOGIN" 
(login_in in char, password_in in char, res out char)
IS
  tmp_login char(30);
BEGIN
  res:='1';
  begin
    select login into tmp_login from users where login=login_in and password=password_in;
    EXCEPTION
      when no_data_found then
        res:='0';
      end;
end login;

/
--------------------------------------------------------
--  DDL for Procedure PLACETHEME
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PLACETHEME" 
(name_in IN char, place_in IN char, theme_in IN char) 
IS
tmp_header char(150);
tmp_name char(50);
BEGIN
select st_name_fk into tmp_name from diaryview where st_name_fk=name_in;
if (tmp_name = name_in) then
begin
update student set
      organization_name_fk=NVL(place_in,organization_name_fk)
      where st_name=name_in;
update diary set
      theme=NVL(theme_in,theme)
      where st_name_fk=name_in;
end;
end if;
end placetheme;

/
--------------------------------------------------------
--  DDL for Procedure REGISTRATION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "REGISTRATION" 
(name_in in char, login_in in char, password_in in char, faculty_in in char, group_in in char, res out char)
IS
  login_tmp char(20);
  group_tmp char(20);
  fac_tmp char(20);
BEGIN
  res:='0';
  select FACULTY_NAME , GROUP_NAME INTO group_tmp, fac_tmp from FACGROUPS 
  where group_name=group_in and FACULTY_NAME=faculty_in;
  select login into login_tmp from usersview where login=login_in;
  EXCEPTION
    when no_data_found then
      if (group_tmp IS NULL) then
      res := '2';
      else begin
        insert into users (login, password,role) 
        values (login_in, password_in, 0);
        insert into student (st_name, st_department, st_group, st_login_fk) 
        values (name_in, faculty_in, group_in, login_in);
        insert into diary (st_name_fk) values
        (name_in);
        res:='1';
      end;
      end if;
END registration;

/
--------------------------------------------------------
--  DDL for Procedure WEEKUPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "WEEKUPDATE" 
(name_in IN char, first_in IN char, second_in IN char, third_in IN char) 
IS
tmp_header char(150);
tmp_name char(50);
BEGIN
select st_name_fk into tmp_name from diaryview where st_name_fk=name_in;
if (tmp_name = name_in) then
begin
update diaryview set 
        week_one=NVL(first_in,week_one), 
        week_two=NVL(second_in,week_two),
        week_three=NVL(third_in,week_three),
        update_date=sysdate
        where st_name_fk=name_in;
end;
end if;
end weekupdate;

/
