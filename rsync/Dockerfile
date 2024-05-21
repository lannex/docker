# Base image
FROM alpine:3

RUN apk update && \
    apk add --no-cache rsync

WORKDIR /

COPY sync.sh sync.sh

RUN chmod +x sync.sh

ENV SOURCE_DIR="/src"
ENV DEST_DIR="/dest"
ENV SLEEP=5

CMD ["/sync.sh"]

