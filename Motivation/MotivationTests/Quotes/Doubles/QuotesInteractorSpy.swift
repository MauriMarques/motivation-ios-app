//
//  QuotesInteractorSpy.swift
//  MotivationTests
//
//  Created by Maurício Marques on 14/05/24.
//

@testable import Motivation

final class QuotesInteractorSpy: QuotesInteractor {
    var invokedPresenterGetter = false
    var invokedPresenterGetterCount = 0
    var stubbedPresenter: QuotesPresenter!

    var presenter: QuotesPresenter? {
        invokedPresenterGetter = true
        invokedPresenterGetterCount += 1
        return stubbedPresenter
    }

    var invokedLoadQuotes = false
    var invokedLoadQuotesCount = 0

    func loadQuotes() {
        invokedLoadQuotes = true
        invokedLoadQuotesCount += 1
    }

    var invokedInteractWithLike = false
    var invokedInteractWithLikeCount = 0
    var invokedInteractWithLikeParameters: (index: Int, Void)?
    var invokedInteractWithLikeParametersList = [(index: Int, Void)]()

    var invokedInteractWithShared = false
    var invokedInteractWithShareCount = 0
    var invokedInteractWithSharedParameters: (index: Int, Void)?
    var invokedInteractWithSharedParametersList = [(index: Int, Void)]()

    func interactWithLike(atIndex index: Int) {
        invokedInteractWithLike = true
        invokedInteractWithLikeCount += 1
        invokedInteractWithLikeParameters = (index, ())
        invokedInteractWithLikeParametersList.append((index, ()))
    }

    func interactWithShared(atIndex index: Int) {
        invokedInteractWithShared = true
        invokedInteractWithShareCount += 1
        invokedInteractWithSharedParameters = (index, ())
        invokedInteractWithSharedParametersList.append((index, ()))
    }
}
