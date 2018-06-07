//
//  ViewController.swift
//  Theme
//
//  Created by NETBIZ on 28/05/18.
//  Copyright © 2018 Netbiz.in. All rights reserved.
//

import UIKit
import ChameleonFramework
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var toolbar: UIToolbar!
    
    
    var themeColor = UIColor.black
    var themeContrastColor = UIColor.white
    
    //    var themeColor = UIColor.black {
    //        didSet{
    //            if (UserDefaults.standard.value(forKey: "themeColor") != nil) {
    //                themeColor = UserDefaults.standard.value(forKey: "themeColor") as! UIColor
    //            }
    //            else{
    //                themeColor = UIColor.black
    //            }
    //        }
    //    }
    //    var themeContrastColor = UIColor.white {
    //        didSet{
    //            if (UserDefaults.standard.value(forKey: "contrastThemeColor") != nil) {
    //                themeContrastColor = UserDefaults.standard.value(forKey: "contrastThemeColor") as! UIColor
    //            }
    //            else{
    //                themeContrastColor = UIColor.white
    //            }
    //        }
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //styleUI()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let themeColorData = UserDefaults.standard.value(forKey: "themeColor")
        let contrastColorData = UserDefaults.standard.value(forKey: "contrastThemeColor")
        
        if themeColorData == nil {
            themeColor = UIColor.black
        }
        else{
            themeColor = NSKeyedUnarchiver.unarchiveObject(with: themeColorData as! Data) as! UIColor
        }
        if contrastColorData == nil {
            themeContrastColor = UIColor.white
        }
        else{
            themeContrastColor = NSKeyedUnarchiver.unarchiveObject(with: contrastColorData as! Data) as! UIColor
        }

        
        
        
        styleUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func styleUI(){
        
        self.segmentedControl.tintColor = self.themeColor
        //self.segmentedControl.setTitleTextAttributes([NSAttributedStringKey.backgroundColor : self.themeColor], for: .normal)
        //self.segmentedControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : self.themeContrastColor], for: .normal)
        
        self.tableView.tintColor = self.themeColor
        self.tableView.layer.borderWidth = 1.0
        self.tableView.layer.borderColor = self.themeColor.cgColor
        self.tableView.separatorColor = self.themeColor
        
        self.textField.layer.borderWidth = 1.0
        self.textField.layer.masksToBounds = true
        self.textField.layer.borderColor = self.themeColor.cgColor
        self.textField.tintColor = self.themeColor
        
        self.button.backgroundColor = self.themeColor
        self.button.tintColor = self.themeContrastColor
        
        self.stepper.tintColor = self.themeColor
        
        self.mySwitch.onTintColor  = self.themeColor
        self.mySwitch.thumbTintColor = self.themeContrastColor
        
        self.slider.tintColor = self.themeColor
        self.slider.thumbTintColor = self.themeContrastColor
        
        self.datePicker.setValue(self.themeContrastColor, forKey: "textColor")
        self.datePicker.setValue(self.themeColor, forKey: "backgroundColor")
        
        self.toolbar.barTintColor = self.themeColor
        self.toolbar.tintColor = self.themeContrastColor
        
        
        Chameleon.setGlobalThemeUsingPrimaryColor(self.themeColor, with: .contrast)
        navigationController?.navigationBar.barTintColor = self.themeColor
        let contrastingColor = UIColor(contrastingBlackOrWhiteColorOn:self.themeColor, isFlat: true)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : contrastingColor]
        
        
        
    }
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) 
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    
}

