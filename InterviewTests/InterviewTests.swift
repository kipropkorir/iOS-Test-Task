//
//  InterviewTests.swift
//  InterviewTests
//
//  Created by Kiprop Collins Korir on 14/03/2021.
//

import XCTest
@testable import Interview

class InterviewTests: XCTestCase {

    var post: Post!
    var postList: PostsListViewModel!
    
    override func setUpWithError() throws {
        super.setUp()
        post = Post()
        postList = PostsListViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func isPostTitleNull(){
     
    }
    
    func isPostsEmpty(){
    
    }

}
