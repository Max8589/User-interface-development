//
//  VKApplicationViewModel.swift
//  VKApp
//
//  Created by admin on 11/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class VKApplicationViewModel: BaseViewModel {
    
    var name: String = ""
    var group: String = ""
    var photoName: String = ""
    
    init(group: String) {
        self.group = group
    }

}
