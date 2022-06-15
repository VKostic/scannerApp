//
//  TestNavCont.swift
//  scannerApp
//
//  Created by Vladica Kostic on 10.6.22..
//

import UIKit

class TestNavCont: UINavigationController {
    
    func colorBar(){
    navigationBar.tintColor = .red
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        colorBar()
    }
}
