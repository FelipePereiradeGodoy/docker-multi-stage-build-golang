FROM golang:alpine AS builder

WORKDIR /app

COPY main.go /app

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -o goApp main.go


FROM scratch

WORKDIR /app

COPY --from=builder /app/goApp ./

CMD ["./goApp"]
