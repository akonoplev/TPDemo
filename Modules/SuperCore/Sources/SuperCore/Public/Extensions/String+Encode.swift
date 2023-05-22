//
//  String+Encode.swift
//  
//
//  Created by Илья on 26.01.2022.
//

import UIKit

public extension String {

    var base64: String {
        Data(self.utf8).base64EncodedString()
    }

}
