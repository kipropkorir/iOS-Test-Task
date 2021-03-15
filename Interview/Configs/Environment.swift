//
//  Environment.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation

enum Environment {
    private static let infoDictionary: [String: Any] = {
        guard let dictionary = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dictionary
    }()

    static let baseURLString: String = {
        return "http://jsonplaceholder.typicode.com/"
    }()

    static let baseURL: URL = {
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Couldn't conver base url string to URL")
        }
        return baseURL
    }()

}
