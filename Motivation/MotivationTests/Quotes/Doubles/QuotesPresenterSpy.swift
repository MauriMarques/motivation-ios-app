//
//  QuotesPresenterSpy.swift
//  MotivationTests
//
//  Created by Maurício Marques on 14/05/24.
//

@testable import Motivation

final class QuotesPresenterSpy: QuotesPresenter {
    var invokedShowQuotes = false
    var invokedShowQuotesCount = 0
    var invokedShowQuotesParameters: (quotes: [Quote], Void)?
    var invokedShowQuotesParametersList = [(quotes: [Quote], Void)]()

    func showQuotes(_ quotes: [Quote]) {
        invokedShowQuotes = true
        invokedShowQuotesCount += 1
        invokedShowQuotesParameters = (quotes, ())
        invokedShowQuotesParametersList.append((quotes, ()))
    }
}
