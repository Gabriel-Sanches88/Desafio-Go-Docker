FROM golang:alpine3.14 as builder

WORKDIR /app

COPY . .

RUN go build -o /docker docker.go


## Deploy
FROM scratch

WORKDIR /

COPY --from=builder /docker /docker

ENTRYPOINT ["/docker"]