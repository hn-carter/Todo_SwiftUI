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
    var title: String
    var isComplete: Bool
    
    init(id: UUID = UUID(), title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
}
