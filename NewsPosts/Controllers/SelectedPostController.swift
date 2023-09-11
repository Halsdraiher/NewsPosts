//
//  SelectedPostController.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 11.09.2023.
//

import UIKit
import Kingfisher

class SelectedPostController: UIViewController {
    
    var posts: Posts?
    var post: Post?
    var apiManager = ApiManager()
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var postLikes: UILabel!
    @IBOutlet weak var postLikesImage: UIImageView!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager.getDataForSelectedPost(id: SelectedPostManager.getId(posts: posts!), reloadView: self)
        indicator.startAnimating()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let post = apiManager.post {
            postTitle.text = post.title
            postText.text = post.text
            postLikes.text = String(post.likes_count)
            postDate.text = SelectedPostManager.getDate(fromTimestamp: post.timeshamp)
            
            let url = URL(string: "\(post.postImage)")
            postImage.kf.setImage(with: url)
            indicator.stopAnimating()
            postLikesImage.isHidden = false
            
        }
    }


}
