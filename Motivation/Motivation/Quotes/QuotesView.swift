//
//  QuotesView.swift
//  Motivation
//
//  Created by Maurício Marques on 05/05/24.
//

import UIKit

final class QuotesView: UIView, CodingView {
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    func numberOfSections(in _: UICollectionView) -> Int {
        1
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: QuoteCell.identifier, for: indexPath) as? QuoteCell
        else { return UICollectionViewCell() }
        cell.configure(title: "This is a quote")
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
