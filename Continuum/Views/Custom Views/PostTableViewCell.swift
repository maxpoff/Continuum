//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Maxwell Poffenbarger on 2/5/20.
//  Copyright © 2020 Max Poff. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var postPhotoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    //MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Class Methods
    func updateViews() {
        self.postPhotoImageView.image = post?.photo
        self.captionLabel.text = post?.caption
        self.commentCountLabel.text = "Comments: \(post?.comments.count ?? 0)"
    }
}//End of class
