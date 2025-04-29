FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY url-shortener-1.0.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
