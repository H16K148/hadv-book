---
###### Hugo Predefined
###### https://gohugo.io/content-management/front-matter/
#aliases:       # Set on each page
#audio:         # Set on each page
date: 2021-04-09T00:00:00+09:00
description: "Markdown の実例ページ集"
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
summary: "Markdown の実例ページ"
title: "Markdown"
type: docs
#url:           # Set on each page
#videos:        # Set on each page
weight: 20
## <taxonomies>
categories: ["example"]
tags: []
###### Hugo Book Theme Defined
###### https://themes.gohugo.io/hugo-book/
## See /content/docs/_index.md
## (Optional) Set to 'true' to mark page as flat section in file-tree menu (if BookMenuBundle not set)
#bookFlatSection: false
## (Optional) Set to hide nested sections or pages at that level. Works only with file-tree menu mode
bookCollapseSection: true
## (Optional) Set true to hide page or section from side menu (if BookMenuBundle not set)
#bookHidden: false
## (Optional) Set 'false' to hide ToC from page
#bookToC: true
## (Optional) If you have enabled BookComments for the site, you can disable it for specific pages.
#bookComments: false
## (Optional) Set to 'false' to exclude page from search index.
#bookSearchExclude: true
---

# Markdown

## Markdown Syntax 

ここで Hugo の Markdown で記述できる基本的な構文のサンプルを掲載します。

## Headings

次の HTML `<h1>`—`<h6>` 要素は、６レベルのセクション見出しを表示します。`<h1>` は一番高いレベルのセクションで `<h6>` は一番低いレベルのセクションです。

# H1
## H2
### H3
#### H4
##### H5
###### H6

## Paragraph

寿限無、寿限無、五劫の擦り切れ、海砂利水魚の、水行末・雲来末・風来末、喰う寝る処に住む処、藪ら柑子の藪柑子、パイポ・パイポ・パイポのシューリンガン、
シューリンガンのグーリンダイ、グーリンダイのポンポコピーのポンポコナの、長久命の長助

色は匂へど　散りぬるを  
我が世誰そ　常ならむ  
有為の奥山　今日越えて  
浅き夢見じ　酔ひもせず

## Blockquotes

blockquote 要素は、別のソースから引用されたコンテンツの表示に使います。
必要に応じて、`footer` や `cite` 要素内にあるべき引用や、注釈や略語などのインライン変更を含む場合もあります。

#### 帰属なしの Blockquote

> あめつちほしそら、やまかはみねたに
> **注意** blockquote 内でも *Markdown syntax* が使えます。

#### 帰属ありの Blockquote

> くもきりむろこけ、ひといぬうへすゑ
> — 作者不明[^1]

[^1]: 上記の引用は、日本のいろは歌の別バージョンを抜粋したものです。

## Tables

Tables は コア Markdown 仕様の一部ではありませんが、Hugo はすぐに使えるようサポートしています。

   Name | Age
--------|------
    Bob | 27
  Alice | 23

#### tables 内の in-line Markdown Syntax 

| Italics   | Bold     | Code   |
| --------  | -------- | ------ |
| *italics* | **bold** | `code` |

## Code Blocks

#### Code block with backticks

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Example HTML5 Document</title>
</head>
<body>
  <p>Test</p>
</body>
</html>
```

#### Code block indented with four spaces

    <!doctype html>
    <html lang="en">
    <head>
      <meta charset="utf-8">
      <title>Example HTML5 Document</title>
    </head>
    <body>
      <p>Test</p>
    </body>
    </html>

#### Code block with Hugo's internal highlight shortcode
{{< highlight html >}}
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Example HTML5 Document</title>
</head>
<body>
  <p>Test</p>
</body>
</html>
{{< /highlight >}}

## List Types

#### Ordered List

1. First item
2. Second item
3. Third item

#### Unordered List

* List item
* Another item
* And another item

#### Nested list

* Fruit
  * Apple
  * Orange
  * Banana
* Dairy
  * Milk
  * Cheese
