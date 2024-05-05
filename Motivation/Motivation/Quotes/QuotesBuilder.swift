//
//  QuotesBuilder.swift
//  Motivation
//
//  Created by Maurício Marques on 05/05/24.
//

import Foundation

struct QuotesBuilder {
    func build() -> QuotesViewController {
        let interactor = DefaultQuotesInteractor()
        let quotesVC = QuotesViewController(interactor: interactor)
        interactor.presenter = quotesVC
        return quotesVC
    }
}
