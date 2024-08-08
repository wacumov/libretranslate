import LibreTranslate
import XCTest

final class TranslatorTests: XCTestCase {
    let translator = Translator("https://translate.terraprint.co")

    func testLanguages() async throws {
        let languages = try await translator.languages()
        XCTAssertFalse(languages.isEmpty)
    }

    func testDetectLanguage() async throws {
        let detectedLanguages = try await translator.detectLanguage("Where are you from?")
        XCTAssertFalse(detectedLanguages.isEmpty)
    }

    func testTranslate() async throws {
        let translation = try await translator.translate("Hello", from: "en", to: "es")
        XCTAssertFalse(translation.isEmpty)
    }
}
