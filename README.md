# Desafio GO

## Imagem

A imagem foi criada por meio de stages, o primeiro stage foi baseado em:
```
# stage de build
FROM golang:alpine AS build

WORKDIR /app

COPY go.mod ./

COPY main.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /main

```

O segundo stage foi baseado em:
```
# stage imagem final
FROM scratch

WORKDIR /

COPY --from=build /main /main

EXPOSE 8080

ENTRYPOINT [ "/main" ]
```

Nome da imagem é: alcantaraafonso/go:prod
- https://hub.docker.com/repository/docker/alcantaraafonso/fullcycle/general

## Build
docker build -t alcantaraafonso/fullcycle .

## Run
docker run -d -p 8080:8080 alcantaraafonso/fullcycle

## Porta
A porta exposta pela imgem é: 8080

## Execução
O resultado pode ser obtido da seguinte forma:
curl http://localhost:8080