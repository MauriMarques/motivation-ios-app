//
//  UIViewPreview.swift
//  Motivation
//
//  Created by Maurício Marques on 21/05/24.
//

#if canImport(SwiftUI) && DEBUG
    import SwiftUI

    struct UIViewPreview<View: UIView>: UIViewRepresentable {
        let view: View

        init(_ builder: @escaping () -> View) {
            view = builder()
        }

        // MARK: UIViewRepresentable

        func makeUIView(context: Context) -> UIView {
            view
        }

        func updateUIView(_ view: UIView, context: Context) {
            view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }
#endif
