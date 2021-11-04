//
//  TodoViewModel.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/29.
//

import Foundation

/**
 TodoデータのViewModel
 ToDo画面で以下の機能を提供する
 1.ToDoを1件新規追加する
 2.ToDoを1件削除する
 3.ToDoデータをファイルから読み込む
 4.ToDoデータをファイルに保存する
 */
class TodoViewModel: ObservableObject {
    var todoModel: TodoRepository = TodoRepository()
    
    // 画面表示用ToDoリスト
    @Published var todos: [TodoViewData] = []

    init(data: [TodoViewData] = [TodoViewData]()) {
        self.todos = data
    }

    /**
     1.ToDoを1件新規追加する
     */
    func add(todo: TodoViewData) {
        self.todos.append(todo)
    }
    
    /**
     2.ToDoを1件削除する
     */
    func delete(atOffsets: IndexSet) {
        
    }
    /**
     3.ToDoデータをファイルから読み込む
     */
    func load() {
        
    }
  
    /**
     4.ToDoデータをファイルに保存する
     */
    func save() {
        
    }

    
}
