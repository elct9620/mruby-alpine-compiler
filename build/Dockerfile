FROM i386/alpine:3.4

ENV MRUBY_PATH /mruby
ENV MRUBY_VERSION 1.2.0

RUN apk add --no-cache gcc g++ ruby make alpine-sdk bison abuild binutils git
RUN apk add --no-cache ca-certificates

COPY ./build.sh /bin/build.sh

RUN mkdir /build && \
    mkdir -p /build/dest && \
    mkdir -p /build/bin && \
    mkdir /mruby && \

    # Prepare MRUBY
    cd /mruby && \
    git clone https://github.com/mruby/mruby.git . && \
    git checkout ${MRUBY_VERSION} && \
    ./minirake && \

    chmod +x /bin/build.sh

COPY ./main.c /build/main.c

VOLUME ["/build/bin"]

ENTRYPOINT ["/bin/build.sh"]
