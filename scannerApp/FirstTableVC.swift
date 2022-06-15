//
//  FirstTableVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 9.6.22..
//

import UIKit

class FirstTableVC: UITableViewController {

    
    @IBOutlet var firstTableView: UITableView!
    
    weak var delegate: ProfileTableViewControllerDelegate?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        if(indexPath.row == 0){
            if let delegate = delegate {
                delegate.showProfile()
            }
        }
        if(indexPath.row == 1){
            if let delegate = delegate {
                delegate.showCompare()
            }
        }
        if(indexPath.row == 2){
            if let delegate = delegate {
                delegate.showBuyers()
            }
        }
        if(indexPath.row == 3){
            if let delegate = delegate {
                delegate.showSuppliers()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
