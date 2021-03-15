//
//  AnyTarget.swift
//  BringInterview
//
//  Created by Kiprop Collins Korir on 20/01/2021.
//

import Moya
import Foundation

typealias BasicResponseTarget = ResponseEnvelopeTarget<BasicResponse>
typealias ValueResponseTarget<Value: Decodable> = ResponseEnvelopeTarget<Value>
typealias ObjectResponseTarget<Payload: Decodable> = ResponseEnvelopeTarget<ObjectResponse<Payload>>

struct ResponseEnvelopeTarget<Response: Decodable> {
    let target: AnyTarget
}

struct AnyTarget: TargetType, AccessTokenAuthorizable {
    let baseURL: URL
    let path: String
    let method: Moya.Method
    let sampleData: Data
    let task: Task
    let validationType: ValidationType
    let headers: [String: String]?
    let authorizationType: AuthorizationType?

    init(
        baseURL: URL = Environment.baseURL,
        path: String = "",
        method: Moya.Method = .get,
        sampleData: Data = Data(),
        task: Task = .requestPlain,
        validationType: ValidationType = .successCodes,
        headers: [String: String]? = nil,
        authorizationType: AuthorizationType? = .bearer
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.sampleData = sampleData
        self.task = task
        self.validationType = validationType
        self.headers = headers
        self.authorizationType = authorizationType
    }
}
