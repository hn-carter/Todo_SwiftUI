//
//  EditView.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/11/01.
//

import SwiftUI

struct EditView: View {
    @Binding var todo: TodoViewData
    
    var body: some View {
        List {
            Section(header: Text("タイトル")) {
                TextField("やること", text: $todo.title)
                    .font(.title)
            }
            Section(header: Text("期限")) {
                DatePicker("期限", selection: $todo.dueDate)
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(todo: .constant(TodoViewModel.sampleData[0]))
    }
}