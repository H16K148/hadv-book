#!/bin/bash
set -euo pipefail

readonly BASE_CMD="asciidoctor-pdf -v -r asciidoctor-diagram -r /documents/asciidoctor/pdf/theme-business-001/prawn-svg-config.rb -a skip-front-matter -a pdf-stylesdir=/documents/asciidoctor/pdf/theme-business-001 -a pdf-style=default-theme.yml -a pdf-fontsdir=/documents/asciidoctor/pdf/fonts,/documents/asciidoctor/pdf/theme-business-001/fonts"
readonly PDF_DPATH="/documents/pdf"
readonly PDF_EXTENSION=".pdf"

# 出力先となる PDF ディレクトリが存在することを確認
if [ ! -d ${PDF_DPATH} ]; then
  echo "" 1>&2
  echo "ERROR: pdf の出力先ディレクトリが存在しません。" 1>&2
  echo "" 1>&2
  exit 1
fi

# 実行時の引数の数をチェック
if [ $# -ne 1 ]; then
  echo "" 1>&2
  echo "ERROR: pdf を出力する adoc ファイルを１つ指定してください。" 1>&2
  echo "" 1>&2
  exit 1
fi

readonly ADOC_FPATH=${1}

# 引数のファイルが存在することをチェック
if [ ! -e "${ADOC_FPATH}" ]; then
  echo "" 1>&2
  echo "ERROR: 指定された adoc ファイルが存在しません。" 1>&2
  echo "" 1>&2
  exit 1
fi

# ファイル名を取得
readonly ADOC_FNAME=${ADOC_FPATH##*/}
# 拡張子を外したベースファイル名を取得
#readonly EXPORT_FNAME_BASE=${ADOC_FNAME%.*}
EXPORT_FNAME_BASE=${ADOC_FPATH%/*.adoc}
if [ "${ADOC_FNAME}" != "index.adoc" ]; then
  EXPORT_FNAME_BASE=${ADOC_FPATH%.*}
fi
EXPORT_FNAME_BASE=${EXPORT_FNAME_BASE##/documents/content/}
EXPORT_FNAME_BASE=${EXPORT_FNAME_BASE////_}
# 出力ファイルパス
readonly EXPORT_FPATH="${PDF_DPATH}/${EXPORT_FNAME_BASE}${PDF_EXTENSION}"

# 出力先の PDF ディレクトリに同名ファイルが存在するかチェック
if [ -e "${EXPORT_FPATH}" ]; then
  echo ""
  read -p "出力先の PDF ディレクトリに同名ファイルが存在します。上書きしますか？ (y/N): " yn
  case "$yn" in
    [yY]*) echo "";echo "→  上書きします。";rm -rf "${EXPORT_FPATH}";echo "";;
    *) echo "";echo "→  終了します。";echo "";exit 0;;
  esac
fi

# コマンド組み立て
readonly CMD="${BASE_CMD} ${ADOC_FPATH} -o ${EXPORT_FPATH}"

echo "===== info ====="
echo "BASE_CMD=${BASE_CMD}"
echo "PDF_DPATH=${PDF_DPATH}"
echo "PDF_EXTENSION=${PDF_EXTENSION}"
echo "ADOC_FPATH=${ADOC_FPATH}"
echo "ADOC_FNAME=${ADOC_FNAME}"
echo "EXPORT_FNAME_BASE=${EXPORT_FNAME_BASE}"
echo "================"
echo "EXPORT_FPATH=${EXPORT_FPATH}"
echo "===== cmd  ====="
echo "${CMD}"
eval "${CMD}"
echo "... end."
