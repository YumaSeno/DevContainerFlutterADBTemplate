import 'package:auto_route/auto_route.dart';
import 'package:cariri/application/controller/monthly_total_controller/monthly_total_controller.dart';
import 'package:cariri/presentation/components/loading.dart';
import 'package:cariri/presentation/components/scaled_padding.dart';
import 'package:cariri/presentation/components/scaled_sizedbox.dart';
import 'package:cariri/presentation/providers/overlay/overlay_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cariri/presentation/providers/theme/theme_provider.dart';
import 'package:cariri/presentation/components/counter_card.dart';
import 'package:cariri/presentation/components/expense_card.dart';
import 'package:cariri/presentation/utils.dart';
import 'package:cariri/domain/entities/expense.dart';
import 'package:decimal/decimal.dart';
import 'package:cariri/application/controller/expenses_controller/expenses_controller.dart';

part 'home_state.dart';
part 'home_view_model.dart';

part 'widgets/home_local_counter.dart';
part 'widgets/home_expense_summary.dart';

part 'home_screen_phone.dart';
part 'home_screen_tablet.dart';

part 'home_screen.freezed.dart';
part 'home_screen.g.dart';

/// 画面V01のルートウィジェット
///
/// ホーム画面。
@RoutePage()
class HomeScreen extends ConsumerWidget {
  /// コンストラクタ
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ViewModel のエラー遷移を監視してスナックバーで通知
    ref.listen<AsyncValue<_UiState>>(_viewModelProvider, (_, next) {
      final isError = next.hasError;
      final isLoading = next.isLoading || next.isRefreshing || next.isReloading;

      if (!isLoading && isError) {
        final message = next.error?.toString() ?? '処理に失敗しました';
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    });

    final (hasValue, hasError) = ref.watch(
      _viewModelProvider.select((s) => (s.hasValue, s.hasError)),
    );
    if (!hasValue) {
      return const Loading(opacity: 1);
    }
    if (!hasValue && hasError) {
      return Scaffold(
        body: Center(
          child: Text(
            'エラーが発生しました',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
    }
    return const _ResponsiveLayout();
  }
}

class _ResponsiveLayout extends HookWidget {
  /// コンストラクタ
  const _ResponsiveLayout();

  @override
  Widget build(BuildContext context) {
    // 画面限定のTextEditingControllerはHookで管理
    // （Domainとは無関係な、画面専用の一時的状態の例）
    final nameController = useTextEditingController();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTabletLayout = constraints.maxWidth > 600;

        if (isTabletLayout) {
          return _TabletBody(nameController: nameController);
        } else {
          return _PhoneBody(nameController: nameController);
        }
      },
    );
  }
}
