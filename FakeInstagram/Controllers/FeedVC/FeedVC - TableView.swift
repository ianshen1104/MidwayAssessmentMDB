//
//  FeedVC - TableView.swift
//  FakeInstagram
//
//  Created by Ian Shen on 2/22/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
        guard let url = URL(string: Post[i].image) else { }
        guard let data = try? Data(contentsOf: url) else { }
        cell.imageView.image = UIImage(data: data)!
        cell.contentView =Post[i].cap
        
        return cell
    }
    

}
