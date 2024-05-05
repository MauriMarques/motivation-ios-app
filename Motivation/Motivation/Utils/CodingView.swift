//
//  CodingView.swift
//  Motivation
//
//  Created by Maurício Marques on 05/05/24.
//

protocol CodingView {
    func setupProperties()
    func setupSubviews()
    func setupConstraints()
}

extension CodingView {
    func setupProperties() {}

    func setupSubviews() {}

    func setupConstraints() {}

    func setup() {
        setupProperties()
        setupSubviews()
        setupConstraints()
    }
}
