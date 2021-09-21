FROM golang:1.16-alpine

WORKDIR /app

COPY go.mod .

COPY . .

RUN go build -o /docker-golang

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /docker-golang /docker-golang

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT [ "/docker-golang ]