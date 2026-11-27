# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Copy only the pom first, so dependencies are cached as their own layer
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Now copy the sources and build the jar (tests already run in CI)
COPY src ./src
RUN mvn -B package -DskipTests && ls -la target

# Stage 2: Runtime
FROM eclipse-temurin:17-jre
WORKDIR /app

# Run as a non-root user
RUN useradd --system --no-create-home appuser
USER appuser

COPY --from=build /app/target/ci-cd-uebung-1.0.0.jar /app/app.jar

# No Main-Class in the manifest, so start via classpath + fully qualified class name
ENTRYPOINT ["java", "-cp", "/app/app.jar", "com.example.cicd.App"]
