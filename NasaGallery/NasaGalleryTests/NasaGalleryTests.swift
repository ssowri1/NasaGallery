//
//  NasaGalleryTests.swift
//  NasaGalleryTests
//
//  Created by Sowrirajan S on 21/11/22.
//

import XCTest
@testable import NasaGallery

final class NasaGalleryTests: XCTestCase {

    let viewModel = GalleryViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetUrl() {
        let url = viewModel.getUrl(index: 0)
        XCTAssertEqual(url, "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")
        XCTAssertNotEqual(url, "")
    }
    
    func testFetchData() {
        let exception = expectation(description: "testService")
        let _ = viewModel.fetchData { status in
            XCTAssertEqual(status, true)
            exception.fulfill()
        }
        waitForExpectations(timeout: 2)
    }
}
