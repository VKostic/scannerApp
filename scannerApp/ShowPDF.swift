//
//  ShowPDF.swift
//  scannerApp
//
//  Created by Vladica Kostic on 4.5.22..
//

import UIKit
import PDFKit

class ShowPDF: UIViewController {
    
    var documentData: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let activityController = UIActivityViewController(activityItems: [documentData!], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    @IBAction func backToBeginning(_ sender: UIBarButtonItem) {
        imageArray = []
        guard let backToHome = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        backToHome.modalPresentationStyle = .fullScreen
        self.present(backToHome, animated: true, completion: nil)
    }
}
