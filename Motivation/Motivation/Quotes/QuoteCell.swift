//
//  QuoteCell.swift
//  Motivation
//
//  Created by Maurício Marques on 05/05/24.
//

import UIKit

final class QuoteCell: UICollectionViewCell, CodingView {
    static var identifier: String { Self.description() }

    private var likeAction: (() -> Void)?
    private var shareAction: (() -> Void)?

    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .label
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        return likeButton
    }()

    private let shareButton: UIButton = {
        let shareButton = UIButton()
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        return shareButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(
        title: String,
        isLiked: Bool,
        likeAction: @escaping (() -> Void),
        isShared: Int,
        shareAction: @escaping (() -> Void)
    ) {
        label.text = title

        configureLikeButton(
            isLiked: isLiked,
            likeAction: likeAction
        )
        configureShareButton(
            isShared: isShared,
            shareAction: shareAction
        )
    }

    private func configureLikeButton(
        isLiked: Bool,
        likeAction: @escaping (() -> Void)
    ) {
        let config = UIImage.SymbolConfiguration(paletteColors: [.black])
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 40.0)
        let combiedConfig = config.applying(sizeConfig)
        let image = UIImage(
            systemName: isLiked ? "heart.fill" : "heart",
            withConfiguration: combiedConfig
        )
        likeButton.setImage(
            image,
            for: .normal
        )
        likeButton.addTarget(
            self,
            action: #selector(didTapLikeButton),
            for: .touchUpInside
        )
        self.likeAction = likeAction
    }

    private func configureShareButton(
        isShared: Int,
        shareAction: @escaping (() -> Void)
    ) {
        let config = UIImage.SymbolConfiguration(paletteColors: [.black])
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 40.0)
        let combiedConfig = config.applying(sizeConfig)
        let image = UIImage(
            systemName: "square.and.arrow.up",
            withConfiguration: combiedConfig
        )
        shareButton.setImage(
            image,
            for: .normal
        )
        shareButton.addTarget(
            self,
            action: #selector(didTapShareButton),
            for: .touchUpInside
        )
        self.shareAction = shareAction
    }

    // MARK: - CodingView

    func setupSubviews() {
        contentView.addSubview(label)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
    }

    func setupConstraints() {
        setupLabelConstraints()
        setupLikeButtonConstraints()
        setupShareButtonConstraints()
    }

    private func setupLabelConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor),
            label.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
            label.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    private func setupLikeButtonConstraints() {
        NSLayoutConstraint.activate([
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200.0),
            likeButton.widthAnchor.constraint(equalToConstant: 45.0),
            likeButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }

    private func setupShareButtonConstraints() {
        NSLayoutConstraint.activate([
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -130.0),
            shareButton.widthAnchor.constraint(equalToConstant: 45.0),
            shareButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }

    @objc private func didTapLikeButton() {
        likeAction?()
    }

    @objc private func didTapShareButton() {
        shareAction?()
    }
}

#if canImport(SwiftUI) && DEBUG
    import SwiftUI

    struct QuoteCellPreviews_Previews: PreviewProvider {
        static var previews: some View {
            UIViewPreview {
                let cell = QuoteCell(
                    frame: .init(
                        x: 0,
                        y: 0,
                        width: 350.0,
                        height: 350.0
                    )
                )
                cell.configure(
                    title: "Texto bem grande",
                    isLiked: false,
                    likeAction: {},
                    isShared: 0,
                    shareAction: {}
                )
                return cell
            }
        }
    }
#endif
