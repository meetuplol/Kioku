import Foundation

public class Kioku<T> {
    private var defaultTTL: Int = 300 // 5 minutes
    private var maxObjects: Int = 100

    public init(defaultTTL: Int = 300, maxObjects: Int = 1000) {
        self.defaultTTL = defaultTTL
        self.maxObjects = maxObjects
    }

    private var _items: [KiokuItem<T>] = []

    private func _maintain() {
        _items = _items.filter { item in
            if let expiry = item.expiry {
                return expiry > Date()
            }
            return true
        }

        if _items.count > maxObjects {
            _items = Array(_items.suffix(maxObjects))
        }
    }

    public func set(key: String, value: T, ttl: Int? = nil) {
        let expiry = ttl != nil ? Date().addingTimeInterval(TimeInterval(ttl!)) : nil
        _items.append(KiokuItem(key: key, value: value, expiry: expiry))
        _maintain()
    }

    public func get(key: String) -> T? {
        defer { _maintain() }
        return _items.first(where: { $0.key == key })?.value
    }

    public func delete(key: String) {
        _items.removeAll(where: { $0.key == key })
    }

    public func clear() {
        _items.removeAll()
    }

    public func count() -> Int {
        return _items.count
    }

    public func keys() -> [String] {
        return _items.map { $0.key }
    }

    public func values() -> [T] {
        return _items.map { $0.value }
    }

    public func items() -> [String: T] {
        var items: [String: T] = [:]
        for item in _items {
            items[item.key] = item.value
        }
        return items
    }

    public func has(key: String) -> Bool {
        return _items.contains(where: { $0.key == key })
    }
}
