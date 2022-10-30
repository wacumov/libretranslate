import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

public struct Translator {
    private let url: String
    private let apiKey: String?
    private let session = URLSession.shared
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    public init(_ url: String, apiKey: String? = nil) {
        self.url = url
        self.apiKey = apiKey
    }

    public func languages() async throws -> [Language] {
        let url = try makeURL(path: "/languages")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return try await decodedData(for: request)
    }

    public func translate(_ text: String, from sourceLanguage: String, to targetLanguage: String) async throws -> String {
        let url = try makeURL(path: "/translate")

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        struct RequestBody: Encodable {
            let q: String
            let source: String
            let target: String
            let api_key: String?
        }
        let body = RequestBody(q: text, source: sourceLanguage, target: targetLanguage, api_key: apiKey)
        request.httpBody = try encoder.encode(body)

        struct Response: Decodable {
            let translatedText: String
        }
        let response: Response = try await decodedData(for: request)
        return response.translatedText
    }

    private func makeURL(path: String) throws -> URL {
        guard var components = URLComponents(string: url) else {
            throw URLError(.badURL)
        }
        components.path = path
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        return url
    }

    private func decodedData<Output: Decodable>(for request: URLRequest) async throws -> Output {
        let data = try await session.data(for: request)
        return try decoder.decode(Output.self, from: data)
    }
}

private extension URLSession {
    func data(for request: URLRequest) async throws -> Data {
        var task: URLSessionDataTask?
        let onCancel = { task?.cancel() }
        return try await withTaskCancellationHandler(
            handler: { onCancel() },
            operation: {
                try await withCheckedThrowingContinuation { continuation in
                    task = dataTask(with: request) { data, _, error in
                        guard let data = data else {
                            let error = error ?? URLError(.badServerResponse)
                            return continuation.resume(throwing: error)
                        }
                        continuation.resume(returning: data)
                    }
                    task?.resume()
                }
            }
        )
    }
}
