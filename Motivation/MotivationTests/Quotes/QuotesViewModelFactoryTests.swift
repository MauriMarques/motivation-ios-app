//
//  QuotesViewModelFactoryTests.swift
//  MotivationTests
//
//  Created by Maurício Marques on 14/05/24.
//

import XCTest
@testable import Motivation

final class QuotesViewModelFactoryTests: XCTestCase {
    func test_createInitialViewModel() {
        // Given
        let sut = QuotesViewModelFactory()

        let expectedInitialViewModel = QuotesView.ViewModel(quotes: nil)

        // When
        let initialViewModel = sut.createInitialModel()

        // Verify
        XCTAssertEqual(initialViewModel, expectedInitialViewModel)
    }

    func test_createFromQuotesViewModel() {
        // Given
        let sut = QuotesViewModelFactory()

        let quotes = QuotesMock.simpleQuotes
        let expectedCreateFromQuotesViewModel = QuotesView.ViewModel(quotes: quotes)

        // When
        let createFromQuotesViewModel = sut.createFromQuotes(quotes)

        // Verify
        XCTAssertEqual(createFromQuotesViewModel, expectedCreateFromQuotesViewModel)
    }
}
