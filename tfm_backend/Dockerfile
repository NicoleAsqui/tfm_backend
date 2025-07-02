# Stage 1: Build the jar with Maven
FROM maven:3.8.4-openjdk-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src/ src/
RUN mvn clean package -DskipTests

# Stage 2: Run the jar
FROM openjdk:17-jdk-slim
WORKDIR /app
ARG JAR_FILE=target/inventario-backend-0.0.1-SNAPSHOT.jar
COPY --from=builder /app/${JAR_FILE} inventario-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "inventario-backend.jar"]