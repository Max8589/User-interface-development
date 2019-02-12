//
//  FriendView.swift
//  Application
//
//  Created by admin on 04/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FriendView: UIView {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        
    }
 /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
       
       
    }
*/
}
