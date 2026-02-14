# ===========================
# Build Stage
# ===========================
FROM maven:3.9.9-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Build the app and skip tests for faster builds
RUN mvn clean package -DskipTests

# ===========================
# Run Stage
# ===========================
FROM eclipse-temurin:17-jre

# Set working directory
WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your app listens on
EXPOSE 8080

# Command to run the app
CMD ["java", "-jar", "app.jar"]
