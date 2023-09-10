//
//  ApiManager.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 10.09.2023.
//

import Foundation
import Alamofire

class ApiManager {
    
    var posts: [Posts]?
    
    
    //function to save fetched data to our model
    func getData() {
        
        let url = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        
        fetchData(url: url) { result in
            switch result {
            case .success(let userResult):
                //If success -> result saved to "posts"
                let result = userResult.posts
                self.posts = result
                
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
    
}