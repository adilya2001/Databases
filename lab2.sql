create database lab2;

create table countries(
                          country_id serial primary key,
                          country_name varchar(256),
                          region_id int,
                          population int
);
insert  into  countries values (DEFAULT , 'ENGLAND', 14, 25000000);
insert into countries (country_id, country_name) values (default , 'ENGLAND');
insert into countries (region_id) values (NULL);
insert into countries values (default , 'CHINA', null , 55500000);
insert into countries values  (default ,'GERMANY', 33, 179002300),
                              (default , 'FRANCE', 1 , 1503240000),
                              (default , 'KOREA', 8, 140012000);
alter table countries alter column country_name set default 'KAZAKHSTAN';
insert into countries (country_name) values (default);
insert into countries values (default , default , default, default);
create table countries_new(
    LIKE countries
);
INSERT INTO countries_new SELECT * FROM countries RETURNING *;
update countries set region_id = 1 WHERE region_id IS NULL;
update countries set population = population*1.1 returning  country_name, population as "New Population";
DELETE FROM countries WHERE population < 100000;
DELETE FROM countries_new AS c USING countries AS n WHERE c.country_id = n.country_id RETURNING *;
delete from countries * returning *;
SELECT * FROM countries;