FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

# Install dependencies for installing mssql-tools
RUN apt-get update \
    && apt-get install -y gnupg \
    && apt-get -y install curl

# adding custom MS repository
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

# Install SQL Server Tools
RUN apt-get update 
RUN apt-get -y install mssql-tools 
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN #!/bin/bash source ~/.bashrc

# copy over initialization scripts that create our sql databases
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./entrypoint.sh /usr/src/app
COPY ./run-initialization.sh /usr/src/app

# set permissions allowing the shell script to be executed
RUN chmod +x /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/run-initialization.sh

# expose the default mssql port from the container
EXPOSE 1433

USER mssql

# override Dockerfile CMD entry from base image (which runs SQL server), with our own CMD command, which runs our custom script:
CMD ["/bin/bash", "./entrypoint.sh"]