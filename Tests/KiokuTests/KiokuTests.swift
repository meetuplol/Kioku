@testable import Kioku
import XCTest

struct User: Codable {
    let name: String
}

final class KiokuTests: XCTestCase {
    func testGetGet() throws {
        let kioku = Kioku<User>()

        let user = User(name: "tristan")

        kioku.set(key: "1", value: user)

        let fetchedUser = kioku.get(key: "1")

        XCTAssertEqual(fetchedUser?.name, "tristan")
    }

    func testSetGetMultiple() throws {
        let kioku = Kioku<User>()

        let user1 = User(name: "Siris")
        let user2 = User(name: "Toga")

        kioku.set(key: "1", value: user1)
        kioku.set(key: "2", value: user2)

        let fetchedUser1 = kioku.get(key: "1")
        let fetchedUser2 = kioku.get(key: "2")

        XCTAssertEqual(fetchedUser1?.name, "Siris")
        XCTAssertEqual(fetchedUser2?.name, "Toga")
    }

    func testSetGetMultipleWithTTLAndMaxObjects() throws {
        let kioku = Kioku<User>(maxObjects: 1)

        let user1 = User(name: "This would be controversial")
        let user2 = User(name: "Evie")

        kioku.set(key: "1", value: user1, ttl: 1)
        kioku.set(key: "2", value: user2, ttl: 1)

        let fetchedUser1 = kioku.get(key: "1")
        let fetchedUser2 = kioku.get(key: "2")

        XCTAssertEqual(fetchedUser1?.name, nil)
        XCTAssertEqual(fetchedUser2?.name, "Evie")

        sleep(2)

        let fetchedUser1AfterTTL = kioku.get(key: "1")
        let fetchedUser2AfterTTL = kioku.get(key: "2")

        XCTAssertNil(fetchedUser1AfterTTL)
        XCTAssertNil(fetchedUser2AfterTTL)
    }
}
