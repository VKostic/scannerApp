//
//  ReusableToolbar.swift
//  scannerApp
//
//  Created by Vladica Kostic on 10.6.22..
//

import UIKit

class ReusableToolbar: UIToolbar {
    
    func setColorr() {
        self.barTintColor = .green
    }
    
    let leftButton: UIBarButtonItem = {
        let image = UIImage(named: "izbornik.png")
        let button = UIBarButtonItem(image: image, style: .plain, target: ReusableToolbar.self, action: #selector(done))
        button.tintColor = .black
        return button
    }()

    let middleButton: UIBarButtonItem = {
        let image = UIImage(named: "postavke.png")
        let button = UIBarButtonItem(image: image, style: .plain, target: ReusableToolbar.self, action: #selector(done))
        button.tintColor = .black
        return button
    }()

    let rightButton: UIBarButtonItem = {
        let image = UIImage(named: "web.png")
        let button = UIBarButtonItem(image: image, style: .plain, target: ReusableToolbar.self, action: #selector(done))
        button.tintColor = .black
        return button
    }()

    func setupp() {
        //let toolbarr = ReusableToolbar(frame: CGRect(x: 0, y: screenHeight - 50, width: screenWidth, height: 50))
    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    var items2 = [UIBarButtonItem]()
    items2.append(leftButton)
    items2.append(spacer)
    items2.append(middleButton)
    items2.append(spacer)
    items2.append(rightButton)
    self.setItems(items2, animated: false)
    }

    @objc func done(){

    }
    
//    func position(for bar: UIBarPositioning) -> UIBarPosition {
//        .bottom
//    }

}
