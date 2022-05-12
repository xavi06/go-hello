FROM golang:1.17 AS builder
WORKDIR /app
COPY . .
RUN go build -o hello main.go

FROM alpine:3.14
WORKDIR /app
COPY --from=builder /app/hello /app/
EXPOSE 8080
ENTRYPOINT ["/app/hello"]
