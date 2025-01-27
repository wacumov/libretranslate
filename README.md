# LibreTranslate

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fwacumov%2Flibretranslate%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/wacumov/libretranslate)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fwacumov%2Flibretranslate%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/wacumov/libretranslate)

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

let translator = Translator("https://libretranslate.com")
let translation = try await translator.translate("Hello", from: "en", to: "es")
```
