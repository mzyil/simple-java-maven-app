FROM openjdk:11.0.9-jre-slim
ARG JAR_FILE_NAME
COPY target/$JAR_FILE_NAME /usr/jar/$JAR_FILE_NAME
ENV JAR_FILE_NAME=$JAR_FILE_NAME
CMD java -jar /usr/jar/$JAR_FILE_NAME; cat
