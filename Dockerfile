FROM alpine:3.9

LABEL maintainer="letter2stalin@gmail.com"

WORKDIR /app

RUN apk add --no-cache ca-certificates curl tar

COPY --from=devopsfaith/krakend /usr/bin/krakend /app

CMD curl $KRAKEND_CONFIG_URL --output krakend.json && curl $ASSETS_URL --output assets.tar.gz && tar -xzvf assets.tar.gz -C ./ && ./krakend run -c ./krakend.json -d

EXPOSE 80 443 8080 8090
