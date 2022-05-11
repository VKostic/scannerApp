//
//  RotateAndZoomVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 4.5.22..
//

import UIKit

class RotateAndZoomVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    var quad: Quadrilateral?
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        scrollView.delegate = self
//        scrollView.minimumZoomScale = 1.0
//        scrollView.maximumZoomScale = 3.0
        super.viewDidLoad()
        guard let image = image else { return }
        imageView.image = image
    }
    
    @IBAction func closeTapped(_ sender: UIBarButtonItem) {
        guard let backToHome = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        backToHome.modalPresentationStyle = .fullScreen
        self.present(backToHome, animated: true, completion: nil)
    }
    
    @IBAction func rotateTapped(_ sender: UIBarButtonItem) {
        let editView = EditImageViewController(image: image!, quad: quad)
        editView.rotateImage()
        imageView.image = editView.imageView.image
        image = editView.imageView.image
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        guard let reviewController = self.storyboard?.instantiateViewController(withIdentifier: "ReviewVC") as? ReviewVC else { return }
        reviewController.modalPresentationStyle = .fullScreen
        reviewController.image = image
        reviewController.quad = quad
        navigationController?.pushViewController(reviewController, animated: false)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
//        slider.minimumValue = 1.0
//        slider.maximumValue = 3.0
        scrollView.zoomScale = CGFloat(slider.value)
    }
    
    func currentZoom() {
        let zoom = scrollView.zoomScale
        slider.value = Float(zoom)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        currentZoom()
    }
}
