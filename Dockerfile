FROM golang:latest

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go get github.com/Sanjungliu/docker-golang
RUN cd /build && git clone https://github.com/Sanjungliu/docker-golang.git

RUN cd /build/docker-golang && go build

EXPOSE 8080

RUN GO MOD INIT github.com/Sanjungliu/docker-golang

ENTRYPOINT [ "/build/docker-golang" ]