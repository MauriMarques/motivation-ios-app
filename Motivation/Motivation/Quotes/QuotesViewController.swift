//
//  QuotesViewController.swift
//  Motivation
//
//  Created by Maurício Marques on 22/04/24.
//

import UIKit

protocol QuotesPresenter: AnyObject {
    func showQuotes(_ quotes: [Quote])
}

final class QuotesViewController: UIViewController {
    private let interactor: QuotesInteractor
    private let viewModelFactory = QuotesViewModelFactory()
    private lazy var quotesView: QuotesView = {
        let quotesView = QuotesView(viewModel: viewModelFactory.createInitialModel())
        quotesView.delegate = self
        return quotesView
    }()

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
    func showQuotes(_ quotes: [Quote]) {
        quotesView.viewModel = viewModelFactory.createFromQuotes(quotes)
    }
}

extension QuotesViewController: QuotesViewDelegate {
    func quotesView(_ quotesView: QuotesView, didTapLikeButtonAtIndex index: Int) {
        interactor.interactWithLike(atIndex: index)
    }

    func quotesView(_ quotesView: QuotesView, didTapSharedButtomAtIndex index: Int) {
        interactor.interactWithShared(atIndex: index)
    }
}
