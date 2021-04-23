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
title: "2. WSL2 の準備"
type: 'docs'
#url:           # Set on each page
#videos:        # Set on each page
weight: 2
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

# 2. WSL2 の準備

ここは 002-wsl2（content/docs/usage/getting-started/002-wsl2）です。

## はじめに

公式ドキュメント（[https://docs.microsoft.com/ja-jp/windows/wsl/install-win10](https://docs.microsoft.com/ja-jp/windows/wsl/install-win10)）を使って設定することを強く推奨します。  
しかしながら、[公式ドキュメント](https://docs.microsoft.com/ja-jp/windows/wsl/install-win10)では Microsoft Store を開く手順が示されており、
制限がかけられた環境（配布された PC で機能が削られている等）では手順通りに設定することができないケースもあります。
そのため、ここでは Microsoft Store を使わない手順を参考まで紹介します。

{{< hint info >}}
最新の Windows Insider の Windows 10 プレビュー ビルドが使用可能ならば１コマンドで全て完結します。  
[公式ドキュメント](https://docs.microsoft.com/ja-jp/windows/wsl/install-win10)を参照してください。
{{< /hint >}}

## 01. WSL2 実行のための要件を確認

[公式ドキュメント](https://docs.microsoft.com/ja-jp/windows/wsl/install-win10)にある要件は、
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

## 02. WSL 機能の有効化

管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

## 03. 仮想マシンプラットフォーム有効化

管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
{{< hint warning >}}
コンピューターに仮想化機構がない場合など、エラーが発生する場合があります。  
[公式ドキュメント](https://docs.microsoft.com/ja-jp/windows/wsl/install-win10)「手順 3:」に対応方法が書かれていますので、従います。
{{< /hint >}}

## 04. 再起動

PC を再起動します。

## 05. Linux カーネル更新

x64 マシン用 WSL2 Linux カーネル更新プログラム パッケージ
（[https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)）
をダウンロードして実行します。  
（問題があった場合は、[公式ドキュメント](https://docs.microsoft.com/ja-jp/windows/wsl/install-win10)を参照します）

## 06. WSL 2 を既定バージョンに設定

管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
wsl --set-default-version 2
```

## 07. Ubuntu-20.04 をダウンロード

管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
Set-Location -Path $env:USERPROFILE
curl.exe -s -L -o "Ubuntu_2004.2020.424.0_x64.appx" "https://aka.ms/wslubuntu2004"
```
カレントユーザーのホームディレクトリに Ubuntu-20.04 のディストリビューション・パッケージがダウンロードされます。
{{< hint info >}}
Linux 用 Windows サブシステム ディストリビューション・パッケージを手動でダウンロードする方法については、
[https://docs.microsoft.com/ja-jp/windows/wsl/install-manual](https://docs.microsoft.com/ja-jp/windows/wsl/install-manual)
に詳しい情報があります。
{{< /hint >}}

## 08. Ubuntu-20.04 をインストール

管理者として PowerShell を開き、以下を実行します。
```ps1 {linenos=table,linenostart=1}
Set-Location -Path $env:USERPROFILE
Add-AppxPackage .\Ubuntu_2004.2020.424.0_x64.appx
```

## 09. ユーザー名とパスワードを設定

Windows のスタートメニューから Ubuntu 20.04 LTS を実行すると、最初にアカウント作成が求められます。  
作成するアカウントについて、[ドキュメント](https://docs.microsoft.com/ja-jp/windows/wsl/user-support) には次のような説明があります。

- この ユーザー名 および パスワード は、インストールする Linux ディストリビューションごとに固有であり、Windows ユーザー名とは関係ありません。
- ユーザーが ユーザー名 および パスワード を作成すると、そのアカウントがディストリビューションの既定のユーザーとなり、起動時に自動的にサインインされます。
- このアカウントは、Linux 管理者と見なされ、sudo (Super User Do) 管理コマンドを実行できます。
- Windows Subsystem for Linux で実行されている各 Linux ディストリビューションには、独自の Linux ユーザー アカウントとパスワードがあります。 ディストリビューションの追加、再インストール、再設定を行うたびに、Linux ユーザー アカウントを構成する必要があります。

{{< hint info >}}
ユーザーアカウント作成については、  
[https://docs.microsoft.com/ja-jp/windows/wsl/user-support](https://docs.microsoft.com/ja-jp/windows/wsl/user-support)
に詳しい情報があります。
{{< /hint >}}

## 10. パッケージ更新とアップグレード

Ubuntu-20.04 コンソール画面にて、以下を実行します。

```bash {linenos=table,linenostart=1}
sudo apt update && sudo apt upgrade
```
