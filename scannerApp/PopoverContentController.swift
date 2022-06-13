//
//  PopoverContentController.swift
//  scannerApp
//
//  Created by Vladica Kostic on 12.6.22..
//

import UIKit

class PopoverContentController: UIViewController {
    
    var tableViewController: ThirdTableVC?
    
    var cellText = "Prihod"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewController = self.children[0] as? ThirdTableVC
        tableViewController?.delegate = self
    }
    
    func getText() -> String? {
        cellText = (tableViewController?.cellText)!
        return cellText
    }
}
