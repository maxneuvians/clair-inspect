ARG  VERSION=latest

FROM quay.io/coreos/clair:${VERSION}

COPY clair/config.yaml /config/config.yaml

CMD ["-config=/config/config.yaml"]