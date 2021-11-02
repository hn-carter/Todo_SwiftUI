//
//  TodoListView.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/29.
//

import SwiftUI

struct TodoListView: View {
    // 編集可能な一覧表示ToDoデータ
    @Binding var todoDate: [TodoViewData]
    // ToDo追加シート表示フラグ
    @State private var isPresented = false
    @State private var newTodo: TodoViewData = TodoViewData(title: "", isComplete: false, dueDate: Date())
    
    var body: some View {
        List {
            ForEach($todoDate) { todo in
                TodoRowView(todo: todo)
            }
            if (todoDate.count == 0) {
                Text("ToDoがありません。")
            }
        }
        .navigationBarItems(trailing: Button("追加") {
            isPresented = true
        })
        .navigationTitle("ToDoリスト")
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(todo: $newTodo)
                .navigationTitle("ToDo追加")
                .navigationBarItems(leading: Button("Cancel") {
                    isPresented = false
                }, trailing: Button("Done") {
                    isPresented = false
                    todoDate.append(newTodo)
                })
            }
        }

    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoDate: .constant(TodoViewModel.sampleData))
        TodoListView(todoDate: .constant(TodoViewModel.sampleEmptyData))
    }
}
