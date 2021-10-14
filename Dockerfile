FROM maven:latest
RUN useradd -m -d /home/app -s /bin/bash app && \
    mkdir -p /app
WORKDIR /app
ADD --chown=app:app ./target/jb-hello-world-maven-*.jar jb-hello-world-maven.jar
ADD --chown=app:app entry.sh entry.sh
USER app
ENTRYPOINT [ "/app/entry.sh" ]
