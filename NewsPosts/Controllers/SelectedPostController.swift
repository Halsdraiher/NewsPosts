//
//  SelectedPostController.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 11.09.2023.
//

import UIKit

class SelectedPostController: UIViewController {
    
    var posts: Posts?
    var post: Post?
    var apiManager = ApiManager()
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var postLikes: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        apiManager.getDataForSelectedPost(id: getId(), reloadView: self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let post = apiManager.post {
            postTitle.text = post.title
            postText.text = post.text
            postLikes.text = String(post.likes_count)
            postDate.text = getDate()
            
//            let url = URL(string: "\(post.postImage)")
//            postImage.kf.setImage(with: url)
//            indicator.stopAnimating()
//            indicator.isHidden = true
            
            
        }
        
        
    }
    
    func getId() -> String {
        
        let id = String(posts!.postId)
        return id
        
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        var formattedDate = ""
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        if let post = apiManager.post {
            let date = Date(timeIntervalSince1970: TimeInterval(post.timeshamp))
            formattedDate = dateFormatter.string(from: date)
            
        }
        
        return formattedDate
        
    }


}
