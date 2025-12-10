import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'overlay_provider.g.dart';

/// ローディングオーバーレイの状態
@riverpod
class LoadingOverlay extends _$LoadingOverlay {
  @override
  bool build() => false;

  /// 表示する
  void show() => state = true;

  /// 非表示にする
  void hide() => state = false;

  /// 状態を設定する
  void set(bool value) => state = value;
}

/// ボトムナビゲーションの表示状態
@riverpod
class BottomNavigationVisibility extends _$BottomNavigationVisibility {
  @override
  bool build() => true;

  /// 表示する
  void show() => state = true;

  /// 非表示にする
  void hide() => state = false;

  /// 状態を設定する
  void set(bool value) => state = value;
}

/// オーバーレイ制御用のコントローラー
class OverlayController {
  /// コンストラクタ
  OverlayController(this._ref);

  final Ref _ref;

  /// ローディングオーバーレイを表示する
  void showLoading() => _ref.read(loadingOverlayProvider.notifier).show();

  /// ローディングオーバーレイを非表示にする
  void hideLoading() => _ref.read(loadingOverlayProvider.notifier).hide();

  /// ボトムナビゲーションを表示する
  void showBottomNavigation() =>
      _ref.read(bottomNavigationVisibilityProvider.notifier).show();

  /// ボトムナビゲーションを非表示にする
  void hideBottomNavigation() =>
      _ref.read(bottomNavigationVisibilityProvider.notifier).hide();
}

/// オーバーレイコントローラーのプロバイダー
@riverpod
OverlayController overlayController(Ref ref) => OverlayController(ref);
