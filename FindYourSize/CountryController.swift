//
//  CountrySelectorController.swift
//  FindYourSize
//
//  Created by Ben Goldberg on 8/3/16.
//  Copyright © 2016 Ben Goldberg. All rights reserved.
//

import UIKit

class CountryController: UIViewController {
    
    var person: String!
    var country: String!
    
    let home = (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String
    
    @IBOutlet weak var country1: UIButton!
    @IBOutlet weak var country2: UIButton!
    @IBOutlet weak var country3: UIButton!
    
    @IBAction func getCountry(_ sender: UIButton) {
        country = sender.currentTitle
//        switch sender.currentTitle! {
//        case "U.S.", "ÉTATS-UNIS", "STATI UNITI":
//            country = "U.S."
//        case "U.K.", "ROYAUME-UNI", "REGNO UNITO":
//            country = "U.K."
//        case "ITALY", "ITALIE":
//            country = "ITALY"
//        case "FRANCE", "FRANCIA":
//            country = "FRANCE"
//        default:
//            break
//        }
    }
    
    @IBAction func getView(_ sender: UIButton) {
        switch person {
        case "WOMEN", "GIRLS":
            self.performSegue(withIdentifier: "toWG", sender: sender)
        case "MEN":
            self.performSegue(withIdentifier: "toM", sender: sender)
        case "BOYS":
            self.performSegue(withIdentifier: "toB", sender: sender)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "toWG":
            let dest = segue.destination as! WGController
            dest.person = person
            dest.country = country
        case "toM":
            let dest = segue.destination as! MController
            dest.person = person
            dest.country = country
        case "toB":
            let dest = segue.destination as! BController
            dest.person = person
            dest.country = country
        case "fromCC":
            ()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        country1.titleLabel?.adjustsFontSizeToFitWidth = true
        country2.titleLabel?.adjustsFontSizeToFitWidth = true
        country3.titleLabel?.adjustsFontSizeToFitWidth = true

        switch home {
        case "GB":
            country1.setTitle("U.S.", for: UIControlState())
            country1.layoutIfNeeded()
        case "FR":
            country2.setTitle("ÉTATS-UNIS", for: UIControlState())
            country2.layoutIfNeeded()
        case "IT":
            country3.setTitle("STATI UNITI", for: UIControlState())
            country3.layoutIfNeeded()
        default:
            ()
        }
    }
}
