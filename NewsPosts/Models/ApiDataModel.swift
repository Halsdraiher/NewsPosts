//
//  PostApiData.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 10.09.2023.
//

import Foundation

struct PostsData: Codable {
    let posts: [Posts]
}

struct Posts: Codable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let preview_text: String
    let likes_count: Int

}
