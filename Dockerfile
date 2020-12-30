FROM openjdk:11-alpine
ARG JAR_FILE_NAME
COPY target/$JAR_FILE_NAME /usr/jar/$JAR_FILE_NAME
CMD ["java", "-jar", "/usr/jar/$JAR_FILE_NAME"]
