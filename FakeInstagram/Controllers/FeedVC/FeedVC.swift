//
//  File.swift
//  FakeInstagram
//
//  Created by Ian Shen on 2/22/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class FeedVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var postList: [Post]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPostList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Post Feed"
    }
    
    func setupPostList() {
        let db = Database.database().reference()
        let postsNode = db.child("posts")
        usersNode.observeSingleEvent(of: .value) { (snapshot) in
            guard let posts = snapshot.value as? [String: String] else {
                print("post error")
                return
            }
            for (post, _) in posts {
                var newPost : Post!
                //Create Post object by assigning data fetched into init of Post
                guard let userInfoDict = userDict[userId] else {
                    print("post error 2")
                    return
                }
                self.postList.append(newPost!)
            }
            self.tableView.reloadData()
        }
    }
    
}
