FROM golang AS builder

WORKDIR /app

COPY hello.go ./

RUN go mod init example/hello && \
    go mod download && \
    go build

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello /app

ENTRYPOINT ["./hello"]