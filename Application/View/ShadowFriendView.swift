//
//  ShadowFriendView.swift
//  Application
//
//  Created by admin on 05/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ShadowFriendView: UIView {

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
 
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize.zero
      
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
