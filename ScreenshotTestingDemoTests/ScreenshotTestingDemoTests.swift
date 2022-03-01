//
//  ScreenshotTestingDemoTests.swift
//  ScreenshotTestingDemoTests
//
//  Created by Frederic Deschenes on 2022-03-01.
//

import XCTest
import iOSSnapshotTestCase
@testable import ScreenshotTestingDemo

class ScreenshotTestingDemoTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    func testExample() {
        // Load the main viewcontroller for testing
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()!
        viewController.loadViewIfNeeded()
        // Ask iOSSnapshotTestCase to check for regression
        FBSnapshotVerifyView(viewController.view)
    }
}
