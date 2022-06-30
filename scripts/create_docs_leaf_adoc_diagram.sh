#!/bin/bash
set -euo pipefail

readonly DOCS_ROOT_DPATH="/documents/content/docs"
readonly ALLOWED_EXTENSION="adoc"

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
  echo "ERROR: 作成するファイルパスを１つ指定してください。" 1>&2
  echo "" 1>&2
  exit 1
fi

readonly TARGET_FPATH=${1}
readonly TARGET_DPATH=${TARGET_FPATH%/*}
readonly TARGET_FNAME=${TARGET_FPATH##*/}
readonly TARGET_EXTENSION=${TARGET_FNAME##*.}

# 引数のファイルパスの拡張子をチェック
if [ "${TARGET_EXTENSION}" != "${ALLOWED_EXTENSION}" ]; then
  echo "" 1>&2
  echo "ERROR: 指定されたファイルパスの拡張子が .adoc ではありません。" 1>&2
  echo "" 1>&2
  exit 1
fi

# 引数のファイルパスのディレクトリが存在することをチェック
if [ ! -d "${TARGET_DPATH}" ]; then
  echo "" 1>&2
  echo "ERROR: 指定されたファイルパスのディレクトリが存在しません。" 1>&2
  echo "" 1>&2
  exit 1
fi

# 引数の指定が絶対パスであることをチェック
if [[ ! "${TARGET_FPATH}" == /* ]]; then
  echo "" 1>&2
  echo "ERROR: ファイルパスの指定は絶対パスとしてください。" 1>&2
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
readonly CMD="hugo new ${CMD_DPATH}/${TARGET_FNAME}"

echo "===== info ====="
echo "DOCS_ROOT_DPATH=${DOCS_ROOT_DPATH}"
echo "TARGET_FPATH=${TARGET_FPATH}"
echo "CMD_DPATH=${CMD_DPATH}"
echo "================"
echo "CREATE_FPATH=${TARGET_FPATH}"
echo "===== cmd  ====="
echo "${CMD}"
eval "${CMD}"
echo "... end."
