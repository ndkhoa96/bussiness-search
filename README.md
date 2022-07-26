# bussiness-search
Using the Yelp Fusion API (https://www.yelp.com/developers/documentation/v3), develop an iOS app that would fetch and display results of local businesses.

a/ Project is using:
- Pure Swift
- Framework: UIKit, RxSwift, XCTest
- Dependency Manager: Swift Package Manager
- Clean architrecture [here](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), use this as high level guideline.
- Being devided in 3 layers:
  - Domain Layer = Entities + Use Cases + Repositories Interfaces
  - Data Layer = Repositories Implementations
  - Presentation Layer (MVVM) = Models+ + Views + ViewModel 
- SOLID principles [here](https://www.google.com/search?sxsrf=ALeKk01XtOekOpJvhSePYEwrjdVNe2ZNfw%3A1593035218071&ei=0snzXo7VA8i2kwXo66iQAw&q=solid+principles+origin&oq=solid+principles+origi&gs_lcp=CgZwc3ktYWIQAxgAMgIIADoECAAQRzoECAAQQzoGCAAQFhAeOgcIABAUEIcCOggIABAWEAoQHlC6UljoYWCuaGgCcAF4AIABYogBtASSAQE4mAEAoAEBqgEHZ3dzLXdpeg&sclient=psy-ab)

b/ I have structured the project into 3 main layers:

```
    - Domain: this contains 2 main things:
        - Entities: represent for Enterprise business roles
        - Usecases: represent for Application roles
    - Presentation: Models + Views + ViewModel by using MVVM
    - Data: Networking using Moya.
```

Beside that, there are `Common, Utility` folders, ... do what their names say.

c/ Run project by open `Assignment-42Race.xcodeproj` file with scheme 'Assignment-42Race'
*- Note: Resolve dependencies with Swift Package Manager before run the application.
