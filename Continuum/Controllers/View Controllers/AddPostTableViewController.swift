//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Maxwell Poffenbarger on 2/5/20.
//  Copyright © 2020 Max Poff. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
  
  //MARK: - IBOutlets
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var selectPhotoButton: UIButton!
  @IBOutlet weak var captionTextField: UITextField!
  
  //MARK: - View Lifecycle Methods
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    photoImageView.image = nil
    captionTextField.text = nil
    selectPhotoButton.setTitle("Select Photo", for: .normal)
  }
  
  //MARK: - Actions
  @IBAction func selectPhotoButtonTapped(_ sender: UIButton) {
    photoImageView.image = #imageLiteral(resourceName: "spaceEmptyState")
    selectPhotoButton.setTitle("", for: .normal)
  }
  
  @IBAction func addPostButtonTapped(_ sender: UIButton) {
    guard let photo = photoImageView.image,
      let caption = captionTextField.text else { return }
    PostController.sharedInstance.createPostWith(image: photo, caption: caption) { (post) in
      
    }
    self.tabBarController?.selectedIndex = 0
  }
  
  @IBAction func cancelButtonTapped(_ sender: Any) {
    self.tabBarController?.selectedIndex = 0
  }
    
}//End of class
