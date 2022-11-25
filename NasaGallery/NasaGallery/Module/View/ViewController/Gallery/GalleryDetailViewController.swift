//
//  GalleryDetailViewController.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import UIKit

class GalleryDetailViewController: ParentViewController {
    
    @IBOutlet weak var contentView: UIView!
    var scrollView: UIScrollView?
    var selectedIndex: Int = 0
    let viewModel = GalleryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        scrollToInitial()
    }
    
    func configureScrollView() {
        let totalCount = GalleryViewModel.serviceResponse?.count ?? 0
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        scrollView?.delegate = self
        scrollView?.isPagingEnabled = true
        view.addSubview(scrollView!)
        scrollView?.contentSize = CGSize(width: screenSize.width * CGFloat(totalCount), height: screenSize.height - ScrollviewConstants.padding.rawValue)
        
        for i in 1...totalCount {
            let x = (screenSize.width) * CGFloat(i - 1)
            let containerView = UIView(frame: CGRect(x: x, y: 0, width: screenSize.width, height: screenSize.height))
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
            imageView.contentMode = .scaleAspectFit
            let imageUrl = viewModel.getUrl(index: i - 1)

            let url = URL(string: imageUrl)!
            ServiceWorker().downloadImage(from: url, imageView: imageView)
            containerView.addSubview(imageView)
            scrollView?.addSubview(containerView)
        }
        hideAlert()
    }
    
    func scrollToInitial() {
        let expectedView = CGRect(x: CGFloat(selectedIndex) * screenSize.width, y: 0, width: screenSize.width, height: screenSize.height)
        scrollView?.scrollRectToVisible(expectedView, animated: true)
    }
}

extension GalleryDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        selectedIndex += 1
    }
}
