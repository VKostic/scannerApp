//
//  ProfileTableViewControllerDelegate.swift
//  scannerApp
//
//  Created by Vladica Kostic on 13.6.22..
//

import UIKit

protocol ProfileTableViewControllerDelegate: AnyObject {
    func showProfile()
    func showCompare()
    func showIban()
    func showBuyers()
    func showSuppliers()
}
