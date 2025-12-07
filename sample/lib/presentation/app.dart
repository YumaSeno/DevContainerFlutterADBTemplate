import 'package:cariri/presentation/providers/theme_provider.dart';
import 'package:cariri/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// メインのアプリケーションウィジェット
///
/// ルートウィジェットとして機能し、テーマとルーティングを設定します。
/// [ConsumerWidget]を継承しており、Riverpodのプロバイダーから状態を取得します。
class App extends ConsumerWidget {
  /// コンストラクタ
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeMode = ref.watch(currentThemeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: themeMode,
      routerConfig: goRouter,
    );
  }
}
