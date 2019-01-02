FROM alpine:latest

RUN deluser guest ; delgroup users
RUN addgroup -g 985 -S users
RUN adduser -S -G users -u 1000 -s /bin/sh -h /home/mudrii mudrii

# Kubectl version https://github.com/kubernetes/kubernetes/releases
ENV KUBE_VERSION v1.13.1

RUN apk --no-cache update && \
    apk --no-cache add \
    curl \
    ca-certificates \
    jq && \
    curl https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl --output /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apk --purge del curl

USER mudrii
