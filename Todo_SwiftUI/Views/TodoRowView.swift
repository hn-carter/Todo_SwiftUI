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
    let todo: TodoViewData

    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: todo.isComplete ? "checkmark.square.fill" : "square")
                    .font(.title)
                Text(todo.title)
                    .font(.title)
            }
            .foregroundColor(.black)
            
            Spacer()
        }
        .padding()
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: TodoViewModel.sampleData[2])
    }
}
