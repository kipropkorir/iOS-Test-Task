//
//  Post.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation
import RealmSwift

// MARK: - Welcome
class Post: Object, Decodable {
    
    @objc dynamic var userId = 0
    @objc dynamic var body = ""
    @objc dynamic var title = ""
    @objc dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
