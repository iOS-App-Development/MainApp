//
//  Strings.swift
//  Localization-Tutorial
//
//  Created by Muzammil Peer on 29/10/2021.
//  Copyright © 2021 Aman Aggarwal. All rights reserved.
//

import Foundation

extension String {
    
    var localized:String  {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: self, comment: self)
    }
}
