#!/bin/bash
set -e

BRANCH_NAME="$1"

if [ -z "$BRANCH_NAME" ]; then
  echo "使い方: ./deploy.sh <branch-name>"
  exit 1
fi

BASE_DIR="../app"

case "$BRANCH_NAME" in
  master)
    TARGET_DIR="$BASE_DIR/live"
    ;;
  develop)
    TARGET_DIR="$BASE_DIR/test"
    ;;
  feature/*)
    FEATURE_NAME="${BRANCH_NAME#feature/}"
    TARGET_DIR="$BASE_DIR/feature/$FEATURE_NAME"
    ;;
  *)
    echo "対象外ブランチ: $BRANCH_NAME"
    exit 0
    ;;
esac

echo "🚀 Deploy start"
echo "  branch : $BRANCH_NAME"
echo "  target : $TARGET_DIR"

mkdir -p "$TARGET_DIR"

rsync -av --delete ../src/ "$TARGET_DIR/"

echo "✅ Deploy finished"
