import LibreTranslate
import XCTest

final class TranslatorTests: XCTestCase {
    let translator = Translator("https://libretranslate.de")

    func testLanguages() async throws {
        let languages = try await translator.languages()
        XCTAssertFalse(languages.isEmpty)
    }

    func testTranslate() async throws {
        let translation = try await translator.translate("Hello", from: "en", to: "es")
        XCTAssertFalse(translation.isEmpty)
    }
}
