//
//  TodoListView.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/29.
//

import SwiftUI

struct TodoListView: View {
    // 編集可能な一覧表示ToDoデータ
    @StateObject var viewModel: TodoViewModel
    // ToDo追加シート表示フラグ
    @State private var isPresented = false
    @State private var newTodo: TodoViewData = TodoViewData(title: "", isComplete: false, dueDate: Date())
    //@state private var errorInfo: String
    
    var body: some View {
        List {
            ForEach($viewModel.todos) { todo in
                TodoRowView(todo: todo)
            }
            .onDelete { indices in
                viewModel.delete(atOffsets: indices)
            }
            if (viewModel.todos.count == 0) {
                Text("ToDoがありません。")
            }
        }
        .navigationBarItems(trailing: Button("追加") {
            isPresented = true
        })
        .navigationTitle("ToDoリスト")
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(viewModel: viewModel,
                         todo: $newTodo)
                .navigationTitle("ToDo追加")
                .navigationBarItems(leading: Button("キャンセル") {
                    isPresented = false
                }, trailing: Button("追加") {
                    isPresented = false
                    viewModel.add(todo: newTodo)
                })
            }
        }

    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        //　いくつかのデータ
        TodoListView(viewModel: TodoViewModel(data: TodoViewData.sampleData))
        // 空データ
         TodoListView(viewModel: TodoViewModel(data: TodoViewData.sampleEmptyData))
    }
}
