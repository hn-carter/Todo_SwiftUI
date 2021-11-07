//
//  TodoListView.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/29.
//

import SwiftUI

struct TodoListView: View {
    // 編集可能な一覧表示ToDoデータ
    @ObservedObject var viewModel: TodoViewModel
    // SwiftUIは、アプリのSceneインスタンスの現在の動作状態を
    // scenePhase Environment値で示します。
    // これを監視することでアプリが閉じられた時にデータ保存を行います
    @Environment(\.scenePhase) private var scenePhase
    // 保存処理
    let saveAction: () -> Void

    // ToDo追加シート表示フラグ
    @State private var isPresented = false
    
    var body: some View {
        
        if viewModel.Loading {
            Text("Loading...")
        } else {
            List {
                ForEach($viewModel.todos) { todo in
                    TodoRowView(todo: todo)
                }
                .onDelete { indices in
                    // ToDoの1件削除
                    let _ = viewModel.delete(atOffsets: indices)
                }
                if (viewModel.todos.count == 0) {
                    Text("ToDoがありません。")
                }
            }
            .navigationBarItems(trailing: Button("追加") {
                if viewModel.preAdd() {
                    isPresented = true
                }
            })
            .fullScreenCover(isPresented: $isPresented) {
                NavigationView {
                    EditView(viewModel: viewModel)
                    .navigationTitle("ToDo追加")
                    .navigationBarItems(leading: Button("キャンセル") {
                        isPresented = false
                    }, trailing: Button("登録") {
                        if viewModel.add() {
                            isPresented = false
                        }
                    })
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
            Spacer()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        //　いくつかのデータ
        NavigationView {
            TodoListView(viewModel: TodoViewModel(data: TodoViewData.sampleData),
                         saveAction: {})
        }
        // 空データ
        NavigationView {
            TodoListView(viewModel: TodoViewModel(data: TodoViewData.sampleEmptyData),
                         saveAction: {})
        }
    }
}
