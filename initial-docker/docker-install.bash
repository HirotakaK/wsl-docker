#!/usr/bin/env bash

set -e

echo "=============================="
echo " Docker Install Script (WSL2)"
echo " Ubuntu 24.04 / Noble"
echo "=============================="

# 0) SUDOチェック
if [ "$EUID" -ne 0 ]; then
    echo "このスクリプトは sudo で実行してください:"
    echo "  sudo bash docker-install.sh"
    exit 1
fi

# 1) 古い Docker の残骸削除
echo "[1/6] 古い Docker / containerd の削除..."
apt remove -y docker docker-engine docker.io containerd runc || true

# 2) 必要パッケージ
echo "[2/6] 必須パッケージインストール..."
apt update -y
apt install -y ca-certificates curl gnupg lsb-release

# 3) GPG Key & Repo
echo "[3/6] Docker の公式 GPG キーを追加..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "[4/6] Docker APT リポジトリを追加..."
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release; echo $VERSION_CODENAME) stable" \
  > /etc/apt/sources.list.d/docker.list

# 4) Docker Engine インストール
echo "[5/6] Docker Engine をインストール..."
apt update -y
apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# 5) Docker グループにユーザーを追加
USER_NAME=$(logname)
echo "[6/6] ユーザー '${USER_NAME}' を docker グループに追加..."
usermod -aG docker "$USER_NAME"

echo "=============================="
echo " Docker のインストールが完了しました！"
echo " WSL 全体を再起動します:"
echo ""
echo "  wsl --shutdown"
echo ""
echo "その後、再度 Ubuntu を起動し、次を実行して確認してください:"
echo "  docker run hello-world"
echo "=============================="
