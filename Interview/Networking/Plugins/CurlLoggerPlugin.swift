//
//  CurlLoggerPlugin.swift
//  BringInterview
//
//  Created by Kiprop Collins Korir on 20/01/2021.
//

import Moya
import Foundation

final class CurlLoggerPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        guard let urlRequest = request.request else { return }
    }

    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            let requestDescription = response.request?.description ?? "Unknown request"
            let formattedData = (try? JSONSerialization.jsonObject(with: response.data, options: []))
                .flatMap { try? JSONSerialization.data(withJSONObject: $0, options: [.prettyPrinted]) }
                .flatMap { String(data: $0, encoding: .utf8) }
                ?? String(data: response.data, encoding: .utf8)
                ?? "unknown"

            print("HTTP Request Succeeded [\(response.statusCode)]: \(requestDescription) \(formattedData)")

        case .failure(let error):
            let content = error.response.flatMap({ String(data: $0.data, encoding: .utf8) }) ?? ""
            let reason = error.localizedDescription

            print("HTTP Request Failed: \(content) \(reason)")
        }
    }
}
