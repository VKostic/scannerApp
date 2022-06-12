//
//  FirstTableVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 9.6.22..
//

import UIKit

class FirstTableVC: UITableViewController {

    
    @IBOutlet var firstTableView: UITableView!
    
    weak var delegate : ProfileTableViewControllerDelegate?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)

          if(indexPath.row == 0){
              if let delegate = delegate {
                  delegate.showProfile()
              }
          }
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

protocol ProfileTableViewControllerDelegate: AnyObject {
  func showProfile()
}
