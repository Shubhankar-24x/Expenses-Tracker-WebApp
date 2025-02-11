# Stage 1 - Build the JAR file
FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

COPY . .

# Create JAR File
RUN mvn clean install -DskipTests=true

# Stage 2 - Execute JAR File 

FROM openjdk:17-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar expenseapp.jar

CMD ["java", "-jar", "expenseapp.jar"]