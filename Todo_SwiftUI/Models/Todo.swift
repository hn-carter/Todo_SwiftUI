//
//  Todo.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/28.
//

import Foundation

/**
 ToDoデータ
 */
struct Todo: Identifiable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    
    init(id: UUID = UUID(), title: String, isComplete: Bool = false) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    // プレビュー用サンプルデータ
    static var data: [Todo] {
        [
            Todo(title: "iMacの電源を入れる", isComplete: true),
            Todo(title: "Xcodeを起動する", isComplete: true),
            Todo(title: "なんかすごいあぷりをつくる")
        ]
    }
}
