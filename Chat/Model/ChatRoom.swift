//
//  ChatRoom.swift
//  Chat
//
//  Created by Kat Milton on 8/20/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import Foundation
import MessageKit


struct ChatRoom {
    var name: String?
    var senderId: String?
    var timeStamp: NSNumber?
    var id: String?
    //   var messages: [Message]
    
    
}

extension ChatRoom {
    static func transformChatroomToDictionary(dict: [String: Any], key: String) -> ChatRoom {
        var chatroom = ChatRoom()
        chatroom.id = key
        chatroom.name = dict["chatRoom"] as? String
        chatroom.senderId = dict["senderId"] as? String
        chatroom.timeStamp = dict["timeStamp"] as? NSNumber
        return chatroom
    }
    
}




//class ChatRoom: Codable, Equatable {
//
//    let title: String
//    var messages: [ChatRoom.Message]
//    let identifier: String
//
//    init(title: String, messages: [ChatRoom.Message] = [], identifier: String = UUID().uuidString) {
//        self.title = title
//        self.messages = messages
//        self.identifier = identifier
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        let title = try container.decode(String.self, forKey: .title)
//        let identifier = try container.decode(String.self, forKey: .identifier)
//        let messagesDictionaries = try container.decodeIfPresent([String: Message].self, forKey: .messages)
//
//        let messages = messagesDictionaries?.compactMap({ $0.value }) ?? []
//
//        self.title = title
//        self.identifier = identifier
//        self.messages = messages
//    }
//
//    struct Message: Codable, Equatable, MessageType {
//
//        let text: String
//        let displayName: String
//        let senderID: String
//        let timestamp: Date
//        let messageId: String
//
//        enum CodingKeys: String, CodingKey {
//            case displayName
//            case senderID
//            case text
//            case timestamp
//        }
//
//        // MARK: - MessageType
//        var sentDate: Date { return timestamp }
//        var kind: MessageKind { return .text(text) }
//        var sender: SenderType {
//            return Sender(displayName: displayName, senderId: senderID)
//        }
//
//        init(text: String, sender: Sender, timestamp: Date = Date(), messageId: String = UUID().uuidString) {
//            self.text = text
//            self.displayName = sender.displayName
//            self.senderID = sender.senderId
//            self.timestamp = timestamp
//            self.messageId = messageId
//        }
//
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//
//            let text = try container.decode(String.self, forKey: .text)
//            let displayName = try container.decode(String.self, forKey: .displayName)
//            let senderID = try container.decode(String.self, forKey: .senderID)
//            let timestamp = try container.decode(Date.self, forKey: .timestamp)
//
//            let sender = Sender(displayName: displayName, senderId: senderID)
//
//            self.init(text: text, sender: sender, timestamp: timestamp)
//        }
//
//        func encode(to encoder: Encoder) throws {
//            var container = encoder.container(keyedBy: CodingKeys.self)
//
//            try container.encode(displayName, forKey: .displayName)
//            try container.encode(senderID, forKey: .senderID)
//            try container.encode(timestamp, forKey: .timestamp)
//            try container.encode(text, forKey: .text)
//        }
//    }
//
//    static func ==(lhs: ChatRoom, rhs: ChatRoom) -> Bool {
//        return lhs.title == rhs.title &&
//            lhs.identifier == rhs.identifier &&
//            lhs.messages == rhs.messages
//    }
//
//}

struct Sender: SenderType, Codable {
    var senderId: String
    var displayName: String
    
    init(displayName: String, senderId: String) {
        self.displayName = displayName
        self.senderId = senderId
        
    }
    
    init?(data: [String : Any]) {
        guard let displayName = data["displayName"] as? String,
            let id = data["senderId"] as? String
            else { return nil }
        
        self.displayName = displayName
        self.senderId = id
    }
}
