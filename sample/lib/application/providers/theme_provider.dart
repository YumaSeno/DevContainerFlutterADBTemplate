import 'package:cariri/core/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class CurrentTheme extends _$CurrentTheme {
  @override
  ThemeMode build() {
    return PrefItems.themeMode.get();
  }

  void set(ThemeMode mode) {
    PrefItems.themeMode.set(mode);
    state = mode;
  }
}
