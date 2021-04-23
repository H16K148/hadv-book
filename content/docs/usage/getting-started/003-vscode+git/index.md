---
###### Hugo Predefined
###### https://gohugo.io/content-management/front-matter/
#aliases:       # Set on each page
#audio:         # Set on each page
date: 2021-04-22T22:07:00+09:00
description: "VSCode と Git のインストールや設定の参考情報"
#draft: true
#expiryDate:    # Set on each page 
#headless:      # Set on each page
#images:        # Set on each page
isCJKLanguage: true
keywords:
  - hadv
#layout:        # Set on each page
#lastmod:       # Set on each page
#linkTitle:     # Set on each page
#markup:        # Set on each page
#outputs:       # Set on each page
#publishDate:   # Set on each page
#resources:     # Set on each page
#series:        # Set on each page
#slug:          # Set on each page
summary: "hadv を使うために必要な VSCode と Git のインストール手順など"
title: "3. VSCode と Git の準備"
type: 'docs'
#url:           # Set on each page
#videos:        # Set on each page
weight: 3
## <taxonomies>
categories: ["環境構築"]
tags: ["VSCode", "Git"]
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

# 3. VSCode と Git の準備

ここは 003-vscode+git（content/docs/usage/getting-started/003-vscode+git）です。

## はじめに

VSCode はインストーラーを使うか、Zip アーカイブを解凍して実行する２つのインストール方法がありますが、どちらでも構いません。
Git は WSL2 の Ubuntu 20.04 でインストールできますので、今回はその方法を紹介します。

## 01. VSCode のインストール

インストーラーを使ったインストール方法を紹介します。

- 使用中の環境に応じた VSCode インストーラーを [https://code.visualstudio.com/download](https://code.visualstudio.com/download) からダウンロードします。  
- ダウンロードしたら、インストーラー（VSCodeUserSetup- {version} .exe）を実行します。これには1分しかかかりません。

{{< hint info >}}
VSCode セットアップに関する詳しい情報は、  
[https://code.visualstudio.com/docs/setup/windows](https://code.visualstudio.com/docs/setup/windows)
にあります。
{{< /hint >}}

## 02. Git のインストール

WSL2 の Ubuntu 20.04 コンソール画面を開き、以下を実行します。

```bash {linenos=table,linenostart=1}
sudo apt-get install git
```
{{< hint info >}}
WSL2 への Git インストールに関する詳しい情報は、  
[https://docs.microsoft.com/ja-jp/windows/wsl/tutorials/wsl-git](https://docs.microsoft.com/ja-jp/windows/wsl/tutorials/wsl-git)
にあります。
{{< /hint >}}
