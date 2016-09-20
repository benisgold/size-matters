//
//  ConvertController.swift
//  FindYourSize
//
//  Created by Ben Goldberg on 8/7/16.
//  Copyright © 2016 Ben Goldberg. All rights reserved.
//

import UIKit

class ConvertController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var person: String!
    var country: String!
    var item: String!
    var suit = "False"
    var domesticArrays: [[String]]!
    var foreignArrays: [[String]]!
    var data: [String]!
    var picker = UIPickerView()
    var itemArrayIndex = 0
    var sizeIndex = 0
    var jacket: String?
    var shirt: String?
    var pant: String?
    var dress: String?
    var swimsuit: String?
    var shoe: String?
    
    let countryCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String
    
    // Standard Decimal System
    // US
    let WGClothingDataUS = ["000, XXXS", "00, XXS", "0, XS", "2, XS", "4, S", "6, S", "8, M", "10, M", "12, L", "14, L", "16, XL", "18, XL", "20, XXL"]
    let WShoeDataUS = ["5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12"]
    let GBShoeDataUS = ["6", "7", "8", "9", "10", "11", "12", "13", "1", "2", "3", "4", "5", "6", "7"]
    let MBTopDataUS = ["34", "36", "38", "40", "42", "44", "46"]
    let MBBottomDataUS = ["28, XS", "29, S", "30, S", "31, S", "32, M", "33, M", "34, M", "35, L", "36, L", "38, XL", "40, XL"]
    let MShoeDataUS = ["7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "12.5", "13"]
    var us: [[String]] {
        return [WGClothingDataUS, WShoeDataUS, GBShoeDataUS, MBTopDataUS, MBBottomDataUS, MShoeDataUS]
    }
    
    // UK
    let WGClothingDataUK = ["0", "2", "4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24"]
    let WShoeDataUK = ["2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5"]
    let GBShoeDataUK = ["5.5 - 6", "6 - 6.5", "7 - 7.5", "8", "9", "10", "11", "12", "13", "1", "2", "3", "4", "5", "6"]
    let MBTopDataUK = ["34", "36", "38", "40", "42", "44", "46"]
    let MBBottomDataUK = ["28", "29", "30", "31", "32", "33", "34", "35", "36", "38", "40"]
    let MShoeDataUK = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12"]
    var uk: [[String]] {
        return [WGClothingDataUK, WShoeDataUK, GBShoeDataUK, MBTopDataUK, MBBottomDataUK, MShoeDataUK]
    }
    
    // France
    let WGClothingDataFrance = ["28", "30", "32", "34", "36", "38", "40", "42", "44", "46", "48", "50", "52"]
    let WShoeDataFrance = ["35.5", "36", "36.5", "37", "37.5", "38", "38.5", "39", "39.5", "40", "40.5", "41", "41.5", "42", "42.5"]
    let GBShoeDataFrance = ["22", "23", "24 - 25", "25 - 26", "26 - 27", "27 - 28", "29 - 30", "31", "32", "33 - 34", "34 - 34", "36", "37", "38", "39"]
    let MBTopDataFrance = ["44", "46", "48", "50", "52", "54", "56"]
    let MBBottomDataFrance = ["39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "50"]
    let MShoeDataFrance = ["40", "40.5", "41", "41.5", "42", "42.5", "43", "43.5", "44", "44.5", "45", "45.5", "46"]
    var france: [[String]] {
        return [WGClothingDataFrance, WShoeDataFrance, GBShoeDataFrance, MBTopDataFrance, MBBottomDataFrance, MShoeDataFrance]
    }
    
    // Italy
    let WGClothingDataItaly = ["32", "34", "36", "38", "40", "42", "44", "46", "48", "50", "52", "54", "56"]
    let WShoeDataItaly = ["35.5", "36", "36.5", "37", "37.5", "38", "38.5", "39", "39.5", "40", "40.5", "41", "41.5", "42", "42.5"]
    let GBShoeDataItaly = ["22", "23", "24 - 25", "25 - 26", "26 - 27", "27 - 28", "29 - 30", "31", "32", "33 - 34", "34 - 34", "36", "37", "38", "39"]
    let MBTopDataItaly = ["44", "46", "48", "50", "52", "54", "56"]
    let MBBottomDataItaly = ["71", "74", "76", "79", "81", "84", "86", "89", "91", "97", "102"]
    let MShoeDataItaly = ["40", "40.5", "41", "41.5", "42", "42.5", "43", "43.5", "44", "44.5", "45", "45.5", "46"]
    var italy: [[String]] {
        return [WGClothingDataItaly, WShoeDataItaly, GBShoeDataItaly, MBTopDataItaly, MBBottomDataItaly, MShoeDataItaly]
    }
    
    // Other
    let WGClothingDataOther = ["000, XXXS (US)", "00, XXS (US)", "0, XS (US)", "2, XS (US)", "4, S (US)", "6, S (US)", "8, M (US)", "10, M (US)", "12, L (US)", "14, L (US)", "16, XL (US)", "18, XL (US)", "20, XXL (US)"]
    let WShoeDataOther = ["5", "5.5 (US)", "6", "6.5 (US)", "7 (US)", "7.5 (US)", "8 (US)", "8.5 (US)", "9 (US)", "9.5 (US)", "10 (US)", "10.5 (US)", "11 (US)", "11.5 (US)", "12 (US)"]
    let GBShoeDataOther = ["6 (US)", "7 (US)", "8 (US)", "9 (US)", "10 (US)", "11 (US)", "12 (US)", "13 (US)", "1 (US)", "2 (US)", "3 (US)", "4 (US)", "5 (US)", "6 (US)", "7 (US)"]
    let MBTopDataOther = ["34 (US)", "36 (US)", "38 (US)", "40 (US)", "42 (US)", "44 (US)", "46 (US)"]
    let MBBottomDataOther = ["28, XS (US)", "29, S (US)", "30, S (US)", "31, S (US)", "32, M (US)", "33, M (US)", "34, M (US)", "35, L (US)", "36, L (US)", "38, XL (US)", "40, XL (US)"]
    let MShoeDataOther = ["7 (US)", "7.5 (US)", "8 (US)", "8.5 (US)", "9 (US)", "9.5 (US)", "10 (US)", "10.5 (US)", "11 (US)", "11.5 (US)", "12 (US)", "12.5 (US)", "13 (US)"]
    var other: [[String]] {
        return [WGClothingDataOther, WShoeDataOther, GBShoeDataOther, MBTopDataOther, MBBottomDataOther, MShoeDataOther]
    }
    
    // European Decimal System
    // US
    let dWGClothingDataUS = ["000, XXXS", "00, XXS", "0, XS", "2, XS", "4, S", "6, S", "8, M", "10, M", "12, L", "14, L", "16, XL", "18, XL", "20, XXL"]
    let dWShoeDataUS = ["5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12"]
    let dGBShoeDataUS = ["6", "7", "8", "9", "10", "11", "12", "13", "1", "2", "3", "4", "5", "6", "7"]
    let dMBTopDataUS = ["34", "36", "38", "40", "42", "44", "46"]
    let dMBBottomDataUS = ["28, XS", "29, S", "30, S", "31, S", "32, M", "33, M", "34, M", "35, L", "36, L", "38, XL", "40, XL"]
    let dMShoeDataUS = ["7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "12.5", "13"]
    var dus: [[String]] {
        return [WGClothingDataUS, WShoeDataUS, GBShoeDataUS, MBTopDataUS, MBBottomDataUS, MShoeDataUS]
    }
    
    // UK
    let dWGClothingDataUK = ["0", "2", "4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24"]
    let dWShoeDataUK = ["2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5"]
    let dGBShoeDataUK = ["5.5 - 6", "6 - 6.5", "7 - 7.5", "8", "9", "10", "11", "12", "13", "1", "2", "3", "4", "5", "6"]
    let dMBTopDataUK = ["34", "36", "38", "40", "42", "44", "46"]
    let dMBBottomDataUK = ["28", "29", "30", "31", "32", "33", "34", "35", "36", "38", "40"]
    let dMShoeDataUK = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12"]
    var duk: [[String]] {
        return [WGClothingDataUK, WShoeDataUK, GBShoeDataUK, MBTopDataUK, MBBottomDataUK, MShoeDataUK]
    }
    
    // France
    let dWGClothingDataFrance = ["28", "30", "32", "34", "36", "38", "40", "42", "44", "46", "48", "50", "52"]
    let dWShoeDataFrance = ["35.5", "36", "36.5", "37", "37.5", "38", "38.5", "39", "39.5", "40", "40.5", "41", "41.5", "42", "42.5"]
    let dGBShoeDataFrance = ["22", "23", "24 - 25", "25 - 26", "26 - 27", "27 - 28", "29 - 30", "31", "32", "33 - 34", "34 - 34", "36", "37", "38", "39"]
    let dMBTopDataFrance = ["44", "46", "48", "50", "52", "54", "56"]
    let dMBBottomDataFrance = ["39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "50"]
    let dMShoeDataFrance = ["40", "40.5", "41", "41.5", "42", "42.5", "43", "43.5", "44", "44.5", "45", "45.5", "46"]
    var dfrance: [[String]] {
        return [WGClothingDataFrance, WShoeDataFrance, GBShoeDataFrance, MBTopDataFrance, MBBottomDataFrance, MShoeDataFrance]
    }
    
    // Italy
    let dWGClothingDataItaly = ["32", "34", "36", "38", "40", "42", "44", "46", "48", "50", "52", "54", "56"]
    let dWShoeDataItaly = ["35.5", "36", "36.5", "37", "37.5", "38", "38.5", "39", "39.5", "40", "40.5", "41", "41.5", "42", "42.5"]
    let dGBShoeDataItaly = ["22", "23", "24 - 25", "25 - 26", "26 - 27", "27 - 28", "29 - 30", "31", "32", "33 - 34", "34 - 34", "36", "37", "38", "39"]
    let dMBTopDataItaly = ["44", "46", "48", "50", "52", "54", "56"]
    let dMBBottomDataItaly = ["71", "74", "76", "79", "81", "84", "86", "89", "91", "97", "102"]
    let dMShoeDataItaly = ["40", "40.5", "41", "41.5", "42", "42.5", "43", "43.5", "44", "44.5", "45", "45.5", "46"]
    var ditaly: [[String]] {
        return [WGClothingDataItaly, WShoeDataItaly, GBShoeDataItaly, MBTopDataItaly, MBBottomDataItaly, MShoeDataItaly]
    }
    
    @IBOutlet weak var inputSize: UITextField!
    @IBOutlet weak var clothingLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeInLabel: UILabel!
    
    @IBAction func updateSizeLabel(_ sender: UITextField) {
        sizeLabel.text = foreignArrays[itemArrayIndex][sizeIndex]
        sizeLabel.textColor = UIColor.black
    }
    
    @IBAction func getView(_ sender: UIButton) {
        if person == "WOMEN" || person == "GIRLS" {
            self.performSegue(withIdentifier: "backToWG", sender: sender)
        } else if person == "BOYS" {
            self.performSegue(withIdentifier: "backToB", sender: sender)
        } else if suit == "True" {
            self.performSegue(withIdentifier: "backToSuit", sender: sender)
        } else {
            self.performSegue(withIdentifier: "backToM", sender: sender)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputSize.text = data[row]
        sizeIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        let title = data[row]
        let newTitle = NSAttributedString(string: title, attributes: [NSFontAttributeName: UIFont(name: "Futura", size: 20)!]) // 26, 17 (default?)
        label.attributedText = newTitle
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        return label
    }
    
    func donePicker() {
        if inputSize.text == "" {
            sizeIndex = 0
            inputSize.text = data[0]
        }
        inputSize.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "backToSuit":
            let dest = segue.destination as! SuitController
            dest.person = person
            dest.country = country
        case "backToWG":
            let dest = segue.destination as! WGController
            dest.person = person
            dest.country = country
        case "backToM":
            let dest = segue.destination as! MController
            dest.person = person
            dest.country = country
        case "backToB":
            let dest = segue.destination as! BController
            dest.person = person
            dest.country = country
        case "home":
            ()
        default:
            break
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryLabel.adjustsFontSizeToFitWidth = true
        clothingLabel.adjustsFontSizeToFitWidth = true
        inputSize.adjustsFontSizeToFitWidth = true
        sizeLabel.adjustsFontSizeToFitWidth = true
        
        inputSize.attributedPlaceholder = NSAttributedString(string:"enter size",
            attributes:[NSFontAttributeName:UIFont(name: "Futura", size: 60)!])
        
        countryLabel.text = country
        
        // sets sizeInLabel
        switch country {
        case "U.S.", "U.K.":
            sizeInLabel.text = "SIZE IN THE"
        case "ÉTATS-UNIS":
            sizeInLabel.text = "AUX"
        case "ROYAUME-UNI":
            sizeInLabel.text = "AU"
        case "REGNO UNITO":
            sizeInLabel.text = "NEL"
        case "STATI UNITI":
            sizeInLabel.text = "NEGLI"
        default:
            break
        }
        
        // sets clothingLabel
        switch countryCode {
        case "FR":
            jacket = "VESTE"
            shirt = "CHEMISE"
            pant = "PANTALON"
            dress = "ROBE"
            swimsuit = "MAILLOT"
            shoe = "CHAUSSURES"
        case "IT":
            jacket = "GIACCA"
            shirt = "CAMICIA"
            pant = "PANTALON"
            dress = "ROBE"
            swimsuit = "MAILLOT"
            shoe = "CHAUSSURES"
        default:
            jacket = "JACKET"
            shirt = "SHIRT"
            pant = "PANT"
            dress = "DRESS"
            swimsuit = "SWIMSUIT"
            shoe = "SHOE"
        }
        switch item {
        case "TOPS":
            if suit == "True" {
                clothingLabel.text = jacket
            } else {
                clothingLabel.text = shirt
            }
        case "BOTTOMS":
            clothingLabel.text = pant
        case "DRESSES":
            clothingLabel.text = dress
        case "SWIM":
            clothingLabel.text = swimsuit
        case "SHOES":
            clothingLabel.text = shoe
        default:
            break
        }
        
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        
        let toolBar = UIToolbar()
        toolBar.tintColor = UIColor.black
        toolBar.backgroundColor = UIColor.lightText
        toolBar.sizeToFit()
        toolBar.frame.size.height = 36.0

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(ConvertController.donePicker))
        doneButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Futura", size: 18)!], for: UIControlState()) // 20, 17 (default?)
        toolBar.setItems([doneButton], animated: true)
        
        inputSize.inputView = picker
        inputSize.inputAccessoryView = toolBar
        inputSize.textAlignment = .center // HELPPPPPP
        
        // sets domesticArrays
        switch countryCode {
        case "US":
            domesticArrays = us
        case "GB":
            domesticArrays = uk
        case "FR":
            domesticArrays = france
        case "IT":
            domesticArrays = italy
        default:
            domesticArrays = other
        }
        
        // sets foreignArrays
        switch country {
        case "U.S.":
            foreignArrays = us
        case "U.K.":
            foreignArrays = uk
        case "FRANCE":
            foreignArrays = france
        case "ITALY":
            foreignArrays = italy
        default:
            foreignArrays = other
        }
        
        // finds array for picker view
        if person == "WOMEN" {
            if item == "SHOES" {
                data = domesticArrays[1]
                itemArrayIndex = 1
            } else {
                data = domesticArrays[0]
                itemArrayIndex = 0
            }
        } else if person == "MEN" {
            if item == "TOPS" {
                data = domesticArrays[3]
                itemArrayIndex = 3
            } else if item == "BOTTOMS" {
                data = domesticArrays[4]
                itemArrayIndex = 4
            } else {
                data = domesticArrays[5]
                itemArrayIndex = 5
            }
        } else if person == "GIRLS" {
            if item == "SHOES" {
                data = domesticArrays[2]
                itemArrayIndex = 2
            } else {
                data = domesticArrays[0]
                itemArrayIndex = 0
            }
        } else {
            if item == "TOPS" {
                data = domesticArrays[3]
                itemArrayIndex = 3
            } else if item == "BOTTOMS" {
                data = domesticArrays[4]
                itemArrayIndex = 4
            } else {
                data = domesticArrays[2]
                itemArrayIndex = 2
            }
        }
    }
}
