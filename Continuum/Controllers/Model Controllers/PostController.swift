//
//  PostController.swift
//  Continuum
//
//  Created by Maxwell Poffenbarger on 2/5/20.
//  Copyright © 2020 Max Poff. All rights reserved.
//

import UIKit

class PostController {
    
    //MARK: - Properties
    static let sharedInstance = PostController()
    var posts: [Post] = []
    
    //MARK: - CRUD Functions
    func addComment(text: String, post: Post, completion: @escaping (Comment?) -> Void) {
        let comment = Comment(text: text, post: post)
        
        post.comments.append(comment)
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Post?) -> Void) {
        
        let post = Post(photo: image, caption: caption)
        
        PostController.sharedInstance.posts.append(post)
    }
    
}//End of class
