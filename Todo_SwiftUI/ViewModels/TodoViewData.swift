//
//  TodoViewData.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/30.
//

import Foundation

/**
 画面表示用ToDoデータ構造体
 */
struct TodoViewData: Identifiable {
    let id: UUID
    // タイトル
    var title: String
    // 期限
    var dueDate: Date
    // 完了
    var isComplete: Bool
    
    init(id: UUID = UUID(), title: String = "", isComplete: Bool = false, dueDate: Date = Date()) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.isComplete = isComplete
    }

    /**
     モデルから表示用に変換
     */
    init(todo: Todo) {
        self.id = UUID()
        self.title = todo.title
        self.isComplete = todo.isComplete
        self.dueDate = todo.dueDate
    }
}

// プレビュー用サンプルデータ
extension TodoViewData {
    static var sampleData: [TodoViewData] {
        [
            TodoViewData(title: "iMacの電源を入れる", isComplete: true, dueDate: Date()),
            TodoViewData(title: "Xcodeを起動する", isComplete: true, dueDate: Date(timeIntervalSinceNow: 3600)),
            TodoViewData(title: "なんかすごいあぷりをつくる", isComplete: false, dueDate: Date(year: 2021, month: 12, day: 31))
        ]
    }
    static var sampleEmptyData: [TodoViewData] {
        []
    }
}
