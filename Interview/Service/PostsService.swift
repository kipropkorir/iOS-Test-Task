//
//  PostsService.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation
import RxSwift

protocol PostsService {
    func getPosts() -> Single<[Post]>
    func getUsers() -> Single<[User]>
    func getComments() -> Single<[Comment]>
}


final class PostsServiceImpl: PostsService {
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getPosts() -> Single<[Post]> {
        let target = PostsAPI.makeGetPostsTarget()
        return networkClient.request(target)
            .map{$0}
    }
    
    
    func getUsers() -> Single<[User]> {
        let target = PostsAPI.makeGetUsersTarget()
        return networkClient.request(target)
            .map{$0}
    }
    
    
    func getComments() -> Single<[Comment]> {
        let target = PostsAPI.makeGetCommentsarget()
        return networkClient.request(target)
            .map{$0}
    }
}

