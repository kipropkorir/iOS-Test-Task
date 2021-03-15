//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation
import UIKit
import RealmSwift

final class PostsListCoordinator: Coordinator {

    lazy var primaryViewController: PostsListViewController = {
        let vc =  PostsListViewController.instantiate()
        let model = PostsListViewModel()
        model.reloadViews = vc.reloadViews
        vc.model = model
        vc.itemTapped = postItemTapped
        return vc
    }()

    override func start() {
        push(viewController: primaryViewController)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func workflowCompleted() {
        navigationController?.dismiss(animated: true)
        parentCoordinator?.finishWorkflow()
    }

    func backAction() {
        pop()
    }
    override func finishWorkflow() {
        super.finishWorkflow()
        navigationController?.dismiss(animated: true)
        parentCoordinator?.finishWorkflow()
    }

    func goToPostDetails(post: Post?) {
        let model = PostDetailsViewModel(post: post)
        model.goBack = backAction
        model.viewComments = goToViewComments
        let vc = PostDetailsViewController.instantiate()
        vc.model = model
        push(viewController: vc)
    }
    
    func goToViewComments(comments: Results<Comment>?) {
        let model = CommentsViewModel(comments: comments)
        model.goBack = backAction
        let vc = CommentsViewController.instantiate()
        vc.model = model
        push(viewController: vc)
    }

    func postItemTapped(post: Post?) {
        goToPostDetails(post: post)
    }
}
