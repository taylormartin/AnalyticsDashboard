//
//  ViewController.swift
//  AnalyticsDashboard
//
//  Created by Taylor Martin on 11/23/15.
//  Copyright © 2015 Taylor Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPress(sender: AnyObject) {
        RestApiManager.sharedInstance.requestBearerToken()
    }
}