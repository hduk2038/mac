//
//  SettingViewController.swift
//  12700302
//
//  Created by Dongwok Hong on 24/4/21.
//

import UIKit

class SetupController: UIViewController, UITextFieldDelegate {
    var numberSliderValue = 15
    var timeSliderValue = 60
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playerName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerName.delegate = self
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            let dest = segue.destination as! ViewController
            dest.maxBubbleNumber = numberSliderValue
            dest.remainingSeconds = timeSliderValue
            dest.player = playerName.text!
        }
    }
   
    @IBAction func slide(_ sender: UISlider) {
        if sender.tag == 1 {
            numberSliderValue = Int(sender.value)
            numberLabel.text = "\(numberSliderValue)"
        }
        if sender.tag == 2 {
            timeSliderValue = Int(sender.value)
            timeLabel.text = "\(timeSliderValue)"
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let currentText = textField.text {
            if currentText.count > 10 {
                textField.deleteBackward()
            } else {
                textField.resignFirstResponder()
            }
        }
        
        return true
    }
    
}
