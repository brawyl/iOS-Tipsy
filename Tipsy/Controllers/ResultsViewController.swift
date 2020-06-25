//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Brandon Wylie on 2020-06-25.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var summary: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = total
        settingsLabel.text = summary
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
