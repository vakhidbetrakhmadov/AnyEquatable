// TODO: Add more tests

import XCTest

final class AnyEquatableTests: 
    XCTestCase 
{ 
    // MARK: - Positive tests
    func test__Int_1_equals_Int_1__is_true() {
        parameterized_test__A_equals_B__yields_expected(
            a: 1,
            b: 1,
            expected: true
        )
    }

    func test__Double_1_equals_Double_1__is_true() {
        parameterized_test__A_equals_B__yields_expected(
            a: 1.0,
            b: 1.0,
            expected: true
        )
    }

    func test__Bool_true_equals_Bool_true__is_true() {
        parameterized_test__A_equals_B__yields_expected(
            a: true,
            b: true,
            expected: true
        )
    }

    func test__String_1_equals_String_1__is_true() {
        parameterized_test__A_equals_B__yields_expected(
            a: "1",
            b: "1",
            expected: true
        )
    }
    
    func test__Optional_Int_1_equals_Optional_Int_1__is_true() {
        parameterized_test__A_equals_B__yields_expected(
            a: Optional<Int>.some(1),
            b: Optional<Int>.some(1),
            expected: true
        )
    }

    func test__Optional_Int_none_equals_Optional_Int_none__is_true() {
        parameterized_test__A_equals_B__yields_expected(
            a: Optional<Int>.none,
            b: Optional<Int>.none,
            expected: true
        )
    }

    func test__Optional_Int_none_equals_Optional_Double_none__is_true() {
        parameterized_test__A_equals_B__yields_expected(
            a: Optional<Int>.none,
            b: Optional<Double>.none,
            expected: true
        )
    }

    func test__Array_Int_empty_equals_Array_Double_empty__is_true() { 
        parameterized_test__A_equals_B__yields_expected(
            a: [Int](),
            b: [Double](),
            expected: true
        )
    }

    // MARK: - Negative tests
    func test__Int_1_equals_Int_2__is_false() {
        parameterized_test__A_equals_B__yields_expected(
            a: 1,
            b: 2,
            expected: false
        )
    }

    func test__Int_1_equals_Double_1__is_false() {
        parameterized_test__A_equals_B__yields_expected(
            a: 1,
            b: 1.0,
            expected: false
        )
    }

    func test__Optional_Int_1_equals_Optional_Int_none__is_false() {
        parameterized_test__A_equals_B__yields_expected(
            a: Optional<Int>.some(1),
            b: Optional<Int>.none,
            expected: false
        )
    }

    func test__Optional_Int_1_equals_Optional_Double_1__is_false() {
        parameterized_test__A_equals_B__yields_expected(
            a: Optional<Int>.some(1),
            b: Optional<Double>.some(1.0),
            expected: false
        )
    }

    func test__Optional_Optional_Int_none_equals_Optional_Optional_Double_none__is_false() {
        parameterized_test__A_equals_B__yields_expected(
            a: Optional<Int?>.some(.none),
            b: Optional<Double?>.some(.none),
            expected: false
        )
    }

    func test__Optional_Int_none_equals_Optional_Optional_Double_none__is_false() {
        parameterized_test__A_equals_B__yields_expected(
            a: Optional<Int?>.none,
            b: Optional<Double?>.some(.none),
            expected: false
        )
    }

    // MARK: - Private methods
    private func parameterized_test__A_equals_B__yields_expected<A, B>(
        a: A,
        b: B,
        expected: Bool)
        where A: Equatable, B: Equatable 
    { 
        // Given
        let anyA = AnyEquatable(a)
        let anyB = AnyEquatable(b)

        // When
        let actual = anyA == anyB

        // Then
        XCTAssertEqual(actual, expected)
    }
}