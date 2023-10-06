//
//  ApiManager.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 10.09.2023.
//

import Foundation
import Alamofire
import UIKit

class ApiManager {
    
    var posts: [Posts]?
    var post: Post?
    
    //MARK: - Fetch and save data for All Posts
    
    //function to save fetched data to our model
    func getData(tableView: UITableView) {
        
        let urlString = (K.url + "main.json")
        
        fetchData(url: urlString) { result in
            switch result {
            case .success(let userResult):
                //If success -> result saved to "posts"
                let result = userResult.posts
                self.posts = result
                
                DispatchQueue.main.async {
                    
                    tableView.reloadData()                    
                }
                
            case .failure(let error):
                print(error)
            }
        
        }
        
    }
    
    // Function to fetch data from API
    func fetchData(url: String, completion: @escaping (Result<PostsData, Error>)-> ()) {
        
        AF.request(url)
            .validate()
            .response { response in
                
                // Check if data is resived
                //print("Received data: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "No data")")
                
                guard let data = response.data else {
                    if let error = response.error {
                        completion(.failure(error))
                    }
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(PostsData.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            }
    }
    

    func sortPostsByDate() {
        posts?.sort(by: { $0.timeshamp > $1.timeshamp })
        
    }
    
    func sortPostsByLikes() {
        posts?.sort(by: { $0.likes_count > $1.likes_count })
        
    }
    
    
    //MARK: - Fetch and save data for Selected Post
    
    func getDataForSelectedPost(id: String, reloadView: UIViewController) {
        
        let urlString = (K.url + "posts/\(id).json")
        
        fetchDataForSelectedPost(url: urlString) { result in
            switch result {
            case .success(let userResult):
                //If success -> result saved to "posts"
                let result = userResult.post
                self.post = result
                
                DispatchQueue.main.async {
                    reloadView.reloadInputViews()
                }
                
                
            case .failure(let error):
                print(error)
            }
        
        }
        
    }
    
    func fetchDataForSelectedPost(url: String, completion: @escaping (Result<SelectedPostData, Error>)-> ()) {
        
        AF.request(url)
            .validate()
            .response { response in
                
                // Check if data is resived
//                print("Received data: \(String(data: response.data ?? Data(), encoding: .utf8) ?? "No data")")
                
                guard let data = response.data else {
                    if let error = response.error {
                        completion(.failure(error))
                    }
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(SelectedPostData.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            }
    }
    
 
}
