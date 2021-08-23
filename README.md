# Dodi
Modular iOS with Uber needle &amp; tuist example
<br/>
medium: https://h2s1880.medium.com/%EB%AA%A8%EB%93%88%ED%99%94%ED%95%98%EA%B3%A0-needle-%EC%A0%81%EC%9A%A9%ED%95%B4%EB%B3%B4%EA%B8%B0-bd5e9f3c450b

## Setup
```sh
brew install needle
bash <(curl -Ls https://install.tuist.io)
```

and run
```sh
make all
```

## Point of concern

1. I'm debating whether to provide a Builder for the Repository or an repository interface of a specific implementation object(such as TodoCachedRepository) from RootComponent...

### RootComponent
```swift
import DodiList
import DodiDetail
import DodiRepository

class RootComponent: BootstrapComponent {

  var userDefaults: UserDefaults {
    return UserDefaults.standard
  }

  var repositoryBuilder: RepositoryBuilder {
    return shared { RepositoryComponent(parent: self) }
  }

  var listBuilder: ListBuilder {
    return shared { ListComponent(parent: self) }
  }

  var detailBuilder: DetailBuilder {
    return shared { DetailComponent(parent: self) }
  }

  var rootViewController: UIViewController {
    return UINavigationController(
      rootViewController: self.listBuilder.homeListViewController
    )
  }
}
```

### ListComponent
```swift
import DodiRepository
import DodiDetail

public protocol ListDependency: Dependency {

  var repositoryBuilder: RepositoryBuilder { get } //<--- Is it Okey?
  var detailBuilder: DetailBuilder { get }
}

public protocol ListBuilder {

  var homeListViewController: HomeListViewController { get }
}

public class ListComponent: Component<ListDependency>, ListBuilder {

  public var homeListViewController: HomeListViewController {
    return HomeListViewController(
      dependeny: HomeListViewController.Dependency(
        homeBloc: HomeListBlocImpl(
          dependency: HomeListBlocImpl.Dependency(
            todoCachedRepository: self.repositoryBuilder.todoCachedRepository,
            presenter: HomeListPresenter()
          )
        ),
        detailBuilder: self.detailBuilder
      )
    )
  }
}
```

## Graph
<img src="https://github.com/GeekTree0101/Dodi/blob/master/graph.png" />
> tuist graph -t
