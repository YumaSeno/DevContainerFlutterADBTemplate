import 'package:cariri/infrastructure/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

/// 現在のテーマモードを管理するプロバイダー
@riverpod
class CurrentTheme extends _$CurrentTheme {
  @override
  ThemeMode build() {
    return PrefItems.themeMode.get();
  }

  /// テーマモードを設定し、ローカルストレージに保存します
  void set(ThemeMode mode) {
    PrefItems.themeMode.set(mode);
    state = mode;
  }
}
