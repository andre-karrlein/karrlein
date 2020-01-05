FROM golang as builder

COPY server.go /go/build/server.go
WORKDIR /go/build/

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .

FROM alpine:3.10

RUN mkdir /code
WORKDIR /code

COPY --from=builder /go/build/server /code/server
COPY build/web /code

EXPOSE 8080

CMD ["/code/server"]
