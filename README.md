# Rails Todoアプリ

これはRuby on Railsで作成されたシンプルなTodoアプリケーションです。ユーザーは自分のTodoタスクを作成、管理、完了させることができます。このアプリケーションは[https://nexusxsatoshi.com](https://nexusxsatoshi.com) で利用可能です。

## 特長とAPIの使い方

ユーザー認証: ユーザーはサインアップ、ログイン、ログアウトが可能です。ユーザー認証はJWTを使用しています。
   ```sh
 # ユーザー登録
curl -X POST -H "Content-Type: application/json" -d '{ "user": { "username": "testuser", "email": "testuser@example.com", "password": "testpassword" } }' https://nexusxsatoshi.com/api/users

# ログインとJWTトークン取得
curl -X POST -H "Content-Type: application/json" -d '{ "user": { "email": "testuser@example.com", "password": "testpassword" } }' https://nexusxsatoshi.com/api/users/login

   ```

TodoのCRUD: ユーザーは自分のTodoタスクを作成、閲覧、更新、削除が可能です。Todoの作成はJWT認証が必要です。
   ```sh
   # Todoタスクの作成
   curl -X POST -H "Content-Type: application/json" -d '{ "todo": { "title": "Task 1", "description": "My first task" } }' https://nexusxsatoshi.com/api/todos
   ```

## 依存性

このアプリケーションは次の依存性を要します:

- Ruby 3.2.0
- Rails 7.05

## インフラ構成図
[![Image from Gyazo](https://i.gyazo.com/c769b8699b61fbf2fc7a1cf85fd424d9.png)](https://gyazo.com/c769b8699b61fbf2fc7a1cf85fd424d9)

## 開発環境での始め方

アプリケーションをローカルで開発するための手順は次の通りです:

1. リポジトリをクローンします:

```sh
git clone https://github.com/aratetete0619/RealWorld.git
```

2. 依存性をインストールします:

```sh
bundle install
```

3. データベースをセットアップします:

```sh
rails db:create
rails db:migrate
```

4. サーバーを起動します

```sh
rails server
```

5. ウェブブラウザを開き、`http://localhost:3000` にアクセスしてアプリケーションを利用します。

## 貢献

ご意見、改善案、バグ修正など大歓迎です！何かあれば、イシューを開いたり、プルリクエストを送信してください。




