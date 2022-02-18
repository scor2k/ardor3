FROM amazoncorretto:11.0.13-alpine3.14

LABEL maintainer="scor2k <scor2k@gmail.com>"

ENV ARDRversion="3.0.0e"

RUN \
  apk update && \
  apk add ca-certificates && \
  update-ca-certificates && \
  apk add openssl curl && \
  wget https://www.jelurida.com/ardor-client-experimental.zip -O /root/ardor.zip && \
  cd / && \
  unzip -o /root/ardor.zip && \
  cd /ardor && \
  rm -rf *.exe src && \
  chmod +x run.sh && \
  mkdir /ardor/nxt_test_db

WORKDIR /ardor
VOLUME [ "/ardor/nxt_test_db" ]
EXPOSE 16874 16876

HEALTHCHECK --interval=1m --timeout=5s \
  CMD curl -f "http://localhost:16876/nxt?requestType=getState" || exit 1

CMD ["./run.sh", "--desktop"]

