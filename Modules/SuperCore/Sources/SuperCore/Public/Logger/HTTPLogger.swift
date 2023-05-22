//
//  HTTPLogger.swift
//  
//
//  Created by Андрей Коноплев on 20.10.2022.
//

import Foundation

public enum HTTPLogger {

    public static func logRequest(request: URLRequest) {
        let urlString = request.url?.absoluteString ?? ""
        let components = NSURLComponents(string: urlString)

        // swiftlint:disable force_unwrapping
        let method = request.httpMethod != nil ? "\(request.httpMethod!)" : ""
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        let host = "\(components?.host ?? "")"

        var requestLog = "\n---------- OUT ---------->\n"
        requestLog += "\(urlString)"
        requestLog += "\n\n"
        requestLog += "\(method) \(path)?\(query) HTTP/1.1\n"
        requestLog += "Host: \(host)\n"
        for (key, value) in request.allHTTPHeaderFields ?? [:] {
            requestLog += "\(key): \(value)\n"
        }
        if let body = request.httpBody {
            let bodyString = NSString(
                data: body,
                encoding: String.Encoding.utf8.rawValue
            ) ?? "Can't render body; not utf8 encoded"
            requestLog += "\n\(bodyString)\n"
        }

        requestLog += "\n------------------------->\n"

        let cookieName = "user_public_id"
        if let cookie = HTTPCookieStorage.shared.cookies?.first(where: { $0.name == cookieName }) {
            debugPrint("\(cookieName): \(cookie.value)")
        }

        print(requestLog)
    }

    public static func log(response: HTTPURLResponse?, data: Data?, error: Error?) {
        print("\n - - - - - - - - - - INCOMMING - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        let urlString = response?.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        var output = ""

        if let urlString = urlString {
            output += "\(urlString)"
            output += "\n\n"
        }

        if let statusCode = response?.statusCode {
            output += "HTTP \(statusCode) \(path)?\(query)\n"
        }
        if let host = components?.host {
            output += "Host: \(host)\n"
        }
        for (key, value) in response?.allHeaderFields ?? [:] {
            output += "\(key): \(value)\n"
        }
        if let body = data {
            // swiftlint:disable force_unwrapping
            output += "\n\(String(data: body, encoding: .utf8) ?? "")\n"
        }
        if error != nil {
            output += "\nError: \(error!.localizedDescription)\n"
        }
        print(output.decodingUnicodeCharacters)

        let cookieName = "user_public_id"
        if let cookie = HTTPCookieStorage.shared.cookies?.first(where: { $0.name == cookieName }) {
            debugPrint("\(cookieName): \(cookie.value)")
        }
    }
}
