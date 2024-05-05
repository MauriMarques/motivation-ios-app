//
//  QuotesViewController.swift
//  Motivation
//
//  Created by Maurício Marques on 22/04/24.
//

import UIKit

final class QuotesViewController: UIViewController {
    private let quotesView: QuotesView = .init()

    override func loadView() {
        view = quotesView
    }
}
