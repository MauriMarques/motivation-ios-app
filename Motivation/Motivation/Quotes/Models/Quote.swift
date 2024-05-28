struct Quote: Equatable {
    let text: String
    let isLiked: Bool
    let isShared: Int

    init(text: String, isLiked: Bool, isShared: Int) {
        self.text = text
        self.isLiked = isLiked
        self.isShared = isShared
    }

    init(simplifiedQuote: (String, Bool, Int)) {
        text = simplifiedQuote.0
        isLiked = simplifiedQuote.1
        isShared = simplifiedQuote.2
    }
}
