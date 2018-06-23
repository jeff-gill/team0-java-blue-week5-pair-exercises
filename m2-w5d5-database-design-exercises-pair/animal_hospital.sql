--Assumptions: 
-- 1. this animal hospital is in the US and only see's domestic patients and owners
-- 2. this animal services only cats, dogs and birds
-- 3. this animal hospital has only one office
-- 4. we're a super high-end VIP hospital and we only have 2 patient owners and 4 animals that we see
-- 5. we only have a select number of procedures that we perform. all others are performed at the state hospital that is unaffiliated
-- 6. cost for procedures for dog is n, cost of proceudre for cat is n * 5, cost for procedure for bird is n * 0.25
-- 7. each appointment is invoiced seperately

create database animal_hospital

drop table invoice
drop table procedure_appointment
drop table pet_procedure
drop table appointment
drop table procedure
drop table pet_owner 
drop table owner
drop table pet
drop table phone
drop table address




create table pet (
        pet_id serial not null,
        pet_name varchar(35) not null,
        pet_type varchar(35)not null,
        pet_age varchar(2),
        
        constraint pk_pet_id primary key (pet_id)
);


create table address (
        address_id serial not null,
        address1 varchar (50) not null,
        address2 varchar (50),
        city varchar(35) not null,
        district varchar(35) not null,
        zip_code varchar(15) not null,
        
        constraint pk_address_id primary key (address_id)
);

create table phone (
        phone_id serial not null,
        phone_number varchar(15) not null,
        
        constraint pk_phone_id primary key (phone_id)
);

create table owner (
        owner_id serial not null,
        first_name varchar(35) not null,
        last_name varchar(35) not null,
        address_id int not null,
        phone_id int not null,

        constraint pk_owner_id primary key (owner_id),
        constraint fk_address_id foreign key (address_id) references address(address_id),
        constraint fk_phone_id foreign key (phone_id) references phone(phone_id)
);

create table pet_owner (
        owner_id int,
        pet_id int,

        constraint fk1_owner_id foreign key (owner_id) references owner(owner_id),
        constraint fk2_pet_id foreign key (pet_id) references pet(pet_id)
);

create table procedure (
        procedure_id serial not null,
        procedure_name varchar(35) not null,
        cost varchar(10) not null,

        constraint pk_procedure_id primary key (procedure_id)
);

create table appointment (
        appointment_id serial not null,
        visit_date date not null,
    
      constraint pk_appointment_id primary key (appointment_id)
);


create table procedure_appointment (
        procedure_id int,
        appointment_id int,

        constraint fk1_procedure_id foreign key (procedure_id) references procedure(procedure_id),
        constraint fk2_appointment_id foreign key (appointment_id) references appointment(appointment_id)
);
      
create table invoice (
        invoice_id serial not null,
        appointment_id int not null,
        owner_id int not null,
        sale_tax varchar(10) not null,
        invoice_date date,
        hospital_name varchar(50) not null,
        
        constraint pk_invoice_id primary key (invoice_id),
        constraint fk_appointment_id foreign key (appointment_id) references appointment(appointment_id),
        constraint fk_owner_id foreign key (owner_id) references owner(owner_id)    
);

create table pet_procedure (
        procedure_id int,
        pet_id int,

        constraint fk1_procedure_id foreign key (procedure_id) references procedure(procedure_id),
        constraint fk2_pet_id foreign key (pet_id) references pet(pet_id)
);

select * from pet 
 
insert into pet (pet_id, pet_name, pet_type, pet_age)
        values (1, 'Rover', 'Dog', '12') 

insert into pet (pet_id, pet_name, pet_type, pet_age)
        values (2, 'Spot', 'Dog', '2') 
        
insert into pet (pet_id, pet_name, pet_type, pet_age)
        values (3, 'Morris', 'Cat', '4') 
        
insert into pet (pet_id, pet_name, pet_type, pet_age)
        values (4, 'Tweedy', 'Bird', '2') 

select * from address
        
