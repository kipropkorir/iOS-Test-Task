//
//  BasicResponse.swift
//  BringInterview
//
//  Created by Kiprop Collins Korir on 20/01/2021.
//

import Foundation

struct BasicResponse: Decodable {
    let statusCode: String
    let statusMessage: String

    enum CodingKeys: String, CodingKey {
        case statusCode
        case statusMessage
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = (try? values.decode(String.self, forKey: .statusCode)) ?? ""
        statusMessage = (try? values.decode(String.self, forKey: .statusMessage)) ?? ""
    }
}
