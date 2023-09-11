//
//  ViewController.swift
//  NewsPosts
//
//  Created by Solovei Ihor on 10.09.2023.
//

import UIKit

class PostsController: UITableViewController {
    
    private var apiManager = ApiManager()
    private var expandedCell: Set<Int> = Set()
    
    
    @IBOutlet weak var sortButton: UIBarButtonItem!

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
            
           
            if expandedCell.contains(indexPath.row) {
                cell.postText?.numberOfLines = 0
                cell.expandButton.setTitle("Collapse", for: .normal)
            } else {
                cell.postText?.numberOfLines = 2
                cell.expandButton.setTitle("Expand", for: .normal)
            }
            
            cell.expandButtonPressed = {
                if self.expandedCell.contains(indexPath.row) {
                    self.expandedCell.remove(indexPath.row)
                } else {
                    self.expandedCell.insert(indexPath.row)
                }
                
                tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
            
            let numberOfLines = numberOfVisibleLines(in: cell.postText)

            if numberOfLines > 2 {
                    cell.expandButton.isHidden = false
                } else {
                    cell.expandButton.isHidden = true
                }
        }
        
        return cell
    }
    
    
    //MARK: - Sorting posts
    
    @IBAction func sortPosts(sender: UIBarButtonItem) {
        
        expandedCell.removeAll()
        
        //Create alert to show options
        let alert = UIAlertController(title: "Sort by", message: "choose option", preferredStyle: .actionSheet)
        
        let sortByDateAction = UIAlertAction(title: "Sort by date", style: .default) { _ in
            
            self.apiManager.sortPostsByDate()
            self.tableView.reloadData()
            
        }
        alert.addAction(sortByDateAction)
        
        let sortByLikesAction = UIAlertAction(title: "Sort by likes", style: .default) { _ in

            self.apiManager.sortPostsByLikes()
            self.tableView.reloadData()
            
        }
        alert.addAction(sortByLikesAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.barButtonItem = sortButton
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Expand/Collapse text

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func numberOfVisibleLines(in label: UILabel) -> Int {
        
        let maxSize = CGSize(width: label.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        let textSize = (label.text ?? "").boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font!], context: nil)
        
        let numberOfLines = Int(ceil(textSize.height / label.font.lineHeight))
        
        return numberOfLines
    }
    
    
}

