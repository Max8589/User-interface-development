//
//  FriendViewController.swift
//  VKApp
//
//  Created by admin on 10/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    
    @IBOutlet weak var likeButton: LikeButton?
    
    @IBAction func likeButtonChanged() {
        print("likeButtonChanged")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Friend"
    }

}
