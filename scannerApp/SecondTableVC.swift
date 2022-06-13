//
//  SecondTableVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 10.6.22..
//

import UIKit

class SecondTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    weak var delegate: ProfileTableViewControllerDelegate?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        if(indexPath.row == 0){
            if let delegate = delegate {
                delegate.showIban()
            }
        }
        if(indexPath.row == 1){
            if let delegate = delegate {
                delegate.showCompare()
            }
        }
        if(indexPath.row == 2){
            if let delegate = delegate {
                delegate.showIban()
            }
        }
    }
}
