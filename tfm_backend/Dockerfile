FROM openjdk:17-jdk-slim
ARG JAR_FILE=target/inventario-backend-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} inventario-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "inventario-backend.jar"]