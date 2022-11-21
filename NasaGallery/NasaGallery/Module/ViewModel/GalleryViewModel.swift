//
//  GalleryViewModel.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import Foundation

class ViewModel {
    var serviceResponse: [ProductResponseModelElement]?

    func fetchData(closureHanlder: @escaping(_ status: Bool) -> Void) {
        let url = ApiConstansts.fetchUrl(.nasaPictures)
        
//        guard let url = URL(string: "https://raw.githubusercontent.com/obvious/take-home-exercise-data/trunk/nasa-pictures.json") else { return }
        
        ServiceWorker.fetch(url: url) { (responseData: ProductResponseModel) in
            self.serviceResponse = responseData
            closureHanlder(true)
        }
    }
}
