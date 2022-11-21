//
//  GalleryModel.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import Foundation

enum ContactSection: CaseIterable {
    case favourite
    case all
}

struct Contact: Hashable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var dateOfBirth: Date?
}

// MARK: - ProductResponseModel
struct ProductResponseModelElement: Codable, Hashable {
    let copyright: String?
    let date, explanation: String
    let hdurl: String
    let mediaType: MediaType
    let serviceVersion: ServiceVersion
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}

enum MediaType: String, Codable {
    case image = "image"
}

enum ServiceVersion: String, Codable {
    case v1 = "v1"
}

typealias ProductResponseModel = [ProductResponseModelElement]
