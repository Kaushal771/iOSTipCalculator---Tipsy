//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Kaushal Desai on 2021-07-31.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    var tipPercent: Int?
    var numOfPpl: String?
    var total: String?
    
//    let tipAsInt = Int(tipPercent! * 100)
    
    

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSettingsLabel: UILabel!
    
    override func viewDidLoad() {
        
        totalLabel.text = total
        tipSettingsLabel.text = "Split between \(numOfPpl!) people, with a \(tipPercent!)% tip"
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateBttnPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
