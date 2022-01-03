FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget openjdk-11-jdk unzip
RUN wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.1.0.47736.zip
RUN unzip sonarqube-9.1.0.47736.zip
RUN mv sonarqube-9.1.0.47736 sonarqube
RUN mv sonarqube /opt/
RUN groupadd sonar
RUN useradd -d /opt/sonarqube -g sonar sonar
RUN chown sonar:sonar /opt/sonarqube -R

RUN sed -i 's/^#RUN_AS_USER=$/RUN_AS_USER=sonar/' /opt/sonarqube/bin/linux-x86-64/sonar.sh

EXPOSE 9000
ENTRYPOINT ["/opt/sonarqube/bin/linux-x86-64/sonar.sh"]
CMD ["console"]
