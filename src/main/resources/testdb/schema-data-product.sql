drop table T_PRODUCT if exists;

create table T_PRODUCT (ID bigint identity primary key,
                        NAME varchar(50) not null, CEILING int, unique(NAME));
                        
ALTER TABLE T_PRODUCT ALTER COLUMN CEILING SET DEFAULT 0;


insert into T_PRODUCT (NAME, CEILING) values ('CEL', 15000);
insert into T_PRODUCT (NAME, CEILING) values ('CODEVI', 6000);
insert into T_PRODUCT (NAME, CEILING) values ('LEP', 3000);
insert into T_PRODUCT (NAME, CEILING) values ('Livret A', 20000);
insert into T_PRODUCT (NAME, CEILING) values ('Livret bleu', 2000);
insert into T_PRODUCT (NAME, CEILING) values ('Livret jeune', 1000);
insert into T_PRODUCT (NAME, CEILING) values ('PEL', 60000);
insert into T_PRODUCT (NAME, CEILING) values ('PEA', 500000);
insert into T_PRODUCT (NAME, CEILING) values ('PEE', 100000);