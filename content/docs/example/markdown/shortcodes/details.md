---
title: "Details"
---

# Details

details ショートコードは `details` html5 要素ヘルパーです。  
これは `expand` ショートコード（廃止予定）を置き換えるものです。

## Example
```tpl
{{</* details "Title" [open] */>}}
## Markdown content
Lorem markdownum insigne...
{{</* /details */>}}
```
```tpl
{{</* details title="Title" open=true */>}}
## Markdown content
Lorem markdownum insigne...
{{</* /details */>}}
```

{{< details "Title" open >}}
## Markdown content
Lorem markdownum insigne...
{{< /details >}}
