//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import UIKit

class PostsListViewController: UIViewController, Storyboarded {

    var array: [[String: Any]]?
    var model: PostsListViewModel?
    @IBOutlet weak var tableView: UITableView!
    var itemTapped: (Post?) -> Void = { _ in print("\(#file) - \(#line) - rowTapped isn't overriden") }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViews()
    }
    
    func reloadViews(){
        self.tableView?.reloadData()
    }

    func setViews() {
        self.view.backgroundColor = .white
        tableView?.backgroundColor = .backgroundMain
        tableView?.delegate = self
        tableView?.dataSource = self
        title = "posts_list".localized
    }
}

// MARK: - UITableViewDelegate & Datasource -

extension PostsListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.model?.state.posts?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as? PostCell else {
              fatalError("The dequeued cell is not an instance of PostCell.")
        }
        
        cell.titleLabel.text = model?.state.posts?[indexPath.row].title
        cell.bodyLabel.text = model?.state.posts?[indexPath.row].body

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemTapped(model?.state.posts?[indexPath.row])
    }
}
