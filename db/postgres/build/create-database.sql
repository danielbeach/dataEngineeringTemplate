	CREATE DATABASE test_database;

	CREATE ROLE testadmin WITH PASSWORD 'm4k3rb0t#' LOGIN;

	GRANT ALL PRIVILEGES ON DATABASE test_database TO testadmin;

