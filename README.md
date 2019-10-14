Demonstration of a race condition when using HTML attributed strings with SwiftUI.

In `HTMLText` view:
```
    func makeUIView(context: Context) -> HTMLLabel {
        let label = HTMLLabel()
	label.setHtml(htmlText, asynchronously: true)
        return label
    }
```

Set `asynchronously` parameter to `false` to see it crash.
