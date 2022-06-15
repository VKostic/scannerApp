//
//  ProfileVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 10.6.22..
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var labelAbout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBarr()
        self.toolbarr()
        labelAbout.text = "A1 Hrvatska društvo s ograničenom odgovornošću za usluge javnih telekomunikacija"
        
        tableViewController = self.children[0] as? SecondTableVC
        tableViewController?.delegate = self
    }
    
    var tableViewController: SecondTableVC?
}
