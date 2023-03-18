FROM golang:alpine as builder

RUN apk add --no-cache make git
RUN git clone https://github.com/micromdm/scep.git /go/src/github.com/micromdm/scep

WORKDIR /go/src/github.com/micromdm/scep

ENV CGO_ENABLED=0 \
	GOARCH=amd64 \
	GOOS=linux

RUN make

FROM alpine

VOLUME "/depot"

RUN apk --update add ca-certificates curl
COPY --from=builder /go/src/github.com/micromdm/scep/scepclient-linux-amd64 /usr/bin/scepclient
RUN chmod a+x /usr/bin/scepclient

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
