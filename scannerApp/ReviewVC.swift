//
//  ReviewVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 30.4.22..
//

import UIKit
import PDFKit

var imageArray: [ImageData] = []

class ReviewVC: UIViewController {
    
    @IBOutlet weak var reviewImageView: UIImageView!
    var image: UIImage?
    var quad: Quadrilateral?
    
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
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        if let image = image {
            let imageData = ImageData(image: image)
            imageArray.append(imageData)
        }
        
        print("Broj slika: ", imageArray.count)
        guard let multiPage = self.storyboard?.instantiateViewController(withIdentifier: "MultiPageVC") as? MultiPageVC else { return }
        multiPage.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(multiPage, animated: false)
    }
    
    @IBAction func pdfButtonTapped(_ sender: UIButton) {
        let pageBounds = CGRect(x: 0, y: 0, width: 595, height: 842)
        let margin: CGFloat = 40
        let imageMaxWidth = pageBounds.width - (margin * 2)
        let imageMaxHeight = pageBounds.height - (margin * 2)
        
        DispatchQueue.main.async {
            let pdfDocument = PDFDocument()
            let sizeOfImage = self.image!.size.scaleFactor(forMaxWidth: imageMaxWidth, maxHeight: imageMaxHeight)
            self.image = self.image!.scaledImage(scaleFactor: sizeOfImage)!
            let pdfPage = PDFPage(image: self.image!)
            pdfDocument.insert(pdfPage!, at: 0)
            
            guard let documentData = pdfDocument.dataRepresentation() else { return }
            
            guard let showPDF = self.storyboard?.instantiateViewController(withIdentifier: "ShowPDF") as? ShowPDF else { return }
            showPDF.modalPresentationStyle = .fullScreen
            showPDF.documentData = documentData
            self.navigationController?.pushViewController(showPDF, animated: false)
        }
    }
}

struct ImageData {
    var image = UIImage()
}
