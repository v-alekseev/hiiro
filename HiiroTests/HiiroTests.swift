//
//  HiiroTests.swift
//  HiiroTests
//
//  Created by Vitaly on 26.05.2024.
//

import XCTest
@testable import Hiiro

final class HiiroTests: XCTestCase {

    func testExample() throws {

        let vc = ActivityViewModel()
        
        let day1 = vc.dateComponents[0]
        var day2 = vc.dateComponents[1]
        
        vc.selectDateComponent(day: day1)
        XCTAssertTrue(vc.dateComponents[0].isSelected == true)
        XCTAssertTrue(vc.dateComponents[1].isSelected == false)
        
        vc.selectDateComponent(day: day2)
        XCTAssertTrue(vc.dateComponents[0].isSelected == false)
        XCTAssertTrue(vc.dateComponents[1].isSelected == true)
    }


}
