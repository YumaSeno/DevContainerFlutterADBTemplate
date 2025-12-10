import 'package:cariri/presentation/components/loading.dart';
import 'package:cariri/presentation/providers/overlay/overlay_provider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 各オーバーレイの制御を行うルートシェル
///
/// 以下の機能を提供します：
/// - ローディングオーバーレイの表示制御
/// - タップ時にキーボードを閉じるジェスチャー検
/// - ボトムナビゲーションの表示制御
@RoutePage()
class OverlayShell extends ConsumerWidget {
  /// コンストラクタ
  const OverlayShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loadingOverlayProvider, (prev, next) {
      // ローディング開始時にキーボードを閉じる
      if (prev != next && next == true) {
        FocusScope.of(context).unfocus();
      }
    });
    final isLoading = ref.watch(loadingOverlayProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: _LoadingOverlay(
        isLoading: isLoading,
        child: const _TabbedScaffold(),
      ),
    );
  }
}

class _TabbedScaffold extends ConsumerWidget {
  const _TabbedScaffold();

  static const _bottomNavItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: 'List', icon: Icon(Icons.list)),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBottomNavigationVisible = ref.watch(
      bottomNavigationVisibilityProvider,
    );
    return AutoTabsScaffold(
      bottomNavigationBuilder: isBottomNavigationVisible
          ? (_, tabsRouter) {
              return BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: _bottomNavItems,
              );
            }
          : null,
    );
  }
}

/// ローディングオーバーレイウィジェット
class _LoadingOverlay extends StatelessWidget {
  /// コンストラクタ
  const _LoadingOverlay({required this.isLoading, required this.child});

  /// ローディング中かどうか
  final bool isLoading;

  /// オーバーレイの下に表示する子ウィジェット
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }

    return Stack(
      children: [
        child,
        const ModalBarrier(dismissible: false, color: Colors.black38),
        const Loading(opacity: 0.5),
      ],
    );
  }
}
