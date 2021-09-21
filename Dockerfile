FROM golang:1.16-alpine as build

WORKDIR /app

COPY go.mod .

COPY . .

RUN go build -o /docker-golang

FROM alpine

COPY --from=build /docker-golang /docker-golang

EXPOSE 8080

ENTRYPOINT [ "/docker-golang" ]