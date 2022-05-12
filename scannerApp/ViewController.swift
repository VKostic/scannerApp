//
//  ViewController.swift
//  scannerApp
//
//  Created by Vladica Kostic on 29.4.22..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    let buttonAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 18),
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    
    @IBAction func startScannerTapped(_ sender: UIButton) {
        guard let scannerView = self.storyboard?.instantiateViewController(withIdentifier: "ScannerVC") else { return }
        scannerView.modalPresentationStyle = .fullScreen
        self.present(scannerView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonText = NSMutableAttributedString(string: "Pokreni skener", attributes: buttonAttributes)
        startButton.setAttributedTitle(buttonText, for: .normal)
    }
}
