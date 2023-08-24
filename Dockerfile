# stage de build
FROM golang:1.18-bullseye AS build

WORKDIR /app

COPY go.mod ./

COPY main.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /main

# stage imagem final
FROM scratch

WORKDIR /

COPY --from=build /main /main

EXPOSE 8080

ENTRYPOINT [ "/main" ]