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
### 本体のインストール
インストーラーを使ったインストール方法を紹介します。

- 使用中の環境に応じた VSCode インストーラーを [https://code.visualstudio.com/download](https://code.visualstudio.com/download) からダウンロードします。  
- ダウンロードしたら、インストーラー（VSCodeUserSetup- {version} .exe）を実行します。

{{< hint info >}}
VSCode セットアップに関する詳しい情報は、  
[https://code.visualstudio.com/docs/setup/windows](https://code.visualstudio.com/docs/setup/windows)
にあります。
{{< /hint >}}

### 拡張機能のインストール
hadv では VSCode の devcontainer という仕組みを使用するため、必須となる拡張機能があります。  
ここでは、VSCode にパスが通っていることを前提に、コマンドプロンプトによる簡単なインストール方法を紹介します。

{{< hint info >}}
VSCode 拡張機能に関する詳しい情報は、  
[https://code.visualstudio.com/docs/editor/extension-marketplace](https://code.visualstudio.com/docs/editor/extension-marketplace)
にあります。
{{< /hint >}}

#### 言語パック（日本語）
| 名前 | ID   | 紹介 |
| :--  | :--  | :--  |
| [Japanese Language Pack<br> for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-ja) | ms-ceintl<br>.vscode-language-pack-ja | 日本語にローカライズされた UI を提供 |
```bat {linenos=table,linenostart=1}
code --install-extension ms-ceintl.vscode-language-pack-ja
```

#### 必須の拡張機能
| 名前 | ID   | 紹介 |
| :--  | :--  | :--  |
| [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) | ms-vscode-remote<br>.vscode-remote-extensionpack | リモートマシンやコンテナ内のフォルダを開く |
```bat {linenos=table,linenostart=1}
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
```

#### 便利な拡張機能
{{< details "必須ではありませんが、あると便利な拡張機能を紹介（クリックで開く）" >}}
| 名前 | ID   | 紹介 |
| :--  | :--  | :--  |
| [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons) | vscode-icons-team<br>.vscode-icons | 拡張子ごとにキレイなアイコンを表示 |
| [Project Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager) | alefragnani<br>.project-manager | 複数のプロジェクトの管理 |
| [Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks) | alefragnani<br>.bookmarks | ファイルに「しおり」を付与 |
| [Local History](https://marketplace.visualstudio.com/items?itemName=xyz.local-history) | xyz<br>.local-history | ファイル編集の履歴を保存 |
| [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree) | gruntfuggly<br>.todo-tree | コメントタグの TODO などをツリー表示 |
| [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) | eamodio<br>.gitlens | git の情報を表示 |
| [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph) | mhutchie<br>.git-graph | git のコミット履歴を表示 |
| [GitHub Pull Requests<br> and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) | github<br>.vscode-pull-request-github | GitHub 操作 |
| [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2) | coenraads<br>.bracket-pair-colorizer-2 | カッコの対応を色付きで表示 |
| [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow) | oderwat<br>.indent-rainbow | インデントを見やすく表示 |
| [zenkaku](https://marketplace.visualstudio.com/items?itemName=mosapride.zenkaku) | mosapride<br>.zenkaku | 全角スペースの可視化 |
| [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) | mechatroner<br>.rainbow-csv | CSV, TSV の色分け、簡易クエリ |
| [Excel Viewer](https://marketplace.visualstudio.com/items?itemName=GrapeCity.gc-excelviewer) | grapecity<br>.gc-excelviewer | CSV を Excel 的に表示 |
| [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) | streetsidesoftware<br>.code-spell-checker | スペルミス表示でタイポを防止 |
| [テキスト校正くん](https://marketplace.visualstudio.com/items?itemName=ICS.japanese-proofreading) | ics<br>.japanese-proofreading | 日本語文章校正チェック |
| [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode) | visualstudioexptteam<br>.vscodeintellicode | コード補完の AI サポート |
| [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) | christian-kohler<br>.path-intellisense | パス入力をインテリセンスで補完 |
| [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) | redhat<br>.vscode-yaml | YAML サポート |
| [XML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml) | redhat<br>.vscode-xml | XML サポート |
| [jumpy](https://marketplace.visualstudio.com/items?itemName=wmaurer.vscode-jumpy) | wmaurer<br>.vscode-jumpy | カーソル移動を補助 |
| [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) | esbenp<br>.prettier-vscode | コードフォーマッター |
| [Sort lines](https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines) | tyriar<br>.sort-lines | 行ソート |
| [Partial Diff](https://marketplace.visualstudio.com/items?itemName=ryu1kn.partial-diff) | ryu1kn<br>.partial-diff | 選択した範囲の差分を表示 |
| [hexdump for VSCode](https://marketplace.visualstudio.com/items?itemName=slevesque.vscode-hexdump) | slevesque<br>.vscode-hexdump | 16 進ダンプ表示 |
| [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio) | hediet<br>.vscode-drawio | Draw.io で図の作成 |
| [PrintCode](https://marketplace.visualstudio.com/items?itemName=nobuhito.printcode) | nobuhito<br>.printcode | コードの印刷サポート |
| [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) | formulahendry<br>.code-runner | 選択したコードをその場で実行 |
```bat {linenos=table,linenostart=1}
code --install-extension vscode-icons-team.vscode-icons
code --install-extension alefragnani.project-manager
code --install-extension alefragnani.bookmarks
code --install-extension xyz.local-history
code --install-extension gruntfuggly.todo-tree
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension github.vscode-pull-request-github
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension oderwat.indent-rainbow
code --install-extension mosapride.zenkaku
code --install-extension mechatroner.rainbow-csv
code --install-extension grapecity.gc-excelviewer
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension ics.japanese-proofreading
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension christian-kohler.path-intellisense
code --install-extension redhat.vscode-yaml
code --install-extension redhat.vscode-xml
code --install-extension wmaurer.vscode-jumpy
code --install-extension esbenp.prettier-vscode
code --install-extension tyriar.sort-lines
code --install-extension ryu1kn.partial-diff
code --install-extension slevesque.vscode-hexdump
code --install-extension hediet.vscode-drawio
code --install-extension nobuhito.printcode
code --install-extension formulahendry.code-runner
```

##### 設定サンプル（VSCode - settings.json）
```json {linenos=table,linenostart=1}
{
  "window.zoomLevel": -1,
  "window.title": "${dirty}${activeEditorMedium}${separator}${rootName}",
  "editor.minimap.side": "left",
  "editor.minimap.showSlider": "always",
  "editor.minimap.scale": 3, 
  "editor.minimap.maxColumn": 40,
  "editor.rulers": [80,120],
  "editor.wordWrap": "on",
  "editor.tabSize": 2,
  "editor.cursorBlinking": "smooth",
  "editor.cursorStyle": "block",
  "editor.renderWhitespace": "all",
  "editor.renderControlCharacters": true,
  "workbench.editor.openPositioning": "last", 
  "workbench.editor.highlightModifiedTabs": true,
  "files.autoSave": "off",
  "files.autoGuessEncoding": true,
  "terminal.integrated.fontFamily": "'MS Gothic'",
  "[shellscript]": {
    "editor.renderIndentGuides": true,
    "files.encoding": "utf8"
  },
  "[bat]": {
    "editor.renderIndentGuides": true,
    "files.encoding": "shiftjis"
  },
  "[powershell]": {
    "editor.renderIndentGuides": true,
    "files.encoding": "shiftjis"
  },
  "workbench.iconTheme": "vscode-icons",
  "todo-tree.tree.showScanModeButton": false,
  "indentRainbow.colors": [
    "rgba(255,0,0,0.5)",
    "rgba(255,165,0,0.5)",
    "rgba(255,255,0,0.5)",
    "rgba(0,128,0,0.5)",
    "rgba(0,255,255,0.5)",
    "rgba(0,0,255,0.5)",
    "rgba(128,0,128,0.5)"
  ],
  "code-runner.runInTerminal": true,
  "code-runner.clearPreviousOutput": true,
}
```

{{< /details >}}

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
