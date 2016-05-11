drop table T_PRODUCT if exists;

create table T_PRODUCT (ID bigint identity primary key,
                        NAME varchar(50) not null, CEILING int, unique(NAME));
                        
ALTER TABLE T_PRODUCT ALTER COLUMN CEILING SET DEFAULT 0;
