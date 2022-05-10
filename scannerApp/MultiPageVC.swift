//
//  MultiPageVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 30.4.22..
//

import UIKit
import PDFKit

class MultiPageVC: UIViewController {
    
    @IBOutlet weak var viewForImages: UIView!
    var pdfView: PDFView!
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ImageCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .black
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupConstraints()
    }
    
    @IBAction func makePDF(_ sender: UIButton) {
        generatePDF()
    }
    
    func generatePDF() {
        let pageBounds = CGRect(x: 0, y: 0, width: 595, height: 842)
        let margin: CGFloat = 40
        let imageMaxWidth = pageBounds.width - (margin * 2)
        let imageMaxHeight = pageBounds.height - (margin * 2)
        
        DispatchQueue.main.async {
            let pdfDocument = PDFDocument()
            var counter = 0
            
            for i in imageArray {
                var image = i.image
                let sizeOfImage = image.size.scaleFactor(forMaxWidth: imageMaxWidth, maxHeight: imageMaxHeight)
                image = image.scaledImage(scaleFactor: sizeOfImage)!
                let pdfPage = PDFPage(image: image)
                pdfDocument.insert(pdfPage!, at: counter)
                counter += 1
            }
            
            guard let documentData = pdfDocument.dataRepresentation() else { return }
            
            guard let showPDF = self.storyboard?.instantiateViewController(withIdentifier: "ShowPDF") as? ShowPDF else { return }
            showPDF.modalPresentationStyle = .fullScreen
            showPDF.documentData = documentData
            self.navigationController?.pushViewController(showPDF, animated: false)
        }
    }
    
    @IBAction func exitTapped(_ sender: UIBarButtonItem) {
        imageArray = []
        guard let backToHome = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        backToHome.modalPresentationStyle = .fullScreen
        self.present(backToHome, animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        guard let backToScanner = self.storyboard?.instantiateViewController(withIdentifier: "ScannerVC") else { return }
        backToScanner.modalPresentationStyle = .fullScreen
        self.present(backToScanner, animated: true, completion: nil)
    }
    
    private func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: viewForImages.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: viewForImages.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: viewForImages.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: viewForImages.bottomAnchor).isActive = true
    }
}

extension MultiPageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        cell.data = imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width/2 - 1
        let height: CGFloat = collectionView.frame.height/3 - 1
        return CGSize(width: width, height: height)
    }
}
