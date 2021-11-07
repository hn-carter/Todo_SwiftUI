//
//  TodoRowView.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/28.
//

import SwiftUI

/**
 Togoリストの行View
 */
struct TodoRowView: View {
    @Binding var todo: TodoViewData

    var body: some View {
        HStack {
            Button(action: {
                todo.isComplete.toggle()
            }) {
                HStack {
                    Image(systemName: todo.isComplete ? "checkmark.square.fill" : "square")
                        .foregroundColor(Color.green)
                    .font(.title)
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Image(systemName: "clock")
                            Text(todo.dueDate.dueDateString)
                                .font(.headline)
                        }
                    }
                    .foregroundColor(.black)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: .constant(TodoViewData.sampleData[2]))
    }
}
