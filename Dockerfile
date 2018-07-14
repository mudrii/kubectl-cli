FROM alpine:latest

# Kubectl version https://github.com/kubernetes/kubernetes/releases

ENV KUBE_VERSION v1.11.0

RUN apk --no-cache update && \
    apk --no-cache add \
    curl \
    ca-certificates \
    jq && \
    curl https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl --output /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apk --purge del curl && \
    rm /var/cache/apk/*