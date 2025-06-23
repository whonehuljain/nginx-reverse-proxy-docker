FROM golang:1.23 AS builder

WORKDIR /app

COPY main.go .

RUN go mod init service-1 && go mod tidy

RUN GOOS=linux go build -o go-server main.go

EXPOSE 8001

CMD [ "./go-server" ]