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
    var invokedShowQuotesParameters: (quotes: [String], Void)?
    var invokedShowQuotesParametersList = [(quotes: [String], Void)]()

    func showQuotes(_ quotes: [String]) {
        invokedShowQuotes = true
        invokedShowQuotesCount += 1
        invokedShowQuotesParameters = (quotes, ())
        invokedShowQuotesParametersList.append((quotes, ()))
    }
}
