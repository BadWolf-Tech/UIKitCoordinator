import XCTest
@testable import UIKitCoordinator

final class AppCoordinatorTests: XCTestCase {

    var window: UIWindow!
    var navigationController: UINavigationController!
    var appCoordinator: AppCoordinator!
    var mockCoordinator: MockBaseCoordinator!

    override func setUp() {
        super.setUp()
        window = UIWindow()
        navigationController = UINavigationController()
        mockCoordinator = MockBaseCoordinator()
        appCoordinator = AppCoordinator(window: window, navigationController: navigationController, mainCoordinator: mockCoordinator)
    }

    override func tearDown() {
        window = nil
        navigationController = nil
        appCoordinator = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testAppCoordinatorStart() {
        appCoordinator.start()

        XCTAssertNotNil(window.rootViewController, "Root view controller should be set.")
        XCTAssertTrue(window.rootViewController is UINavigationController, "Root view controller should be a UINavigationController.")
        XCTAssertEqual(window.rootViewController as? UINavigationController, navigationController, "Root view controller should be the same navigation controller.")
    }

    func testMockCoordinatorStartCalled() {
        appCoordinator.start()

        XCTAssertTrue(mockCoordinator.startCalled, "MockCoordinator's start method should be called.")
    }
}
