# Todo_SwiftUI

SwiftUIの学習用


## 機能

最低限のToDoアプリ

* ToDoの追加
* ToDoの完了チェック
* ToDoの削除
* ToDoを本体にファイル保存
* 日本語と英語に対応


## ファイル構成

MVVMアーキテクチャで作成しています。

```
Todo_SwiftUIApp.swift
Models
  // ToDoデータ
  Todo.swift
  // ToDoデータの操作
  TodoRepository.swift
ViewModels
  // Viewで呼び出す処理
  TodoViewModel.swift
  // Viewでの表示ToDoデータ形式
  TodoViewData.swift
Views
  // TodoListViewから追加ボタンで表示
  EditView.swift
  // 1件のToDo表示
  TodoRowView.swift
  // TodoRowViewをリスト表示
  TodoListView.swift
```

画面遷移
```
ToDoをリスト表示 (追加ボタン)
[TodoListView]     →     [EditView]
↑ 行ごとの表示
[TodoRowView]
```

イベント
```
エントリーポイント
[Todo_SwiftUIApp]
TodoViewModel.load ファイル読み込み

リスト
[TodoListView]
TodoViewModel.preAdd Todo追加前処理
TodoViewModel.add Todo1件追加(入力チェック)
TodoViewModel.delete Todo1件削除
TodoViewModel.save ファイルに保存

追加
[EditView]
TodoViewModelのエラーメッセージ表示
```

多言語対応
* 英語 en.lproj
* 日本語 ja.lproj
