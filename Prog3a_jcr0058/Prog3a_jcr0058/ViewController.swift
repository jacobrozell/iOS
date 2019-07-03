//
//  ViewController.swift
//  Prog3a_jcr0058
//
//  Created by Jacob Rozell on 7/3/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let component = 1
    var selectedRow = 0
    var titles = ["Thing One", "Thing Two", "Thing Three"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    

    @IBAction func selectButton(_ sender: Any) {
        let alert = UIAlertController(title: "Selected", message: titles[selectedRow], preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { (void) in }))
        self.present(alert, animated: true, completion: nil)
    }
    
   
    @IBAction func replaceButton(_ sender: Any) {
        let item = textField.text ?? ""
        titles[selectedRow] = item
        pickerView.reloadAllComponents()
    }
    
    @IBAction func insertButton(_ sender: Any) {
        if let item = textField.text {
            titles.insert(item, at: selectedRow)
            pickerView.reloadAllComponents()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return component
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRow = row
    }
}
