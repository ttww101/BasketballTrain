//
//  SimSettingVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimSettingVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var homeTF: UITextField!
    @IBOutlet weak var awayTF: UITextField!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var stopLabel: UILabel!
    
    var homeName = "主队"
    var awayName = "客队"
    var quarter = 2
    var min = 5
    var stop = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTF.delegate = self
        awayTF.delegate = self

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if homeTF.text != "" { homeName = homeTF.text ?? "主队" }
        if awayTF.text != "" { awayName = awayTF.text ?? "客队" }
        if let desVC = segue.destination as? SimPlayVC {
            desVC.simPlayModel = SimPlayModel(home: homeName, away: awayName, quarter: quarter, min: min, stop: stop)
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 6
    }

    @IBAction func quarterChange(_ sender: UISegmentedControl) {
        quarter = 2 + (sender.selectedSegmentIndex * 2)
    }
    @IBAction func minChange(_ sender: UIStepper) {
        min = Int(sender.value)
        minLabel.text = "\(min)"
    }
    @IBAction func stopChange(_ sender: UIStepper) {
        stop = Int(sender.value)
        stopLabel.text = "\(stop)"
    }
}
