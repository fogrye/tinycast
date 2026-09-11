enum AIChatShortcut: Equatable, Sendable {
    case previousChat
    case nextChat
    case newChat
    case newChatWithModel

    static func resolve(character: String, hasShift: Bool) -> Self? {
        switch (character, hasShift) {
        case ("[", false): .previousChat
        case ("]", false): .nextChat
        case ("n", false): .newChat
        case ("m", true): .newChatWithModel
        default: nil
        }
    }
}
