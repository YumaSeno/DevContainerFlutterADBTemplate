# Flutter + ADB 開発コンテナ

これはFlutterとADB（Android Debug Bridge）ツールが事前設定された開発環境を提供するdevcontainerテンプレートです。

## 使用方法

Flutterプロジェクト自体は作成されていません。vscode拡張機能の.devcontainerで起動後、以下のコマンドでプロジェクトを作成してください。
```bash
flutter create --org your_domain --project-name your_app_name .
#例）
flutter create --org io.github.yumaseno --project-name test .
```
---
また、開発時にはRiverpod, flutter_hooks, auto_route, freezedの利用をおすすめします。　  
サンプルプロジェクトを利用する場合は以下を実行してください。
```bash
flutter pub add hooks_riverpod riverpod_annotation freezed_annotation flutter_hooks auto_route shared_preferences flutter_secure_storage decimal intl
flutter pub add --dev build_runner auto_route_generator freezed json_serializable custom_lint riverpod_generator riverpod_lint
```
analysis_options.yaml
```yaml
analyzer:
  plugins:
    - custom_lint
```
ターミナルを一つ起動し以下のコマンドを常駐させてください。
```bash
dart run build_runner watch --delete-conflicting-outputs
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

