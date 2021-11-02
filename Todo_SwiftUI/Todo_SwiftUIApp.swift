//
//  Todo_SwiftUIApp.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/21.
//

import SwiftUI

@main
struct Todo_SwiftUIApp: App {
    @ObservedObject private var data = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView(todoDate: $data.todos)
            }
            // 表示時にファイルからデータを読み込む
            .onAppear {
                data.load()
            }
        }
    }
}
