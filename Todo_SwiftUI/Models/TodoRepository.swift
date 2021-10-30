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


    var todos: [Todo] = []
    
    /**
     ファイルからTodoデータを読み込む
     */
    func load() {
        
    }
  
    /**
     
     */
    func save() {
        
    }
}
