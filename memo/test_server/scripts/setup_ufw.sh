#!/bin/bash
set -e

# ======================================
# UFW 初期セットアップ（最小・安全）
# ======================================

echo "=== UFW setup start ==="

# UFW が無ければインストール
if ! command -v ufw >/dev/null 2>&1; then
  apt update
  apt install -y ufw
fi

# デフォルトポリシー
ufw default deny incoming
ufw default allow outgoing

# SSH（ポート変更済み想定）
ufw allow 50122/tcp comment 'SSH'

# HTTP / HTTPS（Nginx）
ufw allow 80/tcp comment 'HTTP'
ufw allow 443/tcp comment 'HTTPS'

# MySQL（例：ローカル or 特定IPのみ）
# ufw allow from 127.0.0.1 to any port 53306 comment 'MySQL local'

# UFW 有効化
ufw --force enable

echo "=== UFW setup completed ==="
ufw status verbos
