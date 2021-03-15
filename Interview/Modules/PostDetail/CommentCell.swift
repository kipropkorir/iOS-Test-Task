//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation
import UIKit

import Foundation
import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        selectionStyle = .none
        backgroundColor = .white

    }

    class var identifier: String {
        return String(describing: self)
    }
}
