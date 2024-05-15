//
//  DefaultQuotesInteractorTests.swift
//  MotivationTests
//
//  Created by Maurício Marques on 14/05/24.
//

import XCTest
@testable import Motivation

final class DefaultQuotesInteractorTests: XCTestCase {
    func test_loadQuotes_shouldCallPresenterWithLoadedQuotes() {
        // Given
        let (sut, presenterSpy) = makeSut()

        // When
        sut.loadQuotes()

        // Verify
        XCTAssertEqual(presenterSpy.invokedShowQuotesCount, 1)
        XCTAssertEqual(presenterSpy.invokedShowQuotesParameters?.quotes, QuotesMock.simpleQuotes)
    }

    private func makeSut() -> (DefaultQuotesInteractor, QuotesPresenterSpy) {
        let presenterSpy = QuotesPresenterSpy()
        let sut = DefaultQuotesInteractor()
        sut.presenter = presenterSpy
        return (sut, presenterSpy)
    }
}
