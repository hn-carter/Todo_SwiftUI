//
//  TodoListView.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/29.
//

import SwiftUI

struct TodoListView: View {
    @Binding var todoViewModel: TodoViewModel
    
    var body: some View {
        ZStack {
            List {
                ForEach(todoViewModel.todos) { todo in
                    TodoRowView(todo: todo)
                }
            }
            if (todoViewModel.todos.count == 0) {
                Text("ToDoがありません。")
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoViewModel: .constant(TodoViewModel()))
    }
}
