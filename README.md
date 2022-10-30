# LibreTranslate

[LibreTranslate](https://libretranslate.com) is a free and open source machine translation API.

## Installation

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/wacumov/libretranslate.git", from: "0.1.0")
    ],
    ...
)
```

## Usage

```swift
import LibreTranslate

let translator = Translator("https://libretranslate.de")
let translation = try await translator.translate("Hello", from: "en", to: "es")
```
