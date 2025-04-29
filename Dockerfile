# First Stage: Build
FROM eclipse-temurin:17-jdk as builder

WORKDIR /app
COPY . .
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Second Stage: Run
FROM eclipse-temurin:17-jre

WORKDIR /app
COPY --from=builder /app/target/url-shortener-1.0.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
