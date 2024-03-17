#SonarQube Document

 - Code coverage : its a percentage of code which is already been tested preferrably 80%

 -Quality check :it checks the bugs,vunerability checks , code smell

#sonarqube has 2 versions : community version and developer version

docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
/which will install the sonarqube on the docker container 

/open the browser and access to sonarqube on port 9000 default cred is admin & admin

in the GUI console where we can add rules and quality gate conditions as well