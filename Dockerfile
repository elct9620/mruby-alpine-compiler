FROM alpine:3.4

COPY ./bin/entrypoint /usr/local/bin

ENTRYPOINT ["entrypoint"]
