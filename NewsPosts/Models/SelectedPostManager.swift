//
//  SelectedPostManager.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 11.09.2023.
//

import Foundation

struct SelectedPostManager {

    static func getId(posts: Posts) -> String {
            let id = String(posts.postId)
            return id
        }
    
    static func getDate(fromTimestamp timestamp: Int, dateFormat: String = "dd/MM/yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        return dateFormatter.string(from: date)
    }
    
}
