
insert into BANK_USER (LOGIN, USER_PASSWORD, FIRST_NAME, LAST_NAME) values ('TP8', 'TP8','RAYMOND', 'STOCKHOLM');
insert into BANK_USER (LOGIN, USER_PASSWORD, FIRST_NAME, LAST_NAME) values ('EGD', 'EGD','BERTRAND', 'AVE');
insert into BANK_USER (LOGIN, USER_PASSWORD, FIRST_NAME, LAST_NAME) values ('PLO', 'PLO','PHILIPPE', 'LOUIS');
insert into BANK_USER (LOGIN, USER_PASSWORD, FIRST_NAME, LAST_NAME) values ('NHU', 'NHU','NICOLAS', 'HUET');

-- BANK_USER ID=1 => TP8
-- BANK_USER ID=2 => EGD
insert into PAYEE (ACCOUNT, NAME, ADDRESS, OWNER_ID) values ('COMPTE_1', 'STOCKHOLM','2 RUE ALAIN FOURNIER', 1);
insert into PAYEE (ACCOUNT, NAME, ADDRESS, OWNER_ID) values ('COMPTE_2', 'STOCKHOLM','2 RUE ALAIN FOURNIER', 1);
insert into PAYEE (ACCOUNT, NAME, ADDRESS, OWNER_ID) values ('COMPTE_1', 'AVE','LUXEMBOURG', 2);