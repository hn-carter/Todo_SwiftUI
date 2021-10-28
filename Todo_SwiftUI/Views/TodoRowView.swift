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
    let todo: Todo

    var body: some View {
        HStack {
            Text(todo.title)
                .font(.title)
        }
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: Todo.data[0])
    }
}