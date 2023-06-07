//
//  BaseCoordinator.swift
//  
//
//  Created by Андрей Коноплев on 22.05.2023.
//

import Foundation

open class BaseCoordinator<Assembly: AnyObject, Context, Root: RootController>: CoreCoordinator, ActionHandlingCoordinatorProtocol {

    public typealias CustomHandler<T> = (_ action: T, _ didHandleAction: Bool) -> Void

    public weak var assembly: Assembly?
    public let context: Context
    public let storage: CoordinatorActionHandlerStorageProtocol

    open weak var root: Root?
    open var finish: ((_ context: FinishContext?) -> Void)?

    public var actionClosure: ActionClosure?

    public init(assembly: Assembly, context: Context, storage: CoordinatorActionHandlerStorageProtocol) {
        self.assembly = assembly
        self.storage = storage
        self.context = context
    }

    open func start() {
        fatalError("This method is abstract")
    }

    // MARK: разобрать cleanup при изменении логики на новую
    open func cleanup() {
        actionClosure = nil
    }

    // MARK: Handling actions

    public func handleCoordinatorAction(action: ActionProtocol) {
        handleAction(action: action, actionHandlers: storage.coordinatorActionHandlers)
    }

    public func handleCoordinatorAction<T>(action: ActionProtocol, customHandler: CustomHandler<T>?) {
        handleAction(action: action, customHandler: customHandler, actionHandlers: storage.coordinatorActionHandlers)
    }

    public func handleModuleAction(action: ActionProtocol) {
        handleAction(action: action, actionHandlers: storage.moduleActionHandlers)
    }

    public func handleModuleAction<T>(action: ActionProtocol, customHandler: CustomHandler<T>?) {
        handleAction(action: action, customHandler: customHandler, actionHandlers: storage.moduleActionHandlers)
    }

    @discardableResult
    private func handleAction(action: ActionProtocol, actionHandlers: [ActionHandlerProtocol]) -> Bool {
        var didHandleAction = false
        for actionHandler in actionHandlers {
            didHandleAction = actionHandler.handle(action: action, coordinator: self)
            if didHandleAction {
                return true
            }
        }

        return false
    }

    private func handleAction<T>(action: ActionProtocol, customHandler: CustomHandler<T>?, actionHandlers: [ActionHandlerProtocol]) {
        let didHandleAction = handleAction(action: action, actionHandlers: actionHandlers)

        guard let nonCommonAction = action as? T else {
            return
        }
        customHandler?(nonCommonAction, didHandleAction)
    }
}

public extension BaseCoordinator where Context == BaseCoordinatorContext {
    convenience init(assembly: Assembly, storage: CoordinatorActionHandlerStorageProtocol) {
        self.init(assembly: assembly, context: BaseCoordinatorContext(), storage: storage)
    }
}
