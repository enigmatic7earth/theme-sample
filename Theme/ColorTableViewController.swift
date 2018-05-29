//
//  ColorTableViewController.swift
//  ThemeMgr
//
//  Created by NETBIZ on 25/05/18.
//  Copyright © 2018 Netbiz.in. All rights reserved.
//

import UIKit
import ChameleonFramework
import CDAlertView

class ColorTableViewController: UITableViewController {
    var chameleonColorNames = ["Maroon (dark)","Maroon (light)",
                               "Red (dark)","Red (light)",
                               "Watermelon (dark)","Watermelon (light)",
                               "Orange (dark)","Orange (light)",
                               "Yellow (dark)","Yellow (light)",
                               "Lime (dark)","Lime (light)",
                               "Green (dark)","Green (light)",
                               "Mint (dark)","Mint (light)",
                               "Forest Green(dark)","Forest Green(light)",
                               "Teal (dark)","Teal (light)",
                               "Navy Blue(dark)","Navy Blue(light)",
                               "Blue (dark)","Blue (light)",
                               "Sky Blue(dark)","Sky Blue(light)",
                               "Powder Blue(dark)","Powder Blue (light)",
                               "Plum (dark)","Plum (light)",
                               "Purple (dark)","Purple (light)",
                               "Magenta (dark)","Magenta (light)",
                               "Pink (dark)","Pink (light)",
                               "Brown (dark)","Brown (light)",
                               "Coffee (dark)","Coffee (light)",
                               "Sand (dark)","Sand (light)",
                               "Black",
                               "Gray (dark)","Gray (light)",
                               "White (dark)","White (light)"]
    var chameleonColors = [UIColor.flatMaroonDark,UIColor.flatMaroon,
                           UIColor.flatRedDark,UIColor.flatRed,
                           UIColor.flatWatermelonDark,UIColor.flatWatermelon,
                           UIColor.flatOrangeDark,UIColor.flatOrange,
                           UIColor.flatYellowDark,UIColor.flatYellow,
                           UIColor.flatLimeDark, UIColor.flatLime,
                           UIColor.flatGreenDark,UIColor.flatGreen,
                           UIColor.flatMintDark,UIColor.flatMint,
                           UIColor.flatForestGreenDark,UIColor.flatForestGreen,
                           UIColor.flatTealDark,UIColor.flatTeal,
                           UIColor.flatNavyBlueDark,UIColor.flatNavyBlue,
                           UIColor.flatBlueDark,UIColor.flatBlue,
                           UIColor.flatSkyBlueDark,UIColor.flatSkyBlue,
                           UIColor.flatPowderBlueDark,UIColor.flatPowderBlue,
                           UIColor.flatPlumDark,UIColor.flatPlum,
                           UIColor.flatPurpleDark,UIColor.flatPurple,
                           UIColor.flatMagentaDark,UIColor.flatMagenta,
                           UIColor.flatPinkDark,UIColor.flatPink,
                           UIColor.flatBrownDark,UIColor.flatBrown,
                           UIColor.flatCoffeeDark,UIColor.flatCoffee,
                           UIColor.flatSandDark,UIColor.flatSand,
                           UIColor.flatBlack,
                           UIColor.flatGrayDark,UIColor.flatGray,
                           UIColor.flatWhiteDark,UIColor.flatWhite]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chameleonColorNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorTableViewCell

        // Configure the cell...
        cell.colorNameLabel.text = chameleonColorNames[indexPath.row]
        cell.colorView.backgroundColor = chameleonColors[indexPath.row]
        

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.5
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(chameleonColorNames [indexPath.row])")
        
        let selectedThemeColor = chameleonColors[indexPath.row]
        let alert = CDAlertView(title: "Theme", message: " Apply \(chameleonColorNames[indexPath.row]) theme?" , type: .notification)
        alert.circleFillColor = selectedThemeColor
        
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            alpha = 0
        }
        
        let doneAction = CDAlertViewAction(title: "Yes", handler: { action in
            self.applyTheme(selectedColor: selectedThemeColor)
            self.navigationController?.popViewController(animated: true)
        })
        let noAction = CDAlertViewAction(title: "No")
        alert.add(action: doneAction)
        alert.add(action: noAction)
        alert.show()
    }
    
    func applyTheme(selectedColor: UIColor) {
        Chameleon.setGlobalThemeUsingPrimaryColor(selectedColor, with: .contrast)
        navigationController?.navigationBar.barTintColor = selectedColor
        let contrastingColor = UIColor(contrastingBlackOrWhiteColorOn:selectedColor, isFlat: true)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : contrastingColor]
        saveThemeColors(thmColor: selectedColor, contrastColor: contrastingColor)
        
    }
    func saveThemeColors(thmColor: UIColor,contrastColor: UIColor)  {
        UserDefaults.standard.set(thmColor, forKey: "themeColor") 
        UserDefaults.standard.set(contrastColor, forKey: "contrastThemeColor")
    }


    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UserDefaults {
    func set(_ color: UIColor, forKey key: String) {
        set(NSKeyedArchiver.archivedData(withRootObject: color), forKey: key)
    }
    func color(forKey key: String) -> UIColor? {
        guard let data = data(forKey: key) else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? UIColor
    }
}


