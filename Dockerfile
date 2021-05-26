FROM alpine:3.13.5 as builder

ARG elixir_version

WORKDIR /build

RUN mkdir outputs

RUN wget https://github.com/elixir-lang/elixir/releases/download/${elixir_version}/Precompiled.zip -O /build/outputs/elixir-${elixir_version}.zip 

RUN echo downloaded to /build/outputs/elixir-${elixir_version}.zip

FROM scratch

COPY --from=builder /build/outputs /