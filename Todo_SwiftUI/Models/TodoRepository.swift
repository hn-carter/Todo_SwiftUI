//
//  TodoRepository.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/29.
//

import Foundation

/**
 ToDoデータ保管庫
 ファイルにToDoデータを保管する
 */
class TodoRepository: ObservableObject {
    /**
     データファイルを置くURLを表す
     */
    private static var documentsFolder: URL {
        do {
            // user’s Documents フォルダのURLを返す
            // FileManager.default : プロセスの共有ファイル管理オブジェクト
            // func url(
            //   for directory: FileManager.SearchPathDirectory, ドキュメントディレクトリ
            //   in domain: FileManager.SearchPathDomainMask, ユーザーのホームディレクトリ
            //   appropriateFor url: URL?, 使用しない (一時ディレクトリを使用するときのVolume ?)
            //   create shouldCreate: Bool ディレクトリを新規作成しない
            // ) throws -> URL
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }

    // ToDoデータを保管しいてるファイルのURLを返す
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("todo.data")
    }

    // ToDoデータ
    var todos: [Todo] = []
    
    /**
     ファイルからTodoデータを読み込む
     */
    func load() {
       // toto.data ファイルを data 定数に読み込む
        guard let data = try? Data(contentsOf: TodoRepository.fileURL) else {
            return
        }
        // data 定数をJSONDecoder でスクラムデータを [Todo] にデコードする
        guard let loadedTodos = try? JSONDecoder().decode([Todo].self, from: data) else {
            print("Can't decode saved todo data.")
            fatalError("Can't decode saved todo data.")
        }
        // main キューでToDoデータの設定処理を行います
        self.todos = loadedTodos
    }
  
    /**
     ToDoデータをファイルに保存する
     */
    func save() {
        // todos データを JSONEncoder でエンコードします
        guard let data = try? JSONEncoder().encode(self.todos) else { fatalError("Error encoding data") }

        // エンコード結果をtodo.dataファイルに書き込みます
        do {
            let outfile = TodoRepository.fileURL
            try data.write(to: outfile)
        } catch {
            fatalError("Can't write to file")
        }
    }
}
