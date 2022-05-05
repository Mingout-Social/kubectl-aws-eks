FROM amazon/aws-cli:latest

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.22.0/bin/linux/amd64/kubectl && \
    curl -sL -o /usr/bin/aws-iam-authenticator $(curl -s https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases/latest | jq -r ' .assets[] | select(.name | contains("linux_amd64")    )' | jq -r '.browser_download_url')  && \
    chmod +x /usr/bin/aws-iam-authenticator && \
    chmod +x /usr/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
