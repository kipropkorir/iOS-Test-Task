//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation
import RealmSwift
import RxSwift

final class PostsListViewModel {
    var goToPostDetails: () -> Void = { print("goToPostDetails not overridden") }
    var showError: () -> Void = { print("showError not overridden") }
    var reloadViews: () -> Void = { print("reloadViews not overridden") }
    private let disposeBag = DisposeBag()
    private let postsService: PostsService
    var state: State

    init( postsService: PostsService = AppEnvironment.current.postsService) {
        self.state = State()
        self.postsService = postsService
        
        getUsers()
        getComments()
        getPosts()
    }
    
    func getPosts(){
        postsService.getPosts()
        .observeForUI()
        .subscribe(
            onSuccess: { i in
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(i, update: .modified)
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                self.state.posts = i
                self.reloadViews()
            },
            onError: { erro in
                self.showError()
            }
        )
        .disposed(by: disposeBag)
    }
    
    func getUsers(){
        postsService.getUsers()
        .observeForUI()
        .subscribe(
            onSuccess: { i in
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(i, update: .modified)
                        }
                    } catch let error as NSError {
                        print(error)
                    }
            },
            onError: { erro in
                self.showError()
            }
        )
        .disposed(by: disposeBag)
    }
    
    func getComments(){
        
        postsService.getComments()
        .observeForUI()
        .subscribe(
            onSuccess: { i in
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(i, update: .modified)
                        }
                    } catch let error as NSError {
                        print(error)
                    }
            },
            onError: { erro in
                self.showError()
            }
        )
        .disposed(by: disposeBag)
    }
  
    
    struct State {
        var posts: [Post]? = nil
    }
}
