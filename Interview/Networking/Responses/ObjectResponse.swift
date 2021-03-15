//
//  ObjectResponse.swift
//  BringInterview
//
//  Created by Kiprop Collins Korir on 20/01/2021.
//

import Foundation

struct ObjectResponse<T: Decodable>: Decodable {
    let statusCode: String
    let statusMessage: String
    let responseObject: T

    enum CodingKeys: String, CodingKey {
        case statusCode
        case statusMessage
        case responseObject
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = (try? values.decode(String.self, forKey: .statusCode)) ?? ""
        statusMessage = (try? values.decode(String.self, forKey: .statusMessage)) ?? ""
        responseObject = try values.decode(T.self, forKey: .responseObject)
    }
}
