IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = 'TEST_DATABASE')
create database TEST_DATABASE;
GO

use TEST_DATABASE;
GO
