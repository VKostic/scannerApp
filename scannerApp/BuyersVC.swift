//
//  BuyersVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 13.6.22..
//

import UIKit

class BuyersVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var allButton: CheckBox!
    @IBOutlet weak var wasBlockedButton: CheckBox!
    @IBOutlet weak var blockedButton: CheckBox!
    @IBOutlet weak var notBlockedButton: CheckBox!
    @IBOutlet weak var tableView: UITableView!
    
    var companiesHealth: [Company]?
    
    var niz1 = ["A1 Hrvatska", "Grafika", "KING d.o.o."]
    let niz2 = ["Prihod 10", "Prihod 20", "Prihod 30"]
    let niz = ["redEllipse", "greenEllipse", "yellowEllipse"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBarr()
        self.toolbarr()
        tableView.dataSource = self
        tableView.isHidden = true
    }
    
    @IBAction func allTapped(_ sender: CheckBox) {
        if !allButton.isChecked {
            tableView.reloadData()
            tableView.isHidden = false
        }
    }
    
    @IBAction func notBlockedTapped(_ sender: CheckBox) {
        if !notBlockedButton.isChecked {
            tableView.reloadData()
            tableView.isHidden = false
        }
    }
    
    @IBAction func blockedTapped(_ sender: CheckBox) {
        if !blockedButton.isChecked {
            tableView.reloadData()
            tableView.isHidden = false
        }
    }
    
    @IBAction func wasBlockedTapped(_ sender: CheckBox) {
        if !wasBlockedButton.isChecked {
            tableView.reloadData()
            tableView.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return niz1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BuyersCell
        if allButton.isChecked {
            cell.buyersNameLabel.text = niz1[indexPath.row]
            cell.buyersSubtitle.text = niz2[indexPath.row]
            cell.buyersImage.image = UIImage(named: niz[indexPath.row])
        } else if notBlockedButton.isChecked && !blockedButton.isChecked && !wasBlockedButton.isChecked {
            cell.buyersNameLabel.text = niz1[1]
            cell.buyersSubtitle.text = niz2[1]
            cell.buyersImage.image = UIImage(named: niz[1])
        } else if notBlockedButton.isChecked && blockedButton.isChecked && !wasBlockedButton.isChecked {
            cell.buyersNameLabel.text = niz1[1]
            cell.buyersSubtitle.text = niz2[1]
            cell.buyersImage.image = UIImage(named: niz[1])
        }
        else if blockedButton.isChecked {
            cell.buyersNameLabel.text = niz1[0]
            cell.buyersSubtitle.text = niz2[0]
            cell.buyersImage.image = UIImage(named: niz[0])
        } else if wasBlockedButton.isChecked {
            cell.buyersNameLabel.text = niz1[2]
            cell.buyersSubtitle.text = niz2[2]
            cell.buyersImage.image = UIImage(named: niz[2])
        }
        return cell
    }
}
