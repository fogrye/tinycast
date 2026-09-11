import Foundation

enum ChatHistoryNavigation {
    /// Saved chats are newest-first; an unsaved chat sits one step newer than the first row.
    static func adjacent(
        in conversations: [ChatConversation], from currentID: UUID, offset: Int
    ) -> UUID? {
        guard let current = conversations.firstIndex(where: { $0.id == currentID }) else {
            return offset == 1 ? conversations.first?.id : nil
        }
        let target = current + offset
        guard conversations.indices.contains(target) else { return nil }
        return conversations[target].id
    }
}
