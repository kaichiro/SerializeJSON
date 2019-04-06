//
//  ViewController.swift
//  SerializeJSON
//
//  Created by Aluno on 05/04/2019.
//  Copyright © 2019 kaichiro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UITableViewController
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func parseJson()
    {
        Alamofire.request("http://silvanomalfattiml.000webhostapp.com/cardapio.json").responseJSON
            {
                response in
                if let json =
                response.result.value as? [String:Any]
                {
                    if let nome = json["company_name"] as? String,
                        let address = json["address"] as? String,
                        let longitude = json["longitude"] as? NSString,
                        let latitude = json["latitude"] as? NSString,
                        let itens = json["itens"] as? [[String: Any]]
                }
        }
    }

}

