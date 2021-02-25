FROM alpine:3.13.1 as builder

ENV PATH="/root/.cargo/bin:/.cargo/bin:$PATH"

RUN apk update &&\
    apk add alpine-sdk

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf &&\
    cargo install --git https://github.com/Fluidex/plonkit

FROM alpine:3.13.1

COPY --from=builder /root/.cargo/bin/plonkit /bin/

RUN plonkit --version
