//
//  ViewModelHandler.swift
//  Motivation
//
//  Created by Maurício Marques on 05/05/24.
//

import UIKit

class ViewModelHandler<T>: UIView {
    var viewModel: T {
        didSet {
            bindViewModel()
        }
    }

    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bindViewModel() {}
}
