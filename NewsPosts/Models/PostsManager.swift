//
//  PostsManager.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 11.09.2023.
//

import Foundation
import UIKit

struct PostsManager {
    
    static func numberOfVisibleLines(in label: UILabel) -> Int {
        
        let maxSize = CGSize(width: label.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        let textSize = (label.text ?? "").boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font!], context: nil)
        
        let numberOfLines = Int(ceil(textSize.height / label.font.lineHeight))
        
        return numberOfLines
    }
}
