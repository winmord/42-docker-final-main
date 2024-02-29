FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go *.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /42-docker-final-main

CMD ["/42-docker-final-main"]