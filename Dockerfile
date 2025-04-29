FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

CMD ["java", "-jar", "target/url-shortener-1.0.0.jar"]
