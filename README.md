# Flutter + ADB 開発コンテナ

これはFlutterとADB（Android Debug Bridge）ツールが事前設定された開発環境を提供するdevcontainerテンプレートです。

## 使用方法

Flutterプロジェクト自体は作成されていません。vscode拡張機能の.devcontainerで起動後、以下のコマンドでプロジェクトを作成してください。
```bash
flutter create --org your_domain --project-name your_app_name .
```
例）
```bash
flutter create --org io.github.yumaseno --project-name test .
```

## ADB接続方法メモ

以下コマンドでペアリング→接続。  
スマホ側の操作としては「ワイヤレスでバッグ」→「専用コードによるペア設定」。  
ペアリング時と接続時でポートが違うので注意。
```bash
adb pair 192.168.~.~:~
adb connect 192.168.~.~:~
```

<!----------------------ここまでテンプレート用。本番では削除して。---------------------->
<!--

# プロジェクト名

## 概要
このプロジェクトの概要を記述してください。

## 環境構築

### 必要な環境
- Docker
- Visual Studio Code
- Dev Containers拡張機能

### セットアップ手順
1. このリポジトリをクローンします
2. Visual Studio Codeでプロジェクトを開きます
3. 「Dev Container: Reopen in Container」を実行します

## 開発

### プロジェクトの実行
```bash
flutter run
```

### テストの実行
```bash
flutter test
```

### ビルド
```bash
flutter build apk
```

## プロジェクト構成
```
├── lib/
│   └── main.dart
├── test/
├── android/
├── ios/
└── pubspec.yaml
```

## 使用技術
- Flutter
- Dart
- Android SDK
- ADB (Android Debug Bridge)

## ライセンス
このプロジェクトのライセンスを記述してください。

