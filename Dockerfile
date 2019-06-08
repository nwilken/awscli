FROM alpine:3.9
LABEL maintainer="Nate Wilken <wilken@asu.edu>"

RUN apk update \
 && apk add --no-cache bash less curl jq python groff \
 && apk add --no-cache --virtual .build-deps py-pip \
 && pip install --no-cache-dir --upgrade pip awscli s3cmd \
 && apk del --purge --no-cache .build-deps \
 && rm -rf /root/.cache
