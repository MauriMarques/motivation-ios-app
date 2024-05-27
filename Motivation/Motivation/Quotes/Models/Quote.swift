struct Quote: Equatable {
    let text: String
    let isLiked: Bool

    init(text: String, isLiked: Bool) {
        self.text = text
        self.isLiked = isLiked
    }

    init(simplifiedQuote: (String, Bool)) {
        text = simplifiedQuote.0
        isLiked = simplifiedQuote.1
    }
}
