//
//  StartVC.swift
//  scannerApp
//
//  Created by Vladica Kostic on 9.6.22..
//

import UIKit

class StartVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBarr()
        self.toolbarr()
        
        tableViewController = self.children[0] as? FirstTableVC
        tableViewController?.delegate = self
    }
    
    var tableViewController : FirstTableVC?
    
    
//    // MARK: - Toolbar
//    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//    var items = [UIBarButtonItem]()
//
//    let leftButton: UIBarButtonItem = {
//        let image = UIImage(named: "izbornik.png")
//        let button = UIBarButtonItem(image: image, style: .plain, target: StartVC.self, action: #selector(done))
//        button.tintColor = .black
//        return button
//    }()
//
//    let middleButton: UIBarButtonItem = {
//        let image = UIImage(named: "postavke.png")
//        let button = UIBarButtonItem(image: image, style: .plain, target: StartVC.self, action: #selector(done))
//        button.tintColor = .black
//        return button
//    }()
//
//    let rightButton: UIBarButtonItem = {
//        let image = UIImage(named: "web.png")
//        let button = UIBarButtonItem(image: image, style: .plain, target: StartVC.self, action: #selector(done))
//        button.tintColor = .black
//        return button
//    }()
//
//    func toolbarSetup() {
//        items.append(leftButton)
//        items.append(spacer)
//        items.append(middleButton)
//        items.append(spacer)
//        items.append(rightButton)
//        toolbarTest.setItems(items, animated: false)
//    }
    
}

extension UIViewController: ProfileTableViewControllerDelegate {
    
    func showProfile() {
        guard let showProfile = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else { return }
        showProfile.modalPresentationStyle = .fullScreen
        self.present(showProfile, animated: true, completion: nil)
        }
    
    func navigationBarr() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 65))
        navBar.barTintColor = .red
        navBar.heightAnchor.constraint(equalToConstant: 65).isActive = true
        view.addSubview(navBar)
        
        let backBiButton: UIBarButtonItem = {
            let image = UIImage(named: "backbtn.png")
            let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(done))
            button.tintColor = .white
            return button
        }()
        
        let logoImage = UIImage(named: "bilogo.png")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: 0, y: 0, width: 60, height: 25)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        logoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let menuImage = UIImage(named: "arrowMenu.png")
        let menuImageView = UIImageView(image: menuImage)
        menuImageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        menuImageView.contentMode = .scaleAspectFit
        let menuImageItem = UIBarButtonItem.init(customView: menuImageView)
        menuImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        menuImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        let titleButton = UIBarButtonItem(title: "Brod-plin d.o.o.", style: .plain, target: nil, action: nil)
        titleButton.tintColor = .white
        
        let menuHandler: UIActionHandler = { action in
            titleButton.title = action.title
        }

        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title: NSLocalizedString("Druga firma", comment: ""), handler: menuHandler),
            UIAction(title: NSLocalizedString("Treca firma", comment: ""), handler: menuHandler),
            UIAction(title: NSLocalizedString("Cetvrta firma", comment: ""), handler: menuHandler),
            UIAction(title: NSLocalizedString("Peta firma", comment: ""), handler: menuHandler)
        ])
        
        let menuButton: UIBarButtonItem = {
            let image = UIImage(named: "arrowMenu.png")
            let button = UIBarButtonItem(title: "Brod-plin d.o.o.", image: image, primaryAction: nil, menu: barButtonMenu)
            button.tintColor = .white
            button.customView?.translatesAutoresizingMaskIntoConstraints = false
            button.title = barButtonMenu.title
            return button
        }()

//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Manage", style: .plain, target: self, action: nil)
//        navigationItem.rightBarButtonItem?.menu = barButtonMenu
        let navItem = UINavigationItem()
        navItem.leftBarButtonItems = [backBiButton, imageItem]
        navItem.rightBarButtonItems = [menuButton, titleButton]
        //navItem.rightBarButtonItems = [menuImageItem, UIBarButtonItem(title: "Manage", style: .plain, target: self, action: nil)]
        //navItem.rightBarButtonItem?.menu = barButtonMenu

        navBar.setItems([navItem], animated: false)
    }
    
    @objc func done(){
        guard let backToHome = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        backToHome.modalPresentationStyle = .fullScreen
        self.present(backToHome, animated: true, completion: nil)
    }
    
    func toolbarr() {
        
        var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        
        let toolbarr = UIToolbar(frame: CGRect(x: 0, y: screenHeight - 50, width: view.frame.size.width, height: 50))
        view.addSubview(toolbarr)
        
        let leftButton: UIBarButtonItem = {
            let image = UIImage(named: "izbornik.png")
            let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(done))
            button.tintColor = .black
            return button
        }()
        
        let middleButton: UIBarButtonItem = {
            let image = UIImage(named: "postavke.png")
            let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(done))
            button.tintColor = .black
            return button
        }()
        
        let rightButton: UIBarButtonItem = {
            let image = UIImage(named: "web.png")
            let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(done))
            button.tintColor = .black
            return button
        }()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        var items = [UIBarButtonItem]()
        items.append(leftButton)
        items.append(spacer)
        items.append(middleButton)
        items.append(spacer)
        items.append(rightButton)
        toolbarr.setItems(items, animated: false)
    }
    
}
