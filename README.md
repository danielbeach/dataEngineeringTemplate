# dataEngineeringTemplate
Template for Data Engineering and Data Pipeline projects

## Project Overview
This is a high level description of the project, what it is trying to accomplish.
1. Add your requirements to the `requirements.txt` file for Python pip packages.
2. Add any nessesary installations to the Dockerfile.

## Architecture
This is a high level description of the tool(s) and decisions around why those tool(s) were choosen.

## Testing
This is instructions on how to test this repo. All tests are located inside the `tests` folder. We are using `pytest`.
Run the following steps.

1. docker build --tag my-project .
2. `docker-compose up test`

Add your unit tests to files inside the `tests` folder ... name your files `test_somename.py`

## Data Flow
High level description of data source(s) and sink(s), as well as the general pattern and data flow through the pipeline.
Discuss any assumptions made.

## Environment
Compose supports declaring default environment variables in an environment file named .env placed in the project directory.

The following syntax rules apply to the .env file:

- Compose expects each line in an env file to be in VAR=VAL format.
- Lines beginning with # are processed as comments and ignored.
- Blank lines are ignored.
- There is no special handling of quotation marks. This means that they are part of the VAL.

## Database
For persisting data into SQL, a sql container using an external volume allows
for the database container to restart without losing data. 

The database is added to a bridge network where other hosts on the network can 
reach the database.

`docker network create test-network`

Start a PostgreSQL database

`docker volume create postgres-volume`
`docker-compose -f psql.yml up --build -d`

Start a SQL Server database

`docker volume create mssql-volume`
`docker-compose -f mssql.yml up --build -d`