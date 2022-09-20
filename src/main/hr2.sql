drop user hr2 cascade;

create user hr2 identified by hr2 default tablespace users;
grant connect, resource to hr2;

create table hr2.laborers (
laborer_id number(3) constraint laborer_id_pk primary key,
name varchar2(30) constraint laborer_name_nn not null,
hire_date date constraint laborer_hiredate_nn not null
);

create sequence hr2.laborer_id_seq;