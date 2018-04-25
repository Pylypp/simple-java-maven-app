FROM openjdk

COPY target/my-app-1.0-SNAPSHOT.jar /opt/my-app-1.0-SNAPSHOT.jar

CMD java -jar /opt/my-app-1.0-SNAPSHOT.jar
