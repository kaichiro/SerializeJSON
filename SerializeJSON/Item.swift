//
//  Item.swift
//  SerializeJSON
//
//  Created by Aluno on 05/04/2019.
//  Copyright © 2019 kaichiro. All rights reserved.
//

import Foundation
import UIKit

class Item: NSObject {
    var classification: Int
    var image: String
    var itemName: String
    init(classification: Int, image: String, itemName: String)
    {
        self.classification = classification
        self.image = image
        self.itemName = itemName
    }
}
