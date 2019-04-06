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
    var estabelecimento : Estabelecimento!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        parseJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let estabelecimento = self.estabelecimento
        {
            return estabelecimento.itens.count
        }
        else
        {
            return 0
        }
    }
   
    @IBOutlet var vrTableView: UITableView!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = vrTableView.dequeueReusableCell(withIdentifier: "cellID") as! StarCell
        
        let item = estabelecimento?.itens[indexPath.row]
        
        cell.olProdutoDescricao.text = item?.itemName

        cell.olSart1.isHighlighted = item!.classification > 0
        cell.olStar2.isHighlighted = item!.classification > 1
        cell.olStar3.isHighlighted = item!.classification > 2

        return cell

    }
    
    func parseJson()
    {
        Alamofire.request("http://silvanomalfattiml.000webhostapp.com/cardapio.json").responseJSON
        {
            response in if let json = response.result.value as? [String:Any]
            {
                if let nome = json["company_name"] as? String,
                    let address = json["address"] as? String,
                    let longitude = json["longitude"] as? NSString,
                    let latitude = json["latitude"] as? NSString,
                    let itens = json["itens"] as? [[String: Any]]
                {
                    let estabelecimento =
                        Estabelecimento(companyName: nome, address: address, latitude: latitude.doubleValue, longitude: longitude.doubleValue)
                    
                    for item in itens
                    {
                        if let classification = item["classification"] as? NSString,
                            let image = item["image"] as? String,
                            let itemName = item["item_name"] as? String
                        {
                            let novoItem = Item(classification: classification.integerValue, image: image, itemName: itemName)
                            estabelecimento.itens.append(novoItem)
                        }
                    }
                    self.estabelecimento = estabelecimento
                    self.vrTableView.reloadData()
                }
            }
        }
    }

}

