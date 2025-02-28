FROM apache/nifi:latest

# Download the PostgreSQL JDBC driver (version 42.6.0)
RUN curl -L -o /opt/nifi/nifi-current/lib/postgresql-42.6.0.jar \
    https://repo1.maven.org/maven2/org/postgresql/postgresql/42.6.0/postgresql-42.6.0.jar
