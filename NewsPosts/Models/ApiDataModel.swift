//
//  PostApiData.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 10.09.2023.
//

import Foundation


//MARK: - Models for All Posts Api
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

//MARK: - Models for Selected Post Api

struct SelectedPostData: Codable {
    let post: Post
}

struct Post: Codable {
    let timeshamp: Int
    let title: String
    let text: String
    let postImage: String
    let likes_count: Int
}
