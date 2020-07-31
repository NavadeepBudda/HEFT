//
//  ViewController.swift
//  HEFT
//
//  Created by Naveen Budda on 7/31/20.
//  Copyright © 2020 HEFTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var statePicker: UIPickerView!
    
    let states = [ "AK - Alaska",
    "AL - Alabama",
    "AR - Arkansas",
    "AZ - Arizona",
    "CA - California",
    "CO - Colorado",
    "CT - Connecticut",
    "DE - Delaware",
    "FL - Florida",
    "GA - Georgia",
    "HI - Hawaii",
    "IA - Iowa",
    "ID - Idaho",
    "IL - Illinois",
    "IN - Indiana",
    "KS - Kansas",
    "KY - Kentucky",
    "LA - Louisiana",
    "MA - Massachusetts",
    "MD - Maryland",
    "ME - Maine",
    "MI - Michigan",
    "MN - Minnesota",
    "MO - Missouri",
    "MS - Mississippi",
    "MT - Montana",
    "NC - North Carolina",
    "ND - North Dakota",
    "NE - Nebraska",
    "NH - New Hampshire",
    "NJ - New Jersey",
    "NM - New Mexico",
    "NV - Nevada",
    "NY - New York",
    "OH - Ohio",
    "OK - Oklahoma",
    "OR - Oregon",
    "PA - Pennsylvania",
    "RI - Rhode Island",
    "SC - South Carolina",
    "SD - South Dakota",
    "TN - Tennessee",
    "TX - Texas",
    "UT - Utah",
    "VA - Virginia",
    "VT - Vermont",
    "WA - Washington",
    "WI - Wisconsin",
    "WV - West Virginia",
    "WY - Wyoming"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        stateLabel.text = states[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        func getPrice() {
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR") {
            URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
                if error == nil {
                    if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Double] {
                            DispatchQueue.main.async {
                                /*
                                if let usdPrice = json["USD"] {
                                    self.usdLabel.text = self.getStringFor(price: usdPrice, currencyCode: "USD")
                                    UserDefaults.standard.set(self.getStringFor(price: usdPrice, currencyCode: "USD") + "~", forKey: "USD")
                                }
                                if let eurPrice = json["EUR"] {
                                    self.eurLabel.text = self.getStringFor(price: eurPrice, currencyCode: "EUR")
                                    UserDefaults.standard.set(self.getStringFor(price: eurPrice, currencyCode: "EUR") + "~", forKey: "EUR")
                                }
                                if let jpyPrice = json["JPY"] {
                                    self.jpyLabel.text = self.getStringFor(price: jpyPrice, currencyCode: "JPY")
                                    UserDefaults.standard.set(self.getStringFor(price: jpyPrice, currencyCode: "JPY") + "~", forKey: "JPY")
                                }
                                */
                            }
                        }
                    }
                    
                    
                } else {
                    print("We have an error")
                }
            }.resume()
        }
        
    }


}

