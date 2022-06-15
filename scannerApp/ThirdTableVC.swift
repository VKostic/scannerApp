//
//  ThirdTableVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 12.6.22..
//

import UIKit

class ThirdTableVC: UITableViewController {
    
    @IBOutlet var thirdTableVC: UITableView!
    
    var cellText: String?
    
    weak var delegate : ProfileTableViewControllerDelegate?
    
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
                cellText = "Prihod"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
