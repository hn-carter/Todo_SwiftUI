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
 1.ToDoの新規追加前処理
 2.ToDoを1件新規追加する
 3.ToDoを1件削除する
 4.ToDoデータをファイルから読み込む
 5.ToDoデータをファイルに保存する
 */
class TodoViewModel: ObservableObject {
    var todoModel: TodoRepository = TodoRepository()
    
    // 画面表示用ToDoリスト
    @Published var todos: [TodoViewData]
    // 新規登録用ToDoデータ
    @Published var newTodo: TodoViewData
    // 読み込み中
    @Published var Loading: Bool = false
    
    // エラーメッセージ - タイトル
    @Published var errorTitle: String?
    // エラーメッセージ - 期間
    @Published var errorDueDate: String?

    init(data: [TodoViewData] = [TodoViewData](), newTodo: TodoViewData = TodoViewData()) {
        self.todos = data
        self.newTodo = newTodo
    }

    /**
     ToDoの新規追加前処理
     - Returns: 処理結果
     */
    func preAdd() -> Bool {
        // 新規追加データのデフォルト値
        self.newTodo = TodoViewData(title: "", isComplete: false, dueDate: Date())
        return true
    }
    /**
     ToDoを1件新規追加する
     入力内容にエラーがあればメッセージが設定される
     - Returns: 処理結果
     */
    func add() -> Bool {
        // 入力チェック
        self.errorTitle = nil
        self.errorDueDate = nil
        var errorFlag = false
        // タイトルが入力されているか？
        if self.newTodo.title.isEmpty {
            errorFlag = true
            self.errorTitle = "タイトルは必ず入力してください。"
        }
        // 期限が現在以降か？
        if self.newTodo.dueDate < Date() {
            errorFlag = true
            self.errorDueDate = "期限は現在以降を入力してください。"
        }

        // エラー終了
        if errorFlag {
            return false
        }
        
        //　エラーがなければToDoを追加する
        self.todos.append(self.newTodo)
        return true
    }
    
    /**
     ToDoを1件削除する
     - Parameter atOffsets: 削除位置
     - Returns: 処理結果
     */
    func delete(atOffsets: IndexSet) -> Bool {
        guard let idx = atOffsets.first else {
            return false
        }
        self.todos.remove(at: idx)
        return true
    }
    /**
     ToDoデータをファイルから読み込む
     */
    func load() {
        self.Loading = true
        // DispatchQue : メインスレッドまたはバックグラウンドスレッドでタスクの実行を連続的または同時に管理するオブジェクト
        // バックグラウンドタスクは、すべてのタスクの中で最も優先度が低くなります
        // async : タスクの非同期実行
        DispatchQueue.global(qos: .background).async { [weak self] in
            // toto.data ファイルを data 定数に読み込む
            #if DEBUG
            print("デバッグ")
            DispatchQueue.main.async {
                // DEBUG 中はサンプルデータを使う
                self?.todos = TodoViewModel.convView(todo: Todo.data)
                self!.Loading = false
            }
            #else
            self?.todoModel.load()
            #endif
            // main キューでスクラムデータの設定処理を行います
            DispatchQueue.main.async {
                self?.todos = TodoViewModel.convView(todo: (self?.todoModel.todos)!)
                self!.Loading = false
            }
        }
    }
    
    /**
     モデルデータを表示形式に変換
     */
    static func convView(todo: [Todo]) -> [TodoViewData] {
        var result: [TodoViewData]
        result = todo.map{ TodoViewData(todo: $0) }
        return result
    }
    
    /**
     4.ToDoデータをファイルに保存する
     */
    func save() {
        // バックグラウンドキューで、selfがスコsープ内にあることを確認します
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.todoModel.todos = TodoViewModel.convModel(todo: self!.todos)
            self?.todoModel.save()
        }
    }
    
    static func convModel(todo: [TodoViewData]) -> [Todo] {
        var result: [Todo]
        result = todo.map{ Todo(title: $0.title, isComplete: $0.isComplete, dueDate: $0.dueDate) }
        return result
    }
}
