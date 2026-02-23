# Game Docker Local Environment

このリポジトリは、Nginx + PHP8.4 + MySQL8 を使用した  
ローカル開発用 Docker 環境です。

---

## 構成

- Nginx 1.25
- PHP 8.4 (FPM)
- MySQL 8.0（profile指定時のみ起動）
- Docker Compose v2

---

## 起動方法

### ① 通常起動（Webのみ）

```bash
docker compose up -d
