//
//  StarredReposTests.swift
//  StarredReposTests
//
//  Created by abdrahman on 11/04/2022.
//

import XCTest
@testable import StarredRepos

class StarredReposTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testReposLoaded(){
        
        let expectaion = self.expectation(description: "repos returned from api")
        //var repoCells: [RepoCellViewModel]? = nil
        let reposListViewModel = ReposListViewModel()
        reposListViewModel.loadRepos(1) { cells,error  in
            XCTAssertNotNil(cells)
            XCTAssertNil(error)
            expectaion.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testReposNotLoaded(){
        
        let expectaion = self.expectation(description: "repos returned from api")
        //var repoCells: [RepoCellViewModel]? = nil
        let reposListViewModel = ReposListViewModel()
        reposListViewModel.loadRepos(10000) { cells,error  in
            XCTAssertNil(cells)
            XCTAssertNotNil(error)
            expectaion.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLoadReposCorrectData(){
        
        let expectaion = self.expectation(description: "repos returned from api with correct data")
        var repoCells: [RepoCellViewModel]? = nil
        let reposListViewModel = ReposListViewModel()
        reposListViewModel.loadRepos(1) { cells, error in
            repoCells = cells
            XCTAssertNotNil(repoCells)
            XCTAssertNil(error)
            XCTAssertEqual(repoCells?[0].name, "run")
            XCTAssertEqual(repoCells?[0].username, "The-Run-Philosophy-Organization")
            expectaion.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLoadReposWrongData(){
        
        let expectaion = self.expectation(description: "repos returned from api with wrong data")
        var repoCells: [RepoCellViewModel]? = nil
        let reposListViewModel = ReposListViewModel()
        reposListViewModel.loadRepos(1) { cells, error in
            repoCells = cells
            XCTAssertNotNil(repoCells)
            XCTAssertNil(error)
            XCTAssertNotEqual(repoCells?[1].name, "run")
            XCTAssertNotEqual(repoCells?[1].username, "The-Run-Philosophy-Organization")
            expectaion.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
