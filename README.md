> **Warning**: Meetup no longer uses Swift in our codebase and will no longer maintain this.

# Kioku

<table>
  <tr>
  <td>
      <blockquote>
        <p>
          Kioku - 記憶 (きおく - the faculty by which the mind stores and remembers information.
        </p>
    </td>
    <td>
      <img src="https://cdn.tristancamejo.com/icons/kioku.png" />
    </td>
  </tr>
</table>

## Usage

```swift
let kioku = Kioku<User>()
let kioku = Kioku<User>(maxObjects: 10)
let kioku = Kioku<User>(maxObjects: 10, defaultTTL: 60)

let user = User(name: "tristan")

kioku.set(key: "1", value: user)

let fetchedUser = kioku.get(key: "1")
```
