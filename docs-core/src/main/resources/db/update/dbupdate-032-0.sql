-- DBUPDATE-032-0.SQL

-- Force enable guest login for existing databases
update T_CONFIG set CFG_VALUE_C = 'true' where CFG_ID_C = 'GUEST_LOGIN';

-- Update the database version
update T_CONFIG set CFG_VALUE_C = '32' where CFG_ID_C = 'DB_VERSION';
