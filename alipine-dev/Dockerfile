FROM alpine:latest

# 基本コマンドインストール
RUN apk update && apk add --no-cache \
    bash \
    curl \
    git \
    zip \
    unzip \
    jq

# yq (Go版) のインストール
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

# デフォルトは bash 起動
CMD ["bash"]
