import Dip

public enum DipCore {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()
        DependencyContainer.uiContainers = [container]
        return container
    }()
}
