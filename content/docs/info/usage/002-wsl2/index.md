---
###### Hugo Predefined
###### https://gohugo.io/content-management/front-matter/
#aliases:       # Set on each page
#audio:         # Set on each page
date: 2021-04-18T19:38:00+09:00
description: "WSL2 のインストールや設定の参考情報"
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
summary: "hadv を使うために必要な WSL2 の設定手順など"
title: "002. WSL2 の準備"
type: 'docs'
#url:           # Set on each page
#videos:        # Set on each page
weight: 1
## <taxonomies>
categories: ["環境構築"]
tags: ["WSL2"]
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

# 002. WSL2 の準備

ここは 002-wsl2（content/docs/info/usage/002-wsl2）です。

## はじめに

公式ドキュメント（[https://docs.microsoft.com/ja-jp/windows/wsl/install-win10](https://docs.microsoft.com/ja-jp/windows/wsl/install-win10)）を使って設定することを強く推奨します。  
しかしながら、公式ドキュメントでは Microsoft Store を開く手順が示されており、制限がかけられた環境（配布された PC で機能が削られている等）では手順通りに設定することができないケースもあります。
そのため、ここでは Microsoft Store を使わない手順を参考まで紹介します。

{{< hint info >}}
最新の Windows Insider の Windows 10 プレビュー ビルドが使用可能ならば１コマンドで全て完結します。  
公式ドキュメントを参照してください。
{{< /hint >}}

## #1. WSL2 実行のための要件を確認

公式ドキュメントにある要件は、
- x64 システムの場合:バージョン 1903 以降、ビルド 18362 以上。  
（マイナービルドは 1049 より大きい必要あり）
- ARM64 システムの場合:バージョン 2004 以降、ビルド 19041 以上。
- 18362 より前のビルドは WSL 2 をサポートしていません。

バージョンの確認は、  
管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseID
```
ビルドの確認は、  
管理者として開いた PowerShell で、以下を実行します。
```ps1 {linenos=table,linenostart=1}
(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name CurrentBuild).CurrentBuild
```
マイナービルドの確認は、  
管理者として開いた PowerShell で、以下を実行します。
```ps1 {linenos=table,linenostart=1}
(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name UBR).UBR
```

WSL2 実行のための要件に満たなかった場合は、Windows の更新を試みます。

## #2. WSL 機能の有効化

管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

## #3. 仮想マシンプラットフォーム有効化

管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
{{< hint warning >}}
コンピューターに仮想化機構がない場合など、エラーが発生する場合があります。  
公式ドキュメント「手順 3:」に対応方法が書かれていますので、従います。
{{< /hint >}}

## #4. 再起動

PC を再起動します。

## #5. Linux カーネル更新

