//
//  QuotesMock.swift
//  MotivationTests
//
//  Created by Maurício Marques on 14/05/24.
//

@testable import Motivation

struct QuotesMock {
    static let simpleQuotes: [(String, Bool, Int)] = [
        ("It takes courage to grow up and become who you really are.", true, 0),
        ("Your self-worth is determined by you. You don't have to depend on someone telling you who you are.", false, 0),
        ("Nothing is impossible. The word itself says 'I'm possible!", false, 0),
        ("Keep your face always toward the sunshine, and shadows will fall behind you.", true, 0),
        ("You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.", false, 0),
        ("Attitude is a little thing that makes a big difference.", false, 0),
        ("To bring about change, you must not be afraid to take the first step. We will fail when we fail to try.", true, 0),
        ("All our dreams can come true, if we have the courage to pursue them.", false, 0),
        ("Don't sit down and wait for the opportunities to come. Get up and make them.", true, 0)
    ]

    static let simpleQuotesModel: [Quote] = simpleQuotes.map { Quote(simplifiedQuote: $0) }
}
