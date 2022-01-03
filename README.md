## Run SonarQube using docker commands
Before you start SonarQube, we recommend creating volumes to store SonarQube data, logs, temporary data and extensions. If you don't do that, you can loose them when you decide to update to newer version of SonarQube or upgrade to a higher SonarQube edition. Commands to create the volumes: 
```bash
docker volume create --name sonarqube_data
docker volume create --name sonarqube_extensions
docker volume create --name sonarqube_logs
docker volume create --name sonarqube_temp
``` 

After that you can start the SonarQube server:
```bash
docker run -d \
    -v sonarqube_data:/opt/sonarqube/data \
    -v sonarqube_extensions:/opt/sonarqube/extensions \
    -v sonarqube_logs:/opt/sonarqube/logs \
    -v sonarqube_temp:/opt/sonarqube/temp \
    --name="sonarqube" -p 9000:9000 ssarioglu/sonarqube
```
