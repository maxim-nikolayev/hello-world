FROM golang:1.23-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o hello-world

FROM alpine:latest

COPY --from=builder /app/hello-world /usr/local/bin/hello-world

EXPOSE 8080

CMD [ "hello-world" ]