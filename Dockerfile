# Étape de construction
FROM maven:3.8.5-openjdk-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package -DskipTests

# Étape d'exécution
FROM openjdk:17.0.1-jdk-slim
COPY --from=build /app/target/pfa2021-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
