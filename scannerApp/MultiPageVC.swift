//
//  MultiPageVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 30.4.22..
//

import UIKit

class MultiPageVC: UIViewController {
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftBotImage: UIImageView!
    @IBOutlet weak var rightBotImage: UIImageView!
    
    func addImages() {
        if imageArray.count == 1 {
            leftImage.image = imageArray[0]
        }
        
        if imageArray.count == 2 {
            leftImage.image = imageArray[0]
            rightImage.image = imageArray[1]
        }
        
        if imageArray.count == 3 {
            leftImage.image = imageArray[0]
            rightImage.image = imageArray[1]
            leftBotImage.image = imageArray[2]
        }
        
        if imageArray.count == 4 {
            leftImage.image = imageArray[0]
            rightImage.image = imageArray[1]
            leftBotImage.image = imageArray[2]
            rightBotImage.image = imageArray[3]
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addImages()
    }
    
    @IBAction func exitTapped(_ sender: UIBarButtonItem) {
        guard let backToHome = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        backToHome.modalPresentationStyle = .fullScreen
        self.present(backToHome, animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        guard let backToScanner = self.storyboard?.instantiateViewController(withIdentifier: "ScannerVC") else { return }
        backToScanner.modalPresentationStyle = .fullScreen
        self.present(backToScanner, animated: true, completion: nil)
    }
}
