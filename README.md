# Kioku 📝

Simple caching package for Swift.

## Usage

```swift
let kioku = Kioku<User>()

let user = User(name: "tristan")

kioku.set(key: "1", value: user)

let fetchedUser = kioku.get(key: "1")

XCTAssertEqual(fetchedUser?.name, "tristan")
```
