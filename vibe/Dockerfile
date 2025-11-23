FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# ---------------------------------------------------
# 基本ツール
# ---------------------------------------------------
RUN apt update && apt install -y \
    curl \
    wget \
    git \
    zip \
    unzip \
    jq \
    gnupg \
    build-essential \
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    zlib1g-dev \
    libffi-dev \
    make \
    ca-certificates \
    python3 \
    python3-pip \
    software-properties-common

# ---------------------------------------------------
# yq (Go版)
# ---------------------------------------------------
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
    -O /usr/local/bin/yq && chmod +x /usr/local/bin/yq

# ---------------------------------------------------
# Node.js (Claude Code / Anthropic SDK 用)
# ★ Node 22.x と明記 ★
# ---------------------------------------------------
ENV NODE_MAJOR=22
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_MAJOR}.x | bash - && \
    apt install -y nodejs

# Node バージョン確認
RUN node -v && npm -v

# ---------------------------------------------------
# Claude Code（Anthropic 公式 Node SDK）
# ---------------------------------------------------
RUN curl -fsSL https://claude.ai/install.sh | bash
# Claude Code の Vertex AI モード
ENV CLAUDE_CODE_USE_VERTEX=1
ENV CLOUD_ML_REGION=global
ENV ANTHROPIC_VERTEX_PROJECT_ID=trading-3986

# ---------------------------------------------------
# Google Cloud SDK（gcloud CLI）
# ---------------------------------------------------
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
    | tee /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    apt update && apt install -y google-cloud-sdk

# ---------------------------------------------------
# pyenv インストール
# ---------------------------------------------------
ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

RUN git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT

# ---------------------------------------------------
# Python 3.13 インストール（pyenv）
# ---------------------------------------------------
RUN pyenv install 3.13.0 && \
    pyenv global 3.13.0

# ---------------------------------------------------
# uv（Python 高速パッケージマネージャ）
# ---------------------------------------------------
RUN curl -LsSf https://astral.sh/uv/install.sh | bash
ENV PATH="/root/.local/bin:$PATH"

# ---------------------------------------------------
# Python 仮想環境（Claude Code の Python 実行用）
# ---------------------------------------------------
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip

ENV VIRTUAL_ENV="/opt/venv"
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# ---------------------------------------------------
# 作業ディレクトリ
# ---------------------------------------------------
WORKDIR /workspace

CMD ["bash"]
