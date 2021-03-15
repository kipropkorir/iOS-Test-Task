//
//  NetworkClient.swift
//  BringInterview
//
//  Created by Kiprop Collins Korir on 20/01/2021.
//

import Moya
import RxSwift
import Foundation

protocol NetworkClient {
    func request<Response: Decodable>(_ targetEnvelope: ResponseEnvelopeTarget<Response>) -> Single<Response>
}

final class NetworkClientImpl: MoyaProvider<AnyTarget>, NetworkClient {
    init(plugins: [PluginType] = []) {
        super.init(plugins: plugins)
        setupSessionConfiguration()
    }

    private func setupSessionConfiguration() {
        session.sessionConfiguration.timeoutIntervalForRequest = 30
    }

    func request<Response: Decodable>(_ targetEnvelope: ResponseEnvelopeTarget<Response>) -> Single<Response> {
        return executeRequest(targetEnvelope)
            .catchError { [weak self] error in
                guard let self = self else { return .never()}
                return .error(self.unwrapError(from: error))
            }
    }

    private func executeRequest<Response: Decodable>(_ targetEnvelope: ResponseEnvelopeTarget<Response>) -> Single<Response> {
        return rx.request(targetEnvelope.target)
            .flatMap { response in
                let decoder = JSONDecoder()

                do {
                    let decodedResponse = try decoder.decode(Response.self, from: response.data)
                    return .just(decodedResponse)
                } catch {

                    // Workaround when JSONDecoder can't decode primitives on iOS 12 and lower https://bugs.swift.org/browse/SR-6163
                    if let decodedResponse = try? JSONSerialization.jsonObject(with: response.data, options: .allowFragments) as? Response {
                        return .just(decodedResponse)
                    } else if let decodedError = try? decoder.decode(ResponseErrorV1.self, from: response.data) {
                        return .error(decodedError)
                    } else {
                        return .error(error)
                    }
                }
        }
    }

    private func unwrapError(from error: Error) -> Error {
        guard let response = (error as? MoyaError)?.response else {
          return error
        }
        if let error = try? response.map(ResponseErrorV1.self) {
            return error
        } else {
            return error
        }
    }
}
