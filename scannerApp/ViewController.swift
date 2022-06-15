//
//  ViewController.swift
//  scannerApp
//
//  Created by Vladica Kostic on 29.4.22..
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    let Your_token = "fd81ba38-7e7c-49ba-8770-89321e2e0e04"
    let Your_api = "jksdxjjfsdkhxyffiudfvhxnndueewpefodkcm439tufjifoas9"
    let user_eMail = "test1@email.com"
    let user_IMEI = "imei1"
    let eMail = "test1@email.com"
    
    let buttonAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 18),
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    
    @IBAction func sendTapped(_ sender: UIButton) {
        let url = "https://mojeuredproxy-test.moj-eracun.hr/api/BI/Subject_SubjectHealthConfiguration/\(user_eMail)/\(user_IMEI)"
        let headers: HTTPHeaders = [ "ApiKey" : "\(Your_api)"]
        
        AF.request(url, method: .get, headers: headers).responseString { response in
            print(response.result)
        }
    }
    
    @IBAction func startScannerTapped(_ sender: UIButton) {
        guard let scannerView = self.storyboard?.instantiateViewController(withIdentifier: "ScannerVC") else { return }
        scannerView.modalPresentationStyle = .fullScreen
        self.present(scannerView, animated: true, completion: nil)
    }
    
    @IBAction func idiNaStart(_ sender: UIButton) {
        guard let startView = self.storyboard?.instantiateViewController(withIdentifier: "StartVC") else { return }
        startView.modalPresentationStyle = .fullScreen
        self.present(startView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonText = NSMutableAttributedString(string: "Pokreni skener", attributes: buttonAttributes)
        startButton.setAttributedTitle(buttonText, for: .normal)
    }
}
