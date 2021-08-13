

import DodiDetail
import DodiList
import DodiRepository
import Foundation
import NeedleFoundation

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ListComponent") { component in
        return ListDependency9c2f5b85fb6808210ea1Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->DetailComponent") { component in
        return DetailDependencyb171f3bdca6113e7a5d9Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->RepositoryComponent") { component in
        return RepositoryDependency7488f146cdfa18e51394Provider(component: component)
    }
    
}

// MARK: - Providers

private class ListDependency9c2f5b85fb6808210ea1BaseProvider: ListDependency {
    var repositoryBuilder: RepositoryBuilder {
        return rootComponent.repositoryBuilder
    }
    var detailBuilder: DetailBuilder {
        return rootComponent.detailBuilder
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->ListComponent
private class ListDependency9c2f5b85fb6808210ea1Provider: ListDependency9c2f5b85fb6808210ea1BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
private class DetailDependencyb171f3bdca6113e7a5d9BaseProvider: DetailDependency {
    var repositoryBuilder: RepositoryBuilder {
        return rootComponent.repositoryBuilder
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->DetailComponent
private class DetailDependencyb171f3bdca6113e7a5d9Provider: DetailDependencyb171f3bdca6113e7a5d9BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
private class RepositoryDependency7488f146cdfa18e51394BaseProvider: RepositoryDependency {
    var userDefaults: UserDefaults {
        return rootComponent.userDefaults
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->RepositoryComponent
private class RepositoryDependency7488f146cdfa18e51394Provider: RepositoryDependency7488f146cdfa18e51394BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
