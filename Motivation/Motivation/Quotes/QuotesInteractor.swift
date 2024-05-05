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
}

final class DefaultQuotesInteractor: QuotesInteractor {
    weak var presenter: QuotesPresenter?

    private let mockedQuotes = [
        "It takes courage to grow up and become who you really are.",
        "Your self-worth is determined by you. You don't have to depend on someone telling you who you are.",
        "Nothing is impossible. The word itself says 'I'm possible!",
        "Keep your face always toward the sunshine, and shadows will fall behind you.",
        "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.",
        "Attitude is a little thing that makes a big difference.",
        "To bring about change, you must not be afraid to take the first step. We will fail when we fail to try.",
        "All our dreams can come true, if we have the courage to pursue them.",
        "Don't sit down and wait for the opportunities to come. Get up and make them."
    ]

    func loadQuotes() {
        presenter?.showQuotes(mockedQuotes)
    }
}
