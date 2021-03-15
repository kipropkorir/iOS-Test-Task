//
//  AppEnvironment.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Moya
import Foundation

struct AppEnvironment {
    static let current = makeAppEnvironment()

    var postsService: PostsService

    private static func makeAppEnvironment() -> AppEnvironment {

        let bearerNetworkClient = NetworkClientImpl(plugins: [CurlLoggerPlugin()])
        let postsService = PostsServiceImpl(networkClient: bearerNetworkClient)

        return AppEnvironment(
            postsService: postsService
        )
    }
}
