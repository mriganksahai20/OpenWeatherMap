//
//  WeatherServiceExampleUITests.swift
//  WeatherServiceExampleUITests
//
//  Created by Mrigank on 02/01/20.
//  Copyright © 2019 mriganksahai. All rights reserved.
//

import XCTest

class WeatherServiceExampleUITests: XCTestCase {
    override func setUp() {
          super.setUp()
          // Put setup code here. This method is called before the invocation of each test method in the class.
      }
      
      override func tearDown() {
          // Put teardown code here. This method is called after the invocation of each test method in the class.
          super.tearDown()
      }
      
      func testPerformanceExample() {
          // This is an example of a performance test case.
          self.measure {
              // Put the code you want to measure the time of here.
          }
      }
      
      func testExtendedInfoTitleStrings() {
          
          let feelLikeInfo = ExtendedInfo.feelLike.stringValue
          XCTAssertEqual(feelLikeInfo, "FEEL LIKE:  ")
          
          let chanceOfRainInfo = ExtendedInfo.chanceOfRain.stringValue
          XCTAssertEqual(chanceOfRainInfo, "CHANCE OF RAIN:  ")
          
          let uvIndexInfo = ExtendedInfo.uvIndex.stringValue
          XCTAssertEqual(uvIndexInfo, "UV INDEX:  ")
          
          let windIndexInfo = ExtendedInfo.wind.stringValue
          XCTAssertEqual(windIndexInfo, ExtendedInfo.wind.rawValue.uppercased() + ":  ")
      }
}
