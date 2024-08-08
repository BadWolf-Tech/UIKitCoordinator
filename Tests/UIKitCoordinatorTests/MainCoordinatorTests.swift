import XCTest
@testable import UIKitCoordinator

final class MainCoordinatorTests: XCTestCase {

    var navigationController: UINavigationController!
    var mainCoordinator: MockMainCoordinator!

    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        mainCoordinator = MockMainCoordinator(navigationController: navigationController)
    }

    override func tearDown() {
        navigationController = nil
        mainCoordinator = nil
        super.tearDown()
    }

    func testMainCoordinatorStart() {
        mainCoordinator.start()

        XCTAssertTrue(mainCoordinator.startCalled, "Start method should be called.")
        XCTAssertNotNil(mainCoordinator.pushedViewController, "ViewController should be pushed.")
        XCTAssertTrue(mainCoordinator.pushedViewController is MockViewController, "Pushed view controller should be of type MockViewController.")
    }

    func testNavigationControllerAfterStart() {
        mainCoordinator.start()

        XCTAssertEqual(navigationController.viewControllers.count, 1, "Navigation controller should have one view controller.")
        XCTAssertTrue(navigationController.viewControllers.first is MockViewController, "First view controller should be of type MockViewController.")
    }
}
