#Build stage
FROM golang:alpine AS build-env
ENV GOOS linux
ENV GOARCH amd64
WORKDIR /src
COPY main.go .
RUN GO111MODULE=off CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} go build -a -o server

# Final
FROM ubuntu
ENV PORT 8888
CMD ["./server"]
EXPOSE $PORT
