//
//  ViewController.swift
//  DayFinder
//
//  Created by frensisa daudze on 17/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //resultLabel.layer.cornerRadius = 8
        
    }

    @IBAction func findButtonTapped(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        //dateComponents.day = Int(dayTextField.text!)
        guard let myDay = Int(dayTextField.text ?? ""), let myMonths = Int(monthTextField.text ?? ""), let myYear = Int(yearTextField.text ?? "") else {
            #warning(" HWcheck the input for right values warning for alert input")
            return
        }
        dateComponents.day = myDay
        dateComponents.month = myMonths
        dateComponents.day = myYear
        
        guard let myDate = calendar.date(from: dateComponents) else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "lv_LV")
        dateFormatter.dateFormat = "EEEE"
        
        
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            let weekday = dateFormatter.string(from: myDate)
            resultLabel.text = weekday.capitalized
            
        default:
            findButton.setTitle("Find", for: .normal)
            clearMyTextFields()
        }
        
    }
    
    func clearMyTextFields(){
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Result"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

