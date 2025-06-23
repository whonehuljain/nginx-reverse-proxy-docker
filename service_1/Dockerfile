FROM golang:1.23

WORKDIR /app

COPY main.go .

RUN go mod init service-1 && go mod tidy

RUN go build -o go-server main.go

EXPOSE 8001

CMD ["./go-server"]
