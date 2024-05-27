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

    func test_quotesViewDelegate_didTapLikeButtonAtIndex_shouldCallInteractWithLikeOnInteractor() {
        // Given
        let quotesView = QuotesView(viewModel: .init(quotes: nil))
        let tappedIndex = 0
        let (sut, interactorSpy) = makeSut()

        // When
        sut.quotesView(
            quotesView,
            didTapLikeButtonAtIndex: tappedIndex
        )

        // Verify
        XCTAssertEqual(interactorSpy.invokedInteractWithLikeCount, 1)
        XCTAssertEqual(interactorSpy.invokedInteractWithLikeParameters?.index, tappedIndex)
    }

    private func makeSut() -> (QuotesViewController, QuotesInteractorSpy) {
        let interactorSpy = QuotesInteractorSpy()
        let sut = QuotesViewController(interactor: interactorSpy)
        return (sut, interactorSpy)
    }
}
