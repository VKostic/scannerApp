//
//  EditVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 30.4.22..
//

import UIKit

class EditVC: UIViewController {
    
    @IBOutlet weak var editView: UIView!
    var captureImage: UIImage!
    var quad: Quadrilateral?
    var editController: EditImageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func okButtonTapped(_ sender: UIBarButtonItem) {
        editController.cropImage()
        
    }
    
    @IBAction func exitTapped(_ sender: UIBarButtonItem) {
        guard let backToHome = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        backToHome.modalPresentationStyle = .fullScreen
        self.present(backToHome, animated: true, completion: nil)
    }
    
    private func setupView() {
        editController = EditImageViewController(image: captureImage, quad: quad, strokeColor: UIColor(red: (69.0 / 255.0), green: (194.0 / 255.0), blue: (177.0 / 255.0), alpha: 1.0).cgColor)
        editController.view.frame = editView.bounds
        editController.willMove(toParent: self)
        editView.addSubview(editController.view)
        self.addChild(editController)
        editController.didMove(toParent: self)
        editController.delegate = self
    }
}

extension EditVC: EditImageViewDelegate {
    func cropped(image: UIImage) {
        guard let reviewController = self.storyboard?.instantiateViewController(withIdentifier: "ReviewVC") as? ReviewVC else { return }
        reviewController.modalPresentationStyle = .fullScreen
        reviewController.image = image
        reviewController.quad = quad
        navigationController?.pushViewController(reviewController, animated: false)
    }
}
