//
//  RadioStationServiceTests.swift
//  SailboatRadioTests
//
//  Created by Dmitry Mazo on 1/9/21.
//

import XCTest
@testable
import SailboatRadio

final class RadioStationServiceTests: XCTestCase {
    
    func testGetAll() throws {
        let expectation = XCTestExpectation(description: "Get list of stations")
        
        let router = MockNetworkRouter()
        let service = BrowseStationService(router: router)
        service.getAll(offset: 0) { stations in
            XCTAssertEqual(router.requestUrl?.absoluteString, "\(BrowseStationService.endpoint)/json/stations?limit=\(BrowseStationService.limit)")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 6.5)
    }
    
    func testGetByCountry() throws {
        let expectation = XCTestExpectation(description: "Get list of stations")
        
        let router = MockNetworkRouter()
        let service = BrowseStationService(router: router)
        service.getAllByCountry(offset: 0, searchValue: "TestCountry") { stations in
            XCTAssertEqual(router.requestUrl?.absoluteString, "\(BrowseStationService.endpoint)/json/stations/bycountryexact/TestCountry?limit=\(BrowseStationService.limit)")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 6.5)
    }
    
}

final class MockNetworkRouter: Router {
    private(set) var requestUrl: URL?
    
    func create(for url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        requestUrl = url
        completion(nil, nil, nil)
    }
    
    func resume() { }
    
    func cancel() { }
}
