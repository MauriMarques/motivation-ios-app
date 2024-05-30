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
        XCTAssertEqual(presenterSpy.invokedShowQuotesParameters?.quotes, QuotesMock.simpleQuotesModel)
    }

    func test_interactWithLike_shouldCallPresenterWithLoadedQuotes() {
        // Given
        var expectedQuotes = QuotesMock.simpleQuotesModel
        expectedQuotes[0] = Quote(
            text: expectedQuotes[0].text,
            isLiked: !expectedQuotes[0].isLiked
        )

        let (sut, presenterSpy) = makeSut()

        // When
        sut.interactWithLike(atIndex: 0)

        // Verify
        XCTAssertEqual(presenterSpy.invokedShowQuotesCount, 1)
        XCTAssertEqual(presenterSpy.invokedShowQuotesParameters?.quotes, expectedQuotes)
    }

    private func makeSut() -> (DefaultQuotesInteractor, QuotesPresenterSpy) {
        let presenterSpy = QuotesPresenterSpy()
        let sut = DefaultQuotesInteractor()
        sut.presenter = presenterSpy
        return (sut, presenterSpy)
    }
}
