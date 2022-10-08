# Kioku 📝

Simple caching package for Swift.

## Usage

```swift
let kioku = Kioku<User>()
let kioku = Kioku<User>(maxObjects: 10)
let kioku = Kioku<User>(maxObjects: 10, defaultTTL: 60)

let user = User(name: "tristan")

kioku.set(key: "1", value: user)

let fetchedUser = kioku.get(key: "1")
```
