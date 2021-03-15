//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation
import UIKit

class CommentsViewController: UIViewController, Storyboarded {

    var model: CommentsViewModel?
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        loadViews()
    }

    func loadViews() {
        tableView.dataSource = self
        tableView.delegate = self
        title = "Comments".localized
    }

}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.model?.state.comments?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as? CommentCell else {
              fatalError("The dequeued cell is not an instance of PostCell.")
        }
        cell.bodyLabel.text = self.model?.state.comments?[indexPath.row].body
        cell.emailLabel.text = self.model?.state.comments?[indexPath.row].name

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        view.backgroundColor = .backgroundMain
        return view
    }
}
