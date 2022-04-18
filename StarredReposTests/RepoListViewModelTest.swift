//
//  RepoListViewModelTest.swift
//  StarredReposTests
//
//  Created by abdrahman on 17/04/2022.
//

import XCTest
@testable import StarredRepos

class RepoListViewModelTest: XCTestCase {
    
    var viewModel: ReposListViewModel!
    var mockWebService: MockWebService!
    override func setUp() {
        mockWebService = MockWebService()
        viewModel = .init(repoService: mockWebService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockWebService = nil
        super.tearDown()
    }
    
    func test_loadSuccess(){
        let expectaion = self.expectation(description: "repos returned successfuly from api")
        viewModel.loadRepos(0) { cells, error in
            XCTAssertNotNil(cells)
            XCTAssertNil(error)
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_loadFailed(){
        let expectaion = self.expectation(description: "repos failed returned from api")
        viewModel.loadRepos(10000) { cells, error in
            XCTAssertNil(cells)
            XCTAssertNotNil(error)
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
