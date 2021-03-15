//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import UIKit

class PostDetailsViewController: UIViewController, Storyboarded {

    var model: PostDetailsViewModel?
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var containerStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        loadViews()
    }

    @IBAction func viewComments(_ sender: Any) {
        model?.viewComments(model?.state.comments)
    }
    
    func loadViews() {
        userLabel.text = model?.state.user?.name
        bodyLabel.text = model?.state.post?.body
        titleLabel.text = model?.state.post?.title
        title = "Post Detail".localized
    }

}