insert into address (address_id, address1, address2, city, district, zip_code)
        values (1, '123 This Street', null, 'My City', 'Ohio', '43234')

insert into address (address_id, address1, address2, city, district, zip_code)
        values (2, '456 That Street', null, 'Your City', 'Ohio', '46734')

select * from phone number

insert into phone (phone_id, phone_number)
        values (1, '614-555-6556')

insert into phone (phone_id, phone_number)
        values (2, '734-555-9880')

select * from owner

insert into owner (owner_id, first_name, last_name, address_id, phone_id)
        values (1, 'Sam', 'Cook', 1, 1)
        
insert into owner (owner_id, first_name, last_name, address_id, phone_id)
        values (2, 'Terry', 'Kim', 2, 2)        

select * from procedure

insert into procedure(procedure_id, procedure_name, cost)
        values(1, 'Rabies Vaccination','32')

insert into procedure(procedure_id, procedure_name, cost)
        values(10, 'Examine and Treat Wound','40')
        
insert into procedure(procedure_id, procedure_name, cost)
        values(5, 'Heartworm Test','16')
        
insert into procedure(procedure_id, procedure_name, cost)
        values(8, 'Tetanus Vaccination','36')

insert into procedure(procedure_id, procedure_name, cost)
        values(20, 'Annual Check Up','52')
        
insert into procedure(procedure_id, procedure_name, cost)
        values(12, 'Eye Wash','12')

select * from appointment

insert into appointment(appointment_id, visit_date)
        values(1,'1/13/2002')
        
insert into appointment(appointment_id, visit_date)
        values(2,'3/27/2002')

insert into appointment(appointment_id, visit_date)
        values(3,'4/02/2002')
        
insert into appointment(appointment_id, visit_date)
        values(4,'1/21/2002')
        
insert into appointment(appointment_id, visit_date)
        values(5,'3/10/2002')

insert into appointment(appointment_id, visit_date)
        values(6,'1/23/2001')

insert into appointment(appointment_id, visit_date)
        values(7,'1/13/2002')
        
insert into appointment(appointment_id, visit_date)
        values(8,'4/30/2002')
        
insert into appointment(appointment_id, visit_date)
        values(9,'4/30/2002')

select * from invoice

insert into invoice (invoice_id, appointment_id, owner_id, sale_tax, invoice_date, hospital_name)
        values (1, 1, 1, '0.075', '1/20/2002', 'Hilltop Animal Hospital')
        
insert into invoice (invoice_id, appointment_id, owner_id, sale_tax, invoice_date, hospital_name)
        values (3, 2, 1, '0.075', '4/03/2002', 'Hilltop Animal Hospital')

insert into invoice (invoice_id, appointment_id, owner_id, sale_tax, invoice_date, hospital_name)
        values (3, 3, 1, '0.075', '4/07/2002', 'Hilltop Animal Hospital')
        
insert into invoice (invoice_id, appointment_id, owner_id, sale_tax, invoice_date, hospital_name)
        values (3, 4, 1, '0.075', '1/28/2002', 'Hilltop Animal Hospital')

insert into invoice (invoice_id, appointment_id, owner_id, sale_tax, invoice_date, hospital_name)
        values (5, 5, 1, '0.075', '3/17/2002', 'Hilltop Animal Hospital')

insert into invoice (invoice_id, appointment_id, owner_id, sale_tax, invoice_date, hospital_name)
        values (1, 6, 1, '0.075', '1/30/2001', 'Hilltop Animal Hospital')

insert into invoice (invoice_id, appointment_id, owner_id, sale_tax, invoice_date, hospital_name)
        values (7, 7, 1, '0.075', '1/20/2002', 'Hilltop Animal Hospital')

insert into invoice (invoice_id, appointment_id, owner_id, sale_tax, invoice_date, hospital_name)
        values (2, 2, 1, '0.075', '4/10/2002', 'Hilltop Animal Hospital')


select * from appointment
join procedure on appointment.appointment_id = procedure.procedure_id
        