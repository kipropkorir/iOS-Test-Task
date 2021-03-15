//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation

enum AppError: Error, LocalizedError {

    case customError(message: String)

    var errorDescription: String? {
        switch self {
        case .customError(let message):
            return message
        }
    }
}
