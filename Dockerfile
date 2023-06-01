FROM golang:1.20 as base

WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code.
COPY *.go ./

# build the go app
RUN CGO_ENABLED=0 GOOS=darwin go build -o /docker-gs-ping

# expose port for API
EXPOSE  8080

# run the webserver
CMD ["go run api/main.go"]
