//
//  QuotesViewControllerTests.swift
//  MotivationTests
//
//  Created by Maurício Marques on 14/05/24.
//

import XCTest
@testable import Motivation

final class QuotesViewControllerTests: XCTestCase {
    func test_viewDidLoad_shouldCallLoadQuotesOnInteractor() {
        // Given
        let (sut, interactorSpy) = makeSut()

        // When
        sut.viewDidLoad()

        // Verify
        XCTAssertEqual(interactorSpy.invokedLoadQuotesCount, 1)
    }

    private func makeSut() -> (QuotesViewController, QuotesInteractorSpy) {
        let interactorSpy = QuotesInteractorSpy()
        let sut = QuotesViewController(interactor: interactorSpy)
        return (sut, interactorSpy)
    }
}
