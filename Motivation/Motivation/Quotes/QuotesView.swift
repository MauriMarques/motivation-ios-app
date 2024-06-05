//
//  QuotesView.swift
//  Motivation
//
//  Created by Maurício Marques on 05/05/24.
//

import UIKit

protocol QuotesViewDelegate: AnyObject {
    func quotesView(_ quotesView: QuotesView, didTapLikeButtonAtIndex index: Int)
    func quotesView(_ quotesView: QuotesView, didTapSharedButtomAtIndex index: Int)
}

final class QuotesView: ViewModelHandler<QuotesView.ViewModel>, CodingView {
    struct ViewModel: Equatable {
        let quotes: [Quote]?
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            QuoteCell.self,
            forCellWithReuseIdentifier: QuoteCell.identifier
        )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        return collectionView
    }()

    weak var delegate: QuotesViewDelegate?

    override init(viewModel: ViewModel) {
        super.init(viewModel: viewModel)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func bindViewModel() {
        collectionView.reloadData()
    }

    // MARK: - CodingView

    func setupProperties() {
        backgroundColor = .systemBackground
    }

    func setupSubviews() {
        addSubview(collectionView)
    }

    func setupConstraints() {
        setupCollectionViewConstraints()
    }

    private func setupCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension QuotesView: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        viewModel.quotes?.count ?? .zero
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: QuoteCell.identifier, for: indexPath) as? QuoteCell,
            let quote = viewModel.quotes?[indexPath.item]
        else { return UICollectionViewCell() }
        cell.configure(
            title: quote.text,
            isLiked: quote.isLiked,
            likeAction: { [weak self] in
                guard let self else { return }

                delegate?.quotesView(
                    self,
                    didTapLikeButtonAtIndex: indexPath.item
                )
            },
            shareAction: { [weak self] in
                guard let self else { return }
                delegate?.quotesView(
                    self,
                    didTapSharedButtomAtIndex: indexPath.item
                )
            }
        )
        return cell
    }
}

extension QuotesView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        .zero
    }
}
