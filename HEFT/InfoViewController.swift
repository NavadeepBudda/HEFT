//
//  InfoViewController.swift
//  HEFT
//
//  Created by Samvid Konchada on 8/2/20.
//  Copyright © 2020 HEFTeam. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    

    @IBOutlet var eventLabel: UILabel!
    var myAlert = Feature()
    @IBOutlet var urgencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(myAlert.event)
        eventLabel.text = myAlert.event
        urgencyLabel.text = myAlert.urgency
        
    }
    @IBAction func InfoClicked(_ sender: Any) {
        //performSegue(withIdentifier: "toI", sender: selectedRegionTest)
    }
    
    @IBAction func DescriptClicked(_ sender: Any) {
    }
    
}
