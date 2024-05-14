//
//  QuotesViewController.swift
//  Motivation
//
//  Created by Maurício Marques on 22/04/24.
//

import UIKit

protocol QuotesPresenter: AnyObject {
    func showQuotes(_ quotes: [String])
}

final class QuotesViewController: UIViewController {
    private let interactor: QuotesInteractor
    private let viewModelFactory = QuotesViewModelFactory()
    private lazy var quotesView: QuotesView = .init(viewModel: viewModelFactory.createInitialModel())

    init(interactor: QuotesInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = quotesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadQuotes()
    }
}

extension QuotesViewController: QuotesPresenter {
    func showQuotes(_ quotes: [String]) {
        quotesView.viewModel = viewModelFactory.createFromQuotes(quotes)
    }
}
