FROM maven as build 
WORKDIR /app
COPY . .
copy pom.xml /app
RUN mvn -f /app/pom.xml clean package


FROM tomcat:9.0 
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
ENTRYPOINT ["catalina.sh", "run"]

