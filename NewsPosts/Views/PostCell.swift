//
//  PostCell.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 10.09.2023.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postLikes: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var expandButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        expandButton.layer.cornerRadius = 10
        expandButton.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
