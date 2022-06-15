//
//  CompareVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 11.6.22..
//

import UIKit

class CompareVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var dropDownButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    let niz1 = ["A1 Hrvatska", "Grafika", "KING d.o.o."]
    let niz2 = ["Prihod 10", "Prihod 20", "Prihod 30"]
    let niz3 = ["11111", "22222", "33333"]
    let niz4 = ["Rashod 10", "Rashod 20", "Rashod 30"]
    
    var actionOption = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBarr()
        self.toolbarr()
        dropDown()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return niz1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CompareCell
        cell.nameLabel.text = niz1[indexPath.row]
        cell.numberLabel.text = niz3[indexPath.row]
        
        if actionOption == "Prihod" {
            cell.subtitleLabel.text = niz2[indexPath.row]
        } else if actionOption == "Rashod" {
            cell.subtitleLabel.text = niz4[indexPath.row]
        }
        return cell
    }
    
    func dropDown() {
        let optionClosure = {(action: UIAction) in
            self.actionOption = action.title
            self.tableView.reloadData()
        }
        
        dropDownButton.menu = UIMenu(children: [
            UIAction(title: "Odaberi pokazatelja", state: .on, handler: optionClosure),
            UIAction(title: "Prihod", handler: optionClosure),
            UIAction(title: "Rashod", handler: optionClosure),
            UIAction(title: "Dobit/gubitak", handler: optionClosure),
            UIAction(title: "Broj zaposlenih", handler: optionClosure)
        ])
        
        dropDownButton.showsMenuAsPrimaryAction = true
        dropDownButton.changesSelectionAsPrimaryAction = true
        dropDownButton.contentHorizontalAlignment = .left
        dropDownButton.layer.borderWidth = 1
        dropDownButton.layer.borderColor = UIColor.lightGray.cgColor
    }
}
