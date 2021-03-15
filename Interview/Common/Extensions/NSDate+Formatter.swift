//
//  CommentsCell.swift
//  Interview
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import Foundation

extension DateFormatter {
    static var sharedDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter
    }()
}
