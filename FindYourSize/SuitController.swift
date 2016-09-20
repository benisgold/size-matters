//
//  SuitController.swift
//  FindYourSize
//
//  Created by Ben Goldberg on 8/9/16.
//  Copyright © 2016 Ben Goldberg. All rights reserved.
//

import UIKit

class SuitController: UIViewController {
    
    var person: String!
    var country: String!
    var item: String!
    let suit = "True"
    
    @IBAction func getItem(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "JACKET", "VESTE", "GIACCA":
            item = "TOPS"
        default:
            item = "BOTTOMS"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backFromSuit" {
            let dest = segue.destination as! MController
            dest.person = person
            dest.country = country
        } else {
            let dest = segue.destination as! ConvertController
            dest.person = person
            dest.country = country
            dest.item = item
            dest.suit = suit
        }
    }
}
