---
###### Hugo Predefined
###### https://gohugo.io/content-management/front-matter/
#aliases:       # Set on each page
#audio:         # Set on each page
date: 2021-04-18T19:38:00+09:00
description: "Windows10 設定の参考情報"
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
summary: "hadv を使う時に設定したらいいかもしれない Windows10 の設定など"
title: "001. Windows10 の準備"
type: 'docs'
#url:           # Set on each page
#videos:        # Set on each page
weight: 1
## <taxonomies>
categories: ["環境構築"]
tags: ["Windows10"]
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

# 001. Windows10 の準備

ここは 001-win10（content/docs/info/usage/001-win10）です。

## はじめに

ここで紹介する設定は hadv を使用する上で必須ではありません。

## #1. 260 文字パス長制限を解除

Windows10 で使っている NTFS ファイルシステムは最大 64KB（UTF-16 で 32767 文字）までのパス名をサポートしていますが、
Windows 95 系列との互換性のため、ほとんどのアプリケーションが 260 文字を上限にしています。  
WSL では NTFS の上限までの長さのパス名が使用できるとのことですが、
それらで使用しているファイル等をエクスプローラーで表示させることもあるかもしれないので、念のため設定する方法を紹介します。

### 現在の設定を確認

管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
(Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled').LongPathsEnabled
```
結果が 1 ならば設定済みです。ここで終了します。

### 未設定の場合、設定する

確認結果が 0 だった場合は未設定です。  
管理者として開いた PowerShell で、以下を実行します。
```ps1 {linenos=table,linenostart=1}
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
```
