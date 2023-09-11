//
//  SelectedPostController.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 11.09.2023.
//

import UIKit

class SelectedPostController: UIViewController {
    
    var posts: Posts?
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var postLikes: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
