//
//  GalleryViewModel.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import Foundation

class GalleryViewModel {
    static var serviceResponse: [ProductResponseModelElement]?

    func fetchData(closureHanlder: @escaping(_ status: Bool) -> Void) {
        let url = ApiConstansts.fetchUrl(.nasaPictures)
        ServiceWorker.fetch(url: url) { (responseData: ProductResponseModel) in
            GalleryViewModel.serviceResponse = responseData
            closureHanlder(true)
        }
    }
    
    func getUrl(index: Int) -> String {
        let array = GalleryViewModel.serviceResponse?.map { $0.url }
        guard array?.count != 0 else { return "" }
        return array?[index] ?? ""
    }
    
}
