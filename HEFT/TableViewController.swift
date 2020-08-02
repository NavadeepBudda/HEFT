//
//  TableViewController.swift
//  HEFT
//
//  Created by Naveen Budda on 7/31/20.
//  Copyright © 2020 HEFTeam. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var features : [Feature] = []

    func getJson() {
        if let url = URL(string: "https://api.weather.gov/alerts/active?area=GA") {
            URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
                if error == nil {
                    if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject] {
                            DispatchQueue.main.async {
                                print("Json is starting to be decoded")
                                //if let rawfeatures = json["features"] {
                                var rawfeatures = json["features"] as! [Dictionary< String, AnyObject>]
                                print("rawfeatures.count \(rawfeatures.count)")
                                var keepgoingfeatures = rawfeatures.count
                                var FeatureIndex = 0
                                while keepgoingfeatures != 0{
                                    let currentRawFeature = rawfeatures[FeatureIndex]
                                    let currentRawFeatureProperties = currentRawFeature["properties"]
                                    /*
                                    let currentFeature = Feature()
                                    currentFeature.event = currentRawFeatureProperties!["event"] as! String
                                    currentFeature.description = currentRawFeatureProperties!["description"] as! String
                                    currentFeature.instructions = currentRawFeatureProperties!["instruction"] as! String
                                    currentFeature.urgency = currentRawFeatureProperties!["urgency"] as! String
 */
                                    let currentFeature = Feature()
                                    currentFeature.event = currentRawFeatureProperties!["event"] as? String ?? "Not Provided"
                                    currentFeature.description = currentRawFeatureProperties!["description"] as? String ?? "No Description Was Provided"
                                    currentFeature.instructions = currentRawFeatureProperties!["instruction"]  as? String ?? "No Instructions Were Provided"
                                    currentFeature.urgency = currentRawFeatureProperties!["urgency"] as? String ?? "Not Provided"
                                    
                                    self.features.append(currentFeature)
                                    
                                    keepgoingfeatures -= 1
                                    FeatureIndex += 1
                                    print("Before Print Current Feature")
                                    print(currentFeature.instructions)
                                    print("After Print Current Feature")
                                }
                            }
                        }
                    }
                    
                    
                } else {
                    print("We have an error")
                }
            }.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Function Starting")
        getJson()
        print("Function Over")
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
