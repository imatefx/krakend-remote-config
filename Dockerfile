FROM alpine:3.9

LABEL maintainer="letter2stalin@gmail.com"

WORKDIR /app

RUN apk add --no-cache ca-certificates curl

COPY --from=devopsfaith/krakend /usr/bin/krakend /app

CMD curl $KRAKEND_CONFIG_URL --output krakend.json && ./krakend run -c ./krakend.json -d

EXPOSE 8000 8090
