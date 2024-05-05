//
//  QuotesViewModelFactory.swift
//  Motivation
//
//  Created by Maurício Marques on 05/05/24.
//

import Foundation

struct QuotesViewModelFactory {
    func createInitialModel() -> QuotesView.ViewModel {
        .init(quotes: nil)
    }

    func createFromQuotes(_ quotes: [String]) -> QuotesView.ViewModel {
        .init(quotes: quotes)
    }
}
