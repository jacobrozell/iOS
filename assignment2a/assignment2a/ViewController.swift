//
//  ViewController.swift
//  assignment2a
//
//  Created by Jacob Rozell on 6/11/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var payment: UITextField!
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var loanAmt: UITextField!
    @IBOutlet weak var totalpayment: UITextField!
    
    @IBAction func calcButton(_ sender: Any) {
        guard let payment = payment.text, let rate = rate.text, let loanAmt = loanAmt.text else { totalpayment.text = "Error"; return  }
        guard let monthsAsDouble = Double(payment), let rateAsDouble = Double(rate), let loanAmtAsDouble = Double(loanAmt) else { totalpayment.text = "Error"; return }
        
        let result = paymentCalc(months: monthsAsDouble, rate: rateAsDouble, priniple: loanAmtAsDouble)
        totalpayment.text = result
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalpayment.text = ""
        
    }
    
    func paymentCalc(months: Double, rate: Double, priniple: Double) -> String {
        let payment = (rate / 100 * priniple) / (1 - pow((1 + (rate / 100)), (-1 * months)))
        return "\(round(100*payment)/100)"
    }


}

