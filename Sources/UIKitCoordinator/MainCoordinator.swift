import UIKit

/// The `MainCoordinator` class is responsible for managing the main navigation flow of the application.
/// It coordinates the navigation controller and handles the presentation of view controllers.
public class MainCoordinator: BaseCoordinator {
    var navigationController: UINavigationController

    /// Initializes a new instance of `MainCoordinator`.
    /// - Parameter navigationController: The navigation controller used for managing view controllers.
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    /// Starts the main coordinator by setting up and presenting the initial view controller.
    public override func start() {
        //
        // Example usage, assuming MyViewController exists in the host app
        //
        // let viewController = MyViewController()
        // viewController.coordinator = self
        // navigationController.pushViewController(viewController, animated: false)
    }
}
