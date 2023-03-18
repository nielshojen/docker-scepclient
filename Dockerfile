FROM alpine

ENV SCEPCLIENT_VERSION="2.1.0"

RUN apk --no-cache add curl
RUN apk --update add ca-certificates
RUN curl -L https://github.com/micromdm/scep/releases/download/v${SCEPCLIENT_VERSION}/scepclient-linux-amd64-v${SCEPCLIENT_VERSION}.zipp -o /scepclient.zip



RUN unzip /scepclient.zip
RUN rm /scepclient.zip
RUN mv /scepclient-linux-amd64 /usr/local/bin/scepclient
RUN chmod a+x /usr/local/bin/scepclient

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
