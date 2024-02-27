//
//  ActivityModel.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 28/02/2024.
//

import SwiftUI

protocol ActivityProtocol: Identifiable {
    var id: UUID { get }
    var icon: Image? { get }
    var title: LocalizedStringKey { get set }
    var subtitle: LocalizedStringKey { get set }
}

extension ActivityProtocol {
    func getAuthor() -> String? {
        (self as? InAppMessage)?.author
    }
}

private struct InAppNotification: ActivityProtocol, Identifiable {
    let id: UUID = .init()
    var title: LocalizedStringKey
    var subtitle: LocalizedStringKey
    var icon: Image?
    
    init(_ icon: Image, title: LocalizedStringKey, subtitle: LocalizedStringKey) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
    }
    static let examples: [InAppNotification] = [
        .init(.arrowSwap, title: "32 new listings near your location", subtitle: "20 minutes ago"),
        .init(.arrowSwap, title: "You request has been processed", subtitle: "40 minutes ago"),
        .init(.arrowSwap, title: "You have saved 2 items", subtitle: "Yesterday"),
        .init(.arrowSwap, title: "New deals available", subtitle: "Yesterday")
    ]
}

private struct InAppMessage: ActivityProtocol {
    let id: UUID = .init()
    var author: String
    var title: LocalizedStringKey
    var subtitle: LocalizedStringKey
    var icon: Image?
    
    init(_ icon: Image, author: String, title: LocalizedStringKey, subtitle: LocalizedStringKey) {
        self.icon = icon
        self.author = author
        self.title = title
        self.subtitle = subtitle
    }
    
    static let examples: [InAppMessage] = [
        .init(
            .magicStar,
            author: "John Doe",
            title: "I am very sorry, but the room has already been taken.",
            subtitle: "12 mins ago"
        )
    ]
}

struct ActivityData {
    var notifications: [any ActivityProtocol] = InAppNotification.examples
    var messages: [any ActivityProtocol] = InAppMessage.examples
}
