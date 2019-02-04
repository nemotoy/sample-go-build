FROM golang AS builder
ADD . /work
WORKDIR /work
RUN go build -o app

FROM alpine:latest
WORKDIR /root
RUN apk --no-cache add ca-certificates
COPY --from=builder /work/app /usr/local/bin/
ENTRYPOINT app
