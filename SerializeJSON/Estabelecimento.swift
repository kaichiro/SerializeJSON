//
//  Estabelecimento.swift
//  SerializeJSON
//
//  Created by Aluno on 05/04/2019.
//  Copyright © 2019 kaichiro. All rights reserved.
//

import Foundation
import UIKit


class Estabelecimento: NSObject
{
    var companyName: String
    var address: String
    var latitude: Double
    var longitude: Double
    var itens:[Item] = []
    init(companyName:String, address: String, latitude: Double, longitude: Double)
    {
        self.companyName = companyName
        self.address = address
        self.longitude = longitude
        self.latitude = latitude
    }
}
