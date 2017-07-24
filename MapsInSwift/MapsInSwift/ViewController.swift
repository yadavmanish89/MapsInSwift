//
//  ViewController.swift
//  MapsInSwift
//
//  Created by MANISH on 24/07/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.titleView = self.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

