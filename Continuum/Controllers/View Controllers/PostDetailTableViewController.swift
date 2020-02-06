//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Maxwell Poffenbarger on 2/5/20.
//  Copyright © 2020 Max Poff. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    //MARK: - Properties
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Class Methods
    func updateViews() {
        guard let post = post else { return }
        photoImageView.image = post.photo
        tableView.reloadData()
    }
    
    func presentCommentAlertController() {
        let alertController = UIAlertController(title: "Add a Comment", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Comment here..."
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let commentAction = UIAlertAction(title: "Post Comment", style: .default) { (_) in
            guard let commentText = alertController.textFields?.first?.text, !commentText.isEmpty,
                let post = self.post else { return }
            
            PostController.sharedInstance.addComment(text: commentText, post: post, completion: { (comment) in })
            self.tableView.reloadData()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(commentAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Actions
    @IBAction func commentButtonTapped(_ sender: Any) {
        presentCommentAlertController()
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func followButtonTapped(_ sender: Any) {
        
    }
}
    
    // MARK: - Table view data source
    extension PostDetailTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return post?.comments.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
      let comment = post?.comments[indexPath.row]
      cell.textLabel?.text = comment?.text
      cell.detailTextLabel?.text = comment?.timestamp.formatToString()
      return cell
    }
}

