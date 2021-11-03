//
//  TodoViewModel.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/29.
//

import Foundation

/**
 TodoデータのViewModel
 */
class TodoViewModel: ObservableObject {
    var todoModel: TodoRepository = TodoRepository()
    
    // 画面表示用ToDoリスト
    @Published var todos: [TodoViewData] = []

    init(data: [TodoViewData] = [TodoViewData]()) {
        self.todos = repositories
    }

    /**
     ToDoを追加する
     */
    func add(todo: TodoViewData) {
        self.todos.append(todo)
    }
    
    /**
     ファイルからTodoデータを読み込む
     */
    func load() {
        
    }
  
    /**
     
     */
    func save() {
        
    }

    
}
