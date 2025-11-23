# ===========================
# ① 基本アップデート
# ===========================
sudo apt update && sudo apt upgrade -y

# ===========================
# ② 基本ユーティリティ
# ===========================
sudo apt install -y \
    curl \
    git \
    unzip \
    zip \
    nano \
    ca-certificates

# ===========================
# ③ 日本語ロケール
# ===========================
sudo apt install -y language-pack-ja
sudo update-locale LANG=ja_JP.UTF-8

# ===========================
# ④ タイムゾーン（日本）
# ===========================
sudo timedatectl set-timezone Asia/Tokyo

# タイムゾーン + 現在時刻確認（追加版）
timedatectl | grep -E "Time zone|Local time"

# ===========================
# ⑤（任意）便利コマンド
# ===========================
sudo apt install -y \
    jq \
    tree \
    fzf

# ===========================
# GitHub CLI
# ===========================

git config --global user.email "caealeajactaest@gmail.com"
git config --global user.name "Kikushima Hirotaka"

# ===========================
# GitHub CLI
# ===========================
type -p curl >/dev/null || sudo apt install curl -y

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
  sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | \
  sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update
sudo apt install gh -y
