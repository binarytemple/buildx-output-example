FROM alpine:3.13.5 as builder

WORKDIR /build

RUN mkdir outputs

RUN wget https://github.com/erlang/otp/releases/download/OTP-23.3.4.1/otp_src_23.3.4.1.tar.gz -O /tmp/otp_src_23.3.4.1.tar.gz

ARG elixir_version

RUN wget https://github.com/elixir-lang/elixir/releases/download/${elixir_version}/Precompiled.zip -O /build/outputs/elixir-${elixir_version}.zip 

RUN echo downloaded to /build/outputs/elixir-${elixir_version}.zip

FROM scratch

COPY --from=builder /build/outputs /
