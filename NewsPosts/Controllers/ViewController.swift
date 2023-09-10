//
//  ViewController.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 10.09.2023.
//

import UIKit

class PostsController: UITableViewController {
    
    private var apiManager = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.getData(reloadView: tableView)
        tableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: - Setting cells
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apiManager.posts?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! PostCell
        
        if let post = apiManager.posts?[indexPath.row] {
            cell.postTitle.text = post.title
            cell.postText.text = post.preview_text
            cell.postLikes.text = String(post.likes_count)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let date = Date(timeIntervalSince1970: TimeInterval(post.timeshamp))
            let formatedDate = dateFormatter.string(from: date)
            cell.postDate.text = formatedDate
        }
        
        return cell
    }
    
}

