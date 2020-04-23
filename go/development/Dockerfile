FROM golang:1.14.2-buster

WORKDIR /go/src/github.com/jhmachado/app

COPY . .

EXPOSE 9000

RUN ["go", "get", "github.com/githubnemo/CompileDaemon"]

ENTRYPOINT CompileDaemon -log-prefix=false -directory=./ -command="./app"
