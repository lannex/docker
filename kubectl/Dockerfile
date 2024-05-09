FROM bitnami/kubectl as kubectl

FROM alpine:3

RUN apk add --no-cache aws-cli
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl

ENV KUBECONFIG /root/.kube/config
ENV AWS_CONFIG_FILE /root/.aws/config

WORKDIR /root
