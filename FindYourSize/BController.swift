//
//  BController.swift
//  FindYourSize
//
//  Created by Ben Goldberg on 8/6/16.
//  Copyright © 2016 Ben Goldberg. All rights reserved.
//

import UIKit

class BController: UIViewController {
    
    var person: String!
    var country: String!
    var item: String!
    
    @IBAction func getItem(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "TOPS", "HAUTS", "CIME":
            item = "TOPS"
        case "BOTTOMS", "BAS", "FONDELLI":
            item = "BOTTOMS"
        case "SHOES", "CHAUSSURES", "SCARPE":
            item = "SHOES"
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromB" {
            let dest = segue.destination as! CountryController
            dest.person = person
        } else {
            let dest = segue.destination as! ConvertController
            dest.person = person
            dest.country = country
            dest.item = item
        }
    }
}
