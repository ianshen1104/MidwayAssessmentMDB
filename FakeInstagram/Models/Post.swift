//
//  Post.swift
//  FakeInstagram
//
//  Created by Ian Shen on 2/22/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var img : UIImage
    var cap : String
    var person : String
    
    init(image : UIImage, caption: String, name : String) {
        img = image
        cap = caption
        person = name
    }
    
}
