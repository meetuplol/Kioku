import Foundation

struct KiokuItem<T> {
    let key: String
    let value: T
    let expiry: Date?
}
