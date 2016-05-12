drop table BANK_USER if exists;
CREATE TABLE BANK_USER (
	ID bigint identity primary key,
    LOGIN VARCHAR(50),
    USER_PASSWORD VARCHAR(50),
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50));
    
drop table PAYEE if exists;  
CREATE TABLE PAYEE (
	ID bigint identity primary key,
    ACCOUNT VARCHAR(50),
    NAME VARCHAR(50),
    ADDRESS VARCHAR(50),
    OWNER_ID bigint,
    FOREIGN KEY (OWNER_ID) 
    REFERENCES BANK_USER(ID));
    