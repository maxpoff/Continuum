//
//  PostListTableViewController.swift
//  Continuum
//
//  Created by Maxwell Poffenbarger on 2/5/20.
//  Copyright © 2020 Max Poff. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.sharedInstance.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {return UITableViewCell()}

        let post = PostController.sharedInstance.posts[indexPath.row]
        
        cell.post = post

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetailVC" {
          guard let indexPath = tableView.indexPathForSelectedRow,
            let destinationVC = segue.destination as? PostDetailTableViewController else { return }
          let post = PostController.sharedInstance.posts[indexPath.row]
          destinationVC.post = post
        }
    }
}//End of class
