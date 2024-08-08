import XCTest
@testable import UIKitCoordinator

final class CoordinatorTests: XCTestCase {

    func testAddChildCoordinator() {
        let parentCoordinator = MockCoordinator()
        let childCoordinator = MockCoordinator()

        parentCoordinator.addChild(childCoordinator)

        XCTAssertEqual(parentCoordinator.childCoordinators.count, 1, "Child coordinator should be added.")
        XCTAssertTrue(parentCoordinator.childCoordinators.first === childCoordinator, "Child coordinator should be the same instance.")
    }

    func testRemoveChildCoordinator() {
        let parentCoordinator = MockCoordinator()
        let childCoordinator = MockCoordinator()

        parentCoordinator.addChild(childCoordinator)
        parentCoordinator.removeChild(childCoordinator)

        XCTAssertEqual(parentCoordinator.childCoordinators.count, 0, "Child coordinator should be removed.")
    }

    func testRemoveChildCoordinator_NotInList() {
        let parentCoordinator = MockCoordinator()
        let childCoordinator = MockCoordinator()
        let anotherChildCoordinator = MockCoordinator()

        parentCoordinator.addChild(childCoordinator)
        parentCoordinator.removeChild(anotherChildCoordinator)

        XCTAssertEqual(parentCoordinator.childCoordinators.count, 1, "Coordinator not in the list should not affect the existing coordinators.")
    }

    func testAddMultipleChildCoordinators() {
        let parentCoordinator = MockCoordinator()
        let firstChildCoordinator = MockCoordinator()
        let secondChildCoordinator = MockCoordinator()

        parentCoordinator.addChild(firstChildCoordinator)
        parentCoordinator.addChild(secondChildCoordinator)

        XCTAssertEqual(parentCoordinator.childCoordinators.count, 2, "Both child coordinators should be added.")
        XCTAssertTrue(parentCoordinator.childCoordinators.contains { $0 === firstChildCoordinator }, "First child coordinator should be in the list.")
        XCTAssertTrue(parentCoordinator.childCoordinators.contains { $0 === secondChildCoordinator }, "Second child coordinator should be in the list.")
    }
}
