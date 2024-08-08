import XCTest
@testable import UIKitCoordinator

final class BaseCoordinatorTests: XCTestCase {

    func testStartMethodCalled() {
        let coordinator = MockBaseCoordinator()
        coordinator.start()

        XCTAssertTrue(coordinator.startCalled, "Start method should be called.")
    }

    func testIsCompletedClosureCalled() {
        let coordinator = MockBaseCoordinator()
        let expectation = self.expectation(description: "Completion closure should be called")

        coordinator.isCompleted = {
            expectation.fulfill()
        }

        coordinator.isCompleted?()

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testAddChildCoordinator() {
        let parentCoordinator = MockBaseCoordinator()
        let childCoordinator = MockBaseCoordinator()

        parentCoordinator.addChild(childCoordinator)

        XCTAssertEqual(parentCoordinator.childCoordinators.count, 1, "Child coordinator should be added.")
        XCTAssertTrue(parentCoordinator.childCoordinators.first === childCoordinator, "Child coordinator should be the same instance.")
    }

    func testRemoveChildCoordinator() {
        let parentCoordinator = MockBaseCoordinator()
        let childCoordinator = MockBaseCoordinator()

        parentCoordinator.addChild(childCoordinator)
        parentCoordinator.removeChild(childCoordinator)

        XCTAssertEqual(parentCoordinator.childCoordinators.count, 0, "Child coordinator should be removed.")
    }

    func testRemoveChildCoordinator_NotInList() {
        let parentCoordinator = MockBaseCoordinator()
        let childCoordinator = MockBaseCoordinator()
        let anotherChildCoordinator = MockBaseCoordinator()

        parentCoordinator.addChild(childCoordinator)
        parentCoordinator.removeChild(anotherChildCoordinator)

        XCTAssertEqual(parentCoordinator.childCoordinators.count, 1, "Coordinator not in the list should not affect the existing coordinators.")
    }

    func testAddMultipleChildCoordinators() {
        let parentCoordinator = MockBaseCoordinator()
        let firstChildCoordinator = MockBaseCoordinator()
        let secondChildCoordinator = MockBaseCoordinator()

        parentCoordinator.addChild(firstChildCoordinator)
        parentCoordinator.addChild(secondChildCoordinator)

        XCTAssertEqual(parentCoordinator.childCoordinators.count, 2, "Both child coordinators should be added.")
        XCTAssertTrue(parentCoordinator.childCoordinators.contains { $0 === firstChildCoordinator }, "First child coordinator should be in the list.")
        XCTAssertTrue(parentCoordinator.childCoordinators.contains { $0 === secondChildCoordinator }, "Second child coordinator should be in the list.")
    }
}
