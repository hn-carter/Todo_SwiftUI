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
// プレビュー用サンプルデータ
extension TodoViewModel {
    static var sampleData: [TodoViewData] {
        [
            TodoViewData(title: "iMacの電源を入れる", isComplete: true, dueDate: Date()),
            TodoViewData(title: "Xcodeを起動する", isComplete: true, dueDate: Date(timeIntervalSinceNow: 3600)),
            TodoViewData(title: "なんかすごいあぷりをつくる", isComplete: false, dueDate: Date(year: 2021, month: 12, day: 31))
        ]
    }
}

