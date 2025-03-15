FROM golang:1.21.0-alpine AS builder

WORKDIR /build
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o adr-tools *.go

FROM alpine:edge
COPY --from=builder ["/build/adr-tools", "/bin/adr-tools"]
