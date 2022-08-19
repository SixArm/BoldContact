import XCTest
import Contacts

class CNContact_list_urlAddressesTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_hasUrlAddress_sans_index() throws {
        let contact = CNContact()
        let x = contact.hasUrlAddress()
        XCTAssertFalse(x)
    }

    func test_hasUrlAddress_with_index() throws {
        let contact = CNContact()
        let x = contact.hasUrlAddress(index: 1)
        XCTAssertFalse(x)
    }

    func test_getUrlAddress_sans_index() throws {
        let contact = CNContact()
        let x = contact.getUrlAddress()
        XCTAssertNil(x)
    }

    func test_getUrlAddress_with_index() throws {
        let contact = CNContact()
        let x = contact.getUrlAddress(index: 1)
        XCTAssertNil(x)
    }

    func test_getUrlAddressValue_sans_index() throws {
        let contact = CNContact()
        let x = contact.getUrlAddressValue()
        XCTAssertNil(x)
    }

    func test_getUrlAddressValue_with_index() throws {
        let contact = CNContact()
        let x = contact.getUrlAddressValue(index: 1)
        XCTAssertNil(x)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}