//
//  HNImporterTests.swift
//  HNImporterTests
//
//  Created by Chad Parker on 4/17/21.
//

import XCTest
@testable import HNImporter

class HNImporterTests: XCTestCase {

    func testDataFilePathsExist() {
        let sut = PostImporter()
        let filePaths = sut.getDataFilePaths()
        XCTAssertGreaterThan(filePaths.count, 3000)
    }
}
