//
//  UIVIewController+Extension.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 25/11/22.
//

import UIKit

class ParentViewController: UIViewController {
    var alertLabel = UILabel()
    var screenSize: CGSize {
        return self.view.frame.size
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAlert()
    }
    
    func configureAlert() {
        alertLabel.frame = CGRect(x: 20, y: 20, width: 110, height: 110)
        alertLabel.text = AppGeneral.loadingText.rawValue
        alertLabel.textAlignment = .center
        alertLabel.center = self.view.center
        alertLabel.numberOfLines = 0
        alertLabel.lineBreakMode = .byWordWrapping
        view.addSubview(alertLabel)
        showAlert()
    }
    
    func showAlert() {
        alertLabel.isHidden = true
    }
    
    func hideAlert() {
        alertLabel.isHidden = false
    }
}
