//
//  ResponseErrorV1.swift
//  EazzyBanking
//
//  Created by Olexander Markov on 23.06.2020.
//  Copyright © 2020 Equity Bank. All rights reserved.
//

import Foundation

struct ResponseErrorV1 {
    let statusCode: String
    let statusMessage: String
    let successful: Bool
}

extension ResponseErrorV1: Decodable {
    enum CodingKeys: String, CodingKey {
        case statusCode
        case statusMessage
        case successful
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = (try? values.decode(String.self, forKey: .statusCode)) ?? ""
        statusMessage = (try? values.decode(String.self, forKey: .statusMessage)) ?? ""
        successful = try values.decode(Bool.self, forKey: .successful)
    }
}

extension ResponseErrorV1: LocalizedError {
    var errorDescription: String? {
        return statusMessage
    }
}
