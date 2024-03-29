FROM store/intersystems/iris:2019.2.0.107.0-community
#Install git
RUN apt-get update && apt-get install -y git
RUN mkdir /opt/app
WORKDIR /opt/app
# Name of the project folder ex.: irisdemo-atelier-project
ARG IRIS_PROJECT_FOLDER_NAME=/opt/app/

# Used to specify a folder on the container with the source code (csp pages, classes, etc.)
# to load into the application.
ENV IRIS_APP_SOURCEDIR=/opt/app/UKPartnerDay2019

# Name of the application. This will be used to define the namespace, database and 
# name of the CSP application of this application.
ENV IRIS_APP_NAME="Demo"

# Used by runinstaller.sh to load the installer manifest class and run it
ENV IRIS_USERNAME="SuperUser" 

# Used by runinstaller.sh and to set instance's default password (this is just a demo!)
ENV IRIS_PASSWORD="SYS"
#Pull Code
RUN git clone https://github.com/sauravgupta/UKPartnerDay2019
RUN echo "$IRIS_PASSWORD" >> /tmp/pwd.isc && /usr/irissys/dev/Cloud/ICM/changePassword.sh /tmp/pwd.isc
RUN ["chmod", "+x", "/opt/app/UKPartnerDay2019/Installer.sh"]
RUN /opt/app/UKPartnerDay2019/Installer.sh
