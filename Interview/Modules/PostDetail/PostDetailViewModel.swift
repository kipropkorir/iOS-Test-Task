//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation
import RealmSwift

final class PostDetailsViewModel {
    var goBack: () -> Void = { print("goBack not overridden") }
    var viewComments: (Results<Comment>?) -> Void = { _ in print("viewComments not overridden") }
    var state: State
    
    func getPostComments(){
        do {
            let realm = try Realm()
            state.comments = realm.objects(Comment.self).filter("postId == %@", state.post?.id ?? 0)
        } catch _ {
        }
    }
    
    func getUser(){
        do {
            let realm = try Realm()
            state.user = realm.objects(User.self).filter("id == %@", state.post?.userId ?? 0).first
        } catch _ {
        }
    }
    
    init(post: Post?) {
        self.state = State(post: post)
        getPostComments()
        getUser()
    }
    
    struct State {
        var comments: Results<Comment>? = nil
        var user: User? = nil
        var post: Post?
    }
}
