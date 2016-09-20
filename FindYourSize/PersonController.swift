//
//  ViewController.swift
//  FindYourSize
//
//  Created by Ben Goldberg on 8/2/16.
//  Copyright © 2016 Ben Goldberg. All rights reserved.
//

import UIKit

class PersonController: UIViewController {
    
    var person: String!
    
    @IBAction func getPerson(_ sender: AnyObject) {
        switch sender.currentTitle!! {
        case "WOMEN", "FEMMES", "DONNE":
            person = "WOMEN"
        case "MEN", "HOMMES", "UOMINI":
            person = "MEN"
        case "GIRLS", "FILLES", "RAGAZZE":
            person = "GIRLS"
        case "BOYS", "GARÇONS", "RAGAZZI":
            person = "BOYS"
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! CountryController
        dest.person = person
    }
}
