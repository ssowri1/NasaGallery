//
//  AppConstants.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import Foundation

struct ApiConstansts {
    // scheme
    static let scheme: String = "https"
    // host
    static let host: String = "raw.githubusercontent.com"
}

enum servicePath: String {
        // path
    case nasaPictures = "/obvious/take-home-exercise-data/trunk/nasa-pictures.json"
}

enum ScrollviewConstants: CGFloat {
    case padding = 200
}

enum AppGeneral: String {
    case galleryTitle = "Nasa Gallery"
    case loadingText = "Loading..."
}
