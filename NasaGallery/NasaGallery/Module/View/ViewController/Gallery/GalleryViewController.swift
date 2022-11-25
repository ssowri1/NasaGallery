//
//  ViewController.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<ContactSection, ProductResponseModelElement>?
    private let viewModel = GalleryViewModel()    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2 - 10, height: self.view.frame.size.width/2 - 10)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = flowLayout
        serviceCall()
    }
    
    func serviceCall() {
        viewModel.fetchData(closureHanlder: { [weak self] (_) in
            DispatchQueue.main.async {
                self?.customiseTableview()
            }
        })
    }
    
    func customiseTableview() {
        collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        createContactDataSource()
        updateTableViewModels()
    }
    
    /**Define diffable datasource for tableview with the help of cell provider and assign datasource to tablview */
    func createContactDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
            cell.title.text = itemIdentifier.title
            let url = URL(string: itemIdentifier.url)!
            ServiceWorker().downloadImage(from: url, imageView: cell.imageView)
            return cell
        })
        collectionView.dataSource = dataSource
    }
    
    /**Update the contact list into current snapshot and apply updated snapshot into tableview's datasource */
    func update(_ contactList: [ProductResponseModelElement], animate: Bool = true) {
        guard let dataSource = self.dataSource else { return }
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([ContactSection.all])
        snapshot.appendItems(contactList, toSection: ContactSection.all)
        dataSource.apply(snapshot, animatingDifferences: animate, completion: nil)
    }
    
    /**Create mock data and update into tableview */
    func updateTableViewModels() {
        if let items = GalleryViewModel.serviceResponse {
            update(items)
        }
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryDetailViewController") as? GalleryDetailViewController else { return }
        viewController.selectedIndex = indexPath.row
        navigationController?.pushViewController(viewController, animated: true)
    }
}
