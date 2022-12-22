FROM golang:1.19.4-alpine AS builder

WORKDIR /app

COPY . .

RUN go env -w GO111MODULE=auto
RUN go get -d -v
RUN go build run.go

FROM scratch

COPY --from=builder /app /app

ENTRYPOINT [ "/app/run" ]