//
//  ScannerVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 30.4.22..
//

import UIKit

class ScannerVC: UIViewController {
    
    @IBOutlet private weak var cameraView: UIView!
    
    var cameraController: CameraScannerViewController!
    var flashEnabled = false
    
    @IBAction func galleryTapped(_ sender: UIButton) {
        selectImage()
    }
    
    @IBAction func shutterButtonTapped(_ sender: UIBarButtonItem) {
        cameraController.capture()
    }
    
    @IBAction func rotateCameraTapped(_ sender: UIButton) {
    }
    
    private lazy var shutterButton: ShutterButton = {
        let button = ShutterButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(shutterButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        guard let backToHome = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        backToHome.modalPresentationStyle = .fullScreen
        self.present(backToHome, animated: true, completion: nil)
    }
    
    private lazy var flashButton: UIButton = {
        let image = UIImage(systemName: "bolt.fill", compatibleWith: nil)
        let playButton = UIButton(type: .custom)
        playButton.setImage(image, for: .normal)
        playButton.addTarget(self, action: #selector(flashTapped(_:)), for: .touchUpInside)
        playButton.tintColor = .white
        return playButton
    }()
    
    private lazy var autoScanButton: UIBarButtonItem = {
        let title = NSLocalizedString("wescan.scanning.auto", tableName: nil, bundle: Bundle(for: ScannerVC.self), value: "Auto", comment: "The auto button state")
        let button = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(toggleAutoScan(_:)))
        button.tintColor = .white
        return button
    }()
    
    @IBAction func toggleAutoScan(_ sender: UIBarButtonItem) {
        if CaptureSession.current.isAutoScanEnabled {
            CaptureSession.current.isAutoScanEnabled = false
            autoScanButton.title = NSLocalizedString("wescan.scanning.manual", tableName: nil, bundle: Bundle(for: ScannerVC.self), value: "Manual", comment: "The manual button state")
        } else {
            CaptureSession.current.isAutoScanEnabled = true
            autoScanButton.title = NSLocalizedString("wescan.scanning.auto", tableName: nil, bundle: Bundle(for: ScannerVC.self), value: "Auto", comment: "The auto button state")
        }
    }
    
    @IBAction func flashTapped(_ sender: UIButton) {
        toggleFlash()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupConstraints()
    }
    
    func selectImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    private func setupView() {
        view.addSubview(shutterButton)
        cameraController = CameraScannerViewController()
        cameraController.view.frame = cameraView.bounds
        cameraController.willMove(toParent: self)
        cameraView.addSubview(cameraController.view)
        self.addChild(cameraController)
        cameraController.didMove(toParent: self)
        cameraController.delegate = self
    }
    
    private func setupNavigationBar() {
//        navigationItem.setLeftBarButton(flashButton, animated: false)
        navigationItem.setRightBarButton(autoScanButton, animated: false)
        navigationItem.titleView = flashButton
//        navigationItem.setLeftBarButton(cancelBarButton, animated: false)
        
        if UIImagePickerController.isFlashAvailable(for: .rear) == false {
            let flashOffImage = UIImage(systemName: "bolt.slash.fill", named: "flashUnavailable", in: Bundle(for: ScannerVC.self), compatibleWith: nil)
//            flashButton.image = flashOffImage
            flashButton.setImage(flashOffImage, for: .disabled)
            flashButton.tintColor = UIColor.lightGray
        }
    }
    
    func setupConstraints() {
        var shutterConstraint = [NSLayoutConstraint]()
        
        shutterConstraint = [
            shutterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shutterButton.widthAnchor.constraint(equalToConstant: 65.0),
            shutterButton.heightAnchor.constraint(equalToConstant: 65.0)
        ]
        
        let shutterBottomConstraint = view.bottomAnchor.constraint(equalTo: shutterButton.bottomAnchor, constant: 8.0)
        shutterConstraint.append(shutterBottomConstraint)
        NSLayoutConstraint.activate(shutterConstraint)
    }
    
    @objc private func toggleFlash() {
        let state = CaptureSession.current.toggleFlash()
        
        let flashImage = UIImage(systemName: "bolt.fill", named: "flash", in: Bundle(for: ScannerVC.self), compatibleWith: nil)
        let flashOffImage = UIImage(systemName: "bolt.slash.fill", named: "flashUnavailable", in: Bundle(for: ScannerVC.self), compatibleWith: nil)
        
        switch state {
        case .on:
            flashEnabled = true
            flashButton.setImage(flashImage, for: .selected)
            flashButton.tintColor = .yellow
        case .off:
            flashEnabled = false
            flashButton.setImage(flashImage, for: .normal)
            flashButton.tintColor = .white
        case .unknown, .unavailable:
            flashEnabled = false
            flashButton.setImage(flashOffImage, for: .disabled)
            flashButton.tintColor = UIColor.lightGray
        }
    }
}

extension ScannerVC: CameraScannerViewOutputDelegate {
    func captureImageFailWithError(error: Error) {
        print(error)
    }
    
    func captureImageSuccess(image: UIImage, withQuad quad: Quadrilateral?) {
        guard let editController = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditVC else { return }
        editController.modalPresentationStyle = .fullScreen
        editController.captureImage = image
        editController.quad = quad
        navigationController?.pushViewController(editController, animated: false)
    }
}

extension ScannerVC: ImageScannerControllerDelegate {
    func imageScannerController(_ scanner: ImageScannerController, didFailWithError error: Error) {
        assertionFailure("Error occurred: \(error)")
    }
    
    func imageScannerController(_ scanner: ImageScannerController, didFinishScanningWithResults results: ImageScannerResults) {
        scanner.dismiss(animated: true, completion: nil)
    }
    
    func imageScannerControllerDidCancel(_ scanner: ImageScannerController) {
        scanner.dismiss(animated: true, completion: nil)
    }
}

extension ScannerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        guard let editVC = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditVC else { return }
        editVC.modalPresentationStyle = .fullScreen
        editVC.captureImage = image
        navigationController?.pushViewController(editVC, animated: false)
    }
}
