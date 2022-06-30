#!/bin/bash
set -euo pipefail

readonly DOCS_ROOT_DPATH="/documents/content/docs"

# コンテンツのルートディレクトリが存在することを確認
if [ ! -d ${DOCS_ROOT_DPATH} ]; then
  echo "" 1>&2
  echo "ERROR: コンテンツのルートディレクトリが存在しません。" 1>&2
  echo "" 1>&2
  exit 1
fi

# 実行時の引数の数をチェック
if [ $# -ne 1 ]; then
  echo "" 1>&2
  echo "ERROR: 作成するリーフバンドルのディレクトリパスを１つ指定してください。" 1>&2
  echo "" 1>&2
  exit 1
fi

readonly TARGET_DPATH=${1%/}

# 引数のディレクトリが存在しないことをチェック
if [ -d "${TARGET_DPATH}" ]; then
  echo "" 1>&2
  echo "ERROR: 指定されたディレクトリパスが既に存在します。" 1>&2
  echo "" 1>&2
  exit 1
fi

# 引数の指定が絶対パスであることをチェック
if [[ ! "${TARGET_DPATH}" == /* ]]; then
  echo "" 1>&2
  echo "ERROR: ディレクトリパスの指定は絶対パスとしてください。" 1>&2
  echo "" 1>&2
  exit 1
fi

# 引数がコンテンツのルートディレクトリ配下であることをチェック
if [[ ! "${TARGET_DPATH}" == "${DOCS_ROOT_DPATH}/"* ]]; then
  echo "" 1>&2
  echo "ERROR: パスの指定先はコンテンツのルートディレクトリ配下としてください。" 1>&2
  echo "" 1>&2
  exit 1
fi

# コマンド用ファイルパスを用意
readonly CMD_DPATH="docs${TARGET_DPATH/$DOCS_ROOT_DPATH/}"

# コマンド組み立て
readonly CMD="hugo new ${CMD_DPATH} -k docs-branch"

echo "===== info ====="
echo "DOCS_ROOT_DPATH=${DOCS_ROOT_DPATH}"
echo "TARGET_DPATH=${TARGET_DPATH}"
echo "CMD_DPATH=${CMD_DPATH}"
echo "================"
echo "CREATE_FPATH=${TARGET_DPATH}/_index.md"
echo "===== cmd  ====="
echo "${CMD}"
eval "${CMD}"
echo "... end."
