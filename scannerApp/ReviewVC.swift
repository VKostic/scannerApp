//
//  ReviewVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 30.4.22..
//

import UIKit

var imageArray: [ImageData] = []

class ReviewVC: UIViewController {
    
    var image: UIImage?
    var quad: Quadrilateral?
    
    @IBOutlet weak var reviewImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = image else { return }
        reviewImageView.image = image
    }
    @IBAction func exitTapped(_ sender: UIBarButtonItem) {
        guard let backToHome = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        backToHome.modalPresentationStyle = .fullScreen
        self.present(backToHome, animated: true, completion: nil)
    }
    
    @IBAction func rotateTapped(_ sender: UIBarButtonItem) {
        let editView = EditImageViewController(image: image!, quad: quad)
        editView.rotateImage()
        reviewImageView.image = editView.imageView.image
        image = editView.imageView.image
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        if let image = image {
            let imageData = ImageData(image: image)
            imageArray.append(imageData)
        }
        
        print("Broj slika: ", imageArray.count)
        guard let multiPage = self.storyboard?.instantiateViewController(withIdentifier: "MultiPageVC") as? MultiPageVC else { return }
        multiPage.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(multiPage, animated: false)
    }
    
    @IBAction func pdfButtonTapped(_ sender: UIBarButtonItem) {
    }
}
