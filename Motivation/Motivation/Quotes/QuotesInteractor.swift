//
//  QuotesInteractor.swift
//  Motivation
//
//  Created by Maurício Marques on 05/05/24.
//

import Foundation

protocol QuotesInteractor: AnyObject {
    var presenter: QuotesPresenter? { get }
    func loadQuotes()
    func interactWithLike(atIndex index: Int)
}

final class DefaultQuotesInteractor: QuotesInteractor {
    weak var presenter: QuotesPresenter?

    private var mockedQuotes = [
        ("It takes courage to grow up and become who you really are.", true),
        ("Your self-worth is determined by you. You don't have to depend on someone telling you who you are.", false),
        ("Nothing is impossible. The word itself says 'I'm possible!", false),
        ("Keep your face always toward the sunshine, and shadows will fall behind you.", true),
        ("You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.", false),
        ("Attitude is a little thing that makes a big difference.", false),
        ("To bring about change, you must not be afraid to take the first step. We will fail when we fail to try.", true),
        ("All our dreams can come true, if we have the courage to pursue them.", false),
        ("Don't sit down and wait for the opportunities to come. Get up and make them.", true)
    ]

    func loadQuotes() {
        presenter?.showQuotes(mockedQuotes.map { Quote(simplifiedQuote: $0) })
    }

    func interactWithLike(atIndex index: Int) {
        mockedQuotes[index].1 = !mockedQuotes[index].1
        presenter?.showQuotes(mockedQuotes.map { Quote(simplifiedQuote: $0) })
    }
}
