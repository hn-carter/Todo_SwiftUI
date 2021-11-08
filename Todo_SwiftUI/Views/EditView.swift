//
//  EditView.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/11/01.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var viewModel: TodoViewModel
    
    var body: some View {
        List {
            Section(header: Text("title")) {
                let msg = NSLocalizedString("enterTodo", comment: "")
                TextField(msg, text: $viewModel.newTodo.title)
                    .font(.title)
                if let error = viewModel.errorTitle {
                    Text(error)
                        .font(.headline)
                        .foregroundColor(Color.red)
                }
            }
            Section(header: Text("dueDate")) {
                DatePicker("dueDate",
                           selection: $viewModel.newTodo.dueDate,
                           displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.graphical)
                if let error = viewModel.errorDueDate {
                    Text(error)
                        .font(.headline)
                        .foregroundColor(Color.red)
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(viewModel: TodoViewModel())
            .environment(\.locale, .init(identifier: "ja-JP"))
    }
}
