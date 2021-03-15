//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation
import RealmSwift

final class CommentsViewModel {
    var post: Post?
    var goBack: () -> Void = { print("goBack not overridden") }
    var state: State
    
    init(comments: Results<Comment>?){
        self.state = State(comments: comments)
    }
    
    struct State {
        var comments: Results<Comment>? = nil
    }
}
