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
    var dueDate: Date
    var created: Date
    
    init(id: UUID = UUID(), title: String, isComplete: Bool = false, dueDate: Date = Date(), created: Date = Date()) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.created = created
    }
}

extension Todo {
    static var data: [Todo] {
        [
            Todo(title: "Test1", isComplete: true, dueDate: Date()),
            Todo(title: "Test2", isComplete: false, dueDate: Date()),
            Todo(title: "Test3", isComplete: true, dueDate: Date(year: 2021, month: 12, day: 30))
        ]
    }
}

