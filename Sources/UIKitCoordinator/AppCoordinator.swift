import UIKit

/// The `AppCoordinator` class is responsible for managing the main flow of the application.
/// It sets up the window's root view controller and starts the main coordinator.
public class AppCoordinator: BaseCoordinator {
    var window: UIWindow
    var navigationController: UINavigationController
    var mainCoordinator: Coordinator?

    /// Initializes a new instance of `AppCoordinator`.
    /// - Parameters:
    ///   - window: The main window of the application.
    ///   - navigationController: The root navigation controller for managing view controllers.
    ///   - mainCoordinator: An optional main coordinator to handle the primary navigation flow.
    public init(window: UIWindow, navigationController: UINavigationController, mainCoordinator: Coordinator? = nil) {
        self.window = window
        self.navigationController = navigationController
        self.mainCoordinator = mainCoordinator
    }

    /// Starts the app coordinator by setting up the main coordinator and configuring the window's root view controller.
    public override func start() {
        let mainCoordinator = self.mainCoordinator ?? MainCoordinator(navigationController: navigationController)
        addChild(mainCoordinator)
        mainCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
