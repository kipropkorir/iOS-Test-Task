//
//  WeatherAPI.swift
//  BringInterview
//
//  Created by Kiprop Collins Korir on 20/01/2021.
//

import Moya

final class PostsAPI {

    static func makeGetPostsTarget() -> ValueResponseTarget<[Post]> {
        return ValueResponseTarget(target: AnyTarget(
            path: "posts",
            method: .get
        )
        )
    }
    
    static func makeGetCommentsarget() -> ValueResponseTarget<[Comment]> {
        return ValueResponseTarget(target: AnyTarget(
            path: "comments",
            method: .get
        )
        )
    }
    
    static func makeGetUsersTarget() -> ValueResponseTarget<[User]> {
        return ValueResponseTarget(target: AnyTarget(
            path: "users",
            method: .get
            )
        )
    }
}
