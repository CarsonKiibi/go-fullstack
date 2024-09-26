FROM golang:1.23.1-alpine3.20

WORKDIR /app 

COPY . .

# Download and install dependencies:
RUN go get ./... && go build && go mod download

# Build the go app
RUN go build -o api .

EXPOSE 8000

CMD ["/app/api"]