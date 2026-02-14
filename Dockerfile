# ===========================
# Build Stage
# ===========================
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

# Build the app using Maven directly (no mvnw)
RUN mvn clean package -DskipTests

# ===========================
# Run Stage
# ===========================
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy the built jar
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
