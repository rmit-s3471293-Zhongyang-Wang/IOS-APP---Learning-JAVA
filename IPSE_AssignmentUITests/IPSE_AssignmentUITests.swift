//
//  IPSE_AssignmentUITests.swift
//  IPSE_AssignmentUITests
//
//  Created by 扬 on 16/4/22.
//  Copyright © 2016年 扬. All rights reserved.
//

import XCTest

class IPSE_AssignmentUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /**test if discussion board can post message*/
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let discussButton = app.buttons["Discuss"]
        discussButton.tap()
        app.navigationBars["Discussion Board"].buttons["New Post"].tap()
        
        let textView = app.otherElements.containingType(.NavigationBar, identifier:"IPSE_Assignment.addPostView").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.TextView).element
        textView.tap()
        textView.typeText("unittest")
        app.buttons["POST"].tap()
        discussButton.tap()
        app.tables.staticTexts["Unit test"].tap()
        XCTAssert(app.tables.staticTexts["Unit test"].exists)
    }
    
    /**see if video can fetch from youtube successfully and load correctly**/
    func testExample1(){
        
        let app = XCUIApplication()
        app.buttons["Video"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        XCTAssert(app.buttons["Watch Java Programming Tutorial - 3 - Downloading Eclipse"].exists)
    }
    
    /**test if GO-Test functino can mark correctly**/
    func  testExample2(){
        let app = XCUIApplication()
        app.buttons["Go Test"].tap()
        app.buttons["false"].tap()
        app.buttons["x=4,y=6"].tap()
        app.buttons["Value for i = 1 value for j = 1"].tap()
        app.buttons["continue"].tap()
        app.buttons["int c[][] = new int[10][10];"].tap()
        XCTAssert(app.staticTexts["60"].exists)
    }
    
    /**test if lessons content can be load successfully**/
    func testExample3(){
        
        let app = XCUIApplication()
        app.buttons["Chapter 2: Structures"].tap()
        app.otherElements.containingType(.NavigationBar, identifier:"UIView").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Button).matchingIdentifier("GO").elementBoundByIndex(1).tap()
    XCTAssert(app.staticTexts["There may be a situation when you need to execute a block of code several number of times. In general, statements are executed sequentially: The first statement in a function is executed first, followed by the second, and so on. "].exists)
    }
    
    /***check if discussionboard can init original test messages**/
    func testExample4() {
        
        let app = XCUIApplication()
        app.buttons["Discuss"].tap()
        
        let tablesQuery = app.tables
        
        XCTAssert(tablesQuery.staticTexts["Example: How to Study Java? s3471293@student.rmit.edu.au"].exists)
        XCTAssert(tablesQuery.staticTexts["Example: How to turn Int into String? young90326@gmail.com"].exists)
        XCTAssert(tablesQuery.staticTexts["Example: This app is exciting! 381289116@qq.com"].exists)
    }
    
}
