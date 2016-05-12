-------------------
-- BANK_USER SCHEMA
drop table BANK_USER if exists;
CREATE TABLE BANK_USER (
	ID bigint identity primary key,
    LOGIN VARCHAR(50),
    USER_PASSWORD VARCHAR(50),
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50)
    );
    
-------------------
-- BANK_USER DATA    
insert into BANK_USER (LOGIN, USER_PASSWORD, FIRST_NAME, LAST_NAME) values ('TP8', 'TP8','RAYMOND', 'STOCKHOLM');
insert into BANK_USER (LOGIN, USER_PASSWORD, FIRST_NAME, LAST_NAME) values ('EGD', 'EGD','BERTRAND', 'AVE');
insert into BANK_USER (LOGIN, USER_PASSWORD, FIRST_NAME, LAST_NAME) values ('PLO', 'PLO','PHILIPPE', 'LOUIS');
insert into BANK_USER (LOGIN, USER_PASSWORD, FIRST_NAME, LAST_NAME) values ('NHU', 'NHU','NICOLAS', 'HUET');


-------------------
-- PAYEE SCHEMA
drop table PAYEE if exists;  
CREATE TABLE PAYEE (
	ID bigint identity primary key,
    ACCOUNT VARCHAR(50),
    NAME VARCHAR(50),
    ADDRESS VARCHAR(50),
    BANK_USER_ID bigint,
    FOREIGN KEY (BANK_USER_ID) 
    REFERENCES BANK_USER(ID)
    );
    
-------------------
-- PAYEE DATA   
-- BANK_USER ID=1 => TP8
-- BANK_USER ID=2 => EGD
insert into PAYEE (ACCOUNT, NAME, ADDRESS, BANK_USER_ID) values ('COMPTE_1', 'STOCKHOLM','2 RUE ALAIN FOURNIER', 1);
insert into PAYEE (ACCOUNT, NAME, ADDRESS, BANK_USER_ID) values ('COMPTE_2', 'STOCKHOLM','2 RUE ALAIN FOURNIER', 1);
insert into PAYEE (ACCOUNT, NAME, ADDRESS, BANK_USER_ID) values ('COMPTE_1', 'AVE','LUXEMBOURG', 2);    

-------------------
-- ACCOUNT_TYPE SCHEMA
drop table ACCOUNT_TYPE if exists;  
CREATE TABLE ACCOUNT_TYPE (
	ID bigint identity primary key,
	NAME VARCHAR(50),
    DESCRIPTION VARCHAR(500),
    );
-------------------
-- ACCOUNT_TYPE DATA   
insert into ACCOUNT_TYPE (NAME, DESCRIPTION) values ('CC', 'Compte Courant');   
insert into ACCOUNT_TYPE (NAME, DESCRIPTION) values ('CEL', 'Compte Epargne Logement');
insert into ACCOUNT_TYPE (NAME, DESCRIPTION) values ('PEL', 'Plan Epargne Logement');


-------------------
-- ACCOUNT SCHEMA
drop table ACCOUNT if exists;  
CREATE TABLE ACCOUNT (
	ID bigint identity primary key,
	BALANCE decimal(10,2),
    ACCOUNT_TYPE_ID bigint,
    BANK_USER_ID bigint,
    IS_OPEN BOOLEAN,
    FOREIGN KEY (ACCOUNT_TYPE_ID) 
    REFERENCES ACCOUNT_TYPE(ID),
    FOREIGN KEY (BANK_USER_ID) 
    REFERENCES BANK_USER(ID),
    );
-------------------
-- ACCOUNT DATA
insert into ACCOUNT (BALANCE,ACCOUNT_TYPE_ID,BANK_USER_ID,IS_OPEN) values (0, 1, 1, TRUE);
insert into ACCOUNT (BALANCE,ACCOUNT_TYPE_ID,BANK_USER_ID,IS_OPEN) values (0, 1, 2, TRUE);

-- PAYMENT_STATUS SCHEMA
drop table PAYMENT_STATUS if exists;  
CREATE TABLE PAYMENT_STATUS (
	ID bigint identity primary key,
	NAME VARCHAR(50),
	DESCRIPTION VARCHAR(500)
 );
-- PAYMENT_STATUS DATA
insert into PAYMENT_STATUS (NAME,DESCRIPTION) values ('ATTENTE','En attente');
insert into PAYMENT_STATUS (NAME,DESCRIPTION) values ('ENCOURS','En cours de traitement');
insert into PAYMENT_STATUS (NAME,DESCRIPTION)  values ('TERMINE','Terminé');
 

-------------------
-- PAYMENT SCHEMA
drop table PAYMENT if exists;  
CREATE TABLE PAYMENT (
	ID bigint identity primary key,
	EXECUTION_DATE TIMESTAMP,
	AMOUNT decimal(10,2),
    SCHEDULED_DATE TIMESTAMP,
    STATUS_MESSAGE VARCHAR(500),
    DEBIT_ACCOUNT_ID bigint,
    CREDIT_ACCOUNT_ID bigint,
    OWNER_ID bigint,
    PAYEE_ID bigint,
    PAYMENT_STATUS_ID bigint,
    FOREIGN KEY (DEBIT_ACCOUNT_ID) REFERENCES ACCOUNT(ID),
    FOREIGN KEY (CREDIT_ACCOUNT_ID) REFERENCES ACCOUNT(ID),
    FOREIGN KEY (OWNER_ID) REFERENCES BANK_USER(ID),
    FOREIGN KEY (PAYEE_ID) REFERENCES PAYEE(ID),
    FOREIGN KEY (PAYMENT_STATUS_ID) REFERENCES PAYMENT_STATUS(ID)
    );

