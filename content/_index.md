---
###### Hugo Predefined
###### https://gohugo.io/content-management/front-matter/
#aliases:       # Set on each page
#audio:         # Set on each page
#date: '{{ .Date }}'
#description:   # Set on each page
#draft: true
#expiryDate:    # Set on each page 
#headless:      # Set on each page
#images:        # Set on each page
#isCJKLanguage: true
#keywords:
#  - hadv
#layout:        # Set on each page
#lastmod:       # Set on each page
#linkTitle:     # Set on each page
#markup:        # Set on each page
#outputs:       # Set on each page
#publishDate:   # Set on each page
#resources:     # Set on each page
#series:        # Set on each page
#slug:          # Set on each page
#summary:       # Set on each page
title: HOME
type: docs
#url:           # Set on each page
#videos:        # Set on each page
#weight:        # Set on each page
## <taxonomies>
#categories: []
#tags: []
###### Hugo Book Theme Defined
###### https://themes.gohugo.io/hugo-book/
## See /content/docs/_index.md
## (Optional) Set to 'true' to mark page as flat section in file-tree menu (if BookMenuBundle not set)
#bookFlatSection: false
## (Optional) Set to hide nested sections or pages at that level. Works only with file-tree menu mode
#bookCollapseSection: false
## (Optional) Set true to hide page or section from side menu (if BookMenuBundle not set)
#bookHidden: false
## (Optional) Set 'false' to hide ToC from page
#bookToC: true
## (Optional) If you have enabled BookComments for the site, you can disable it for specific pages.
#bookComments: false
## (Optional) Set to 'false' to exclude page from search index.
#bookSearchExclude: true
---

# hadv-book を始めましょう

ここは hadv-book のトップページ（content/_index.md）です。  
ここを書き換えて、プロジェクト・サイトのホームページとします。

## hadv-book の紹介

{{< columns >}}
### かんたん環境構築

hadv-book は、簡単に開始できます。  
Windows に WSL2 を使用した
[Docker Desktop](https://www.docker.com/products/docker-desktop) と 
[VScode](https://code.visualstudio.com/) と 
[Git](https://git-scm.com/) さえあれば他に何もいりません。  
いまご覧になっているページをすぐに手元に再現できます。  
使い方は [Usage]({{< ref "/docs/usage/" >}}) にまとめました！
<--->
### AsciiDoc 対応

めんどうな [Asciidoctor](https://asciidoctor.org/) のインストールも不要です。  
Asciidoctor の公式 Docker イメージを使ってビルドをしますので、Windows 環境も汚しません。  
最新版への対応も簡単です、Docker イメージのバージョンを上げるだけ！
{{< /columns >}}

{{< columns >}}
### Theme について

hadv-book は、[Hugo Book Theme](https://themes.gohugo.io/hugo-book/) （[commit](https://github.com/alex-shpak/hugo-book/commit/50147be131a5e4cb1bc7aa6b49001842edcadf87)）をカスタマイズして使用しています。  
もちろん Book 以外の Theme にも変更は可能です。サポートはしませんが、ご自由にどうぞ！  
（その場合、hadv-**book**ではなくなってしまいますが …）
<--->
### 高速ビルド

[Hugo](https://gohugo.io/) は数ある静的サイトジェネレーターの中でも、Web サイトのビルドが一番はやい！  
記事を書くたびに蓄積されていくストレスもありません。コンテンツの数が増えても安心です。
{{< /columns >}}

## 初期サイドメニューについて

{{< columns >}}
### Usage

Usage（content/docs/usage）には、

* hadv-book の開始方法（→ [Getting Started]({{< ref "/docs/usage/getting-started/" >}})）
* テンプレート集（→ [Templates]({{< ref "/docs/usage/templates/" >}})）

などがあります。
<--->
### Example

Example（content/docs/example）には、

* Markdown（→ [Markdown]({{< ref "/docs/example/markdown/" >}})）
* AsciiDoc（→ [AsciiDoc]({{< ref "/docs/example/asciidoc/index" >}})）

… 形式の実例ページを用意しました。  
ドキュメント作成時の参考になります。
{{< /columns >}}

{{< columns >}}
### Blog

Blog（content/posts）のサンプルを表示します。  
サンプルを削除して新たに記事を追加すれば、すぐに使い始められます。
<--->

{{< /columns >}}

## 更新情報

* 2021-08-08
  * ベースとなる [Hugo Book Theme](https://themes.gohugo.io/hugo-book/) を以前の [commit](https://github.com/alex-shpak/hugo-book/commit/1e4bcc2cc3186794c1becbe0a0d9c924264d0146) から最新に更新しました。
