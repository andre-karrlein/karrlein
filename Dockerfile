FROM debian:latest AS flutter

RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

RUN /usr/local/flutter/bin/flutter doctor -v
ENV PATH="usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:$"

RUN flutter channel beta
RUN flutter upgrade
RUN flutter config --enable-web

COPY . /code
WORKDIR /code
RUN /usr/local/flutter/bin/flutter build web

FROM golang as builder

COPY server.go /go/build/server.go
WORKDIR /go/build/

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .

FROM alpine:3.10

RUN mkdir /code
WORKDIR /code

COPY --from=builder /go/build/server /code/server
COPY --from=flutter /code/build/web /code

EXPOSE 8080

CMD ["/code/server"]
