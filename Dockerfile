# Use an official Java 17 image
FROM eclipse-temurin:17-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy Maven wrapper and project files
COPY . .

# Give permission to mvnw
RUN chmod +x mvnw

# Build the project
RUN ./mvnw clean package -DskipTests

# Expose port (IMPORTANT: Railway expects app to listen on $PORT)
EXPOSE 8080

# Run the jar
CMD ["java", "-jar", "target/url-shortener-1.0.0.jar"]
