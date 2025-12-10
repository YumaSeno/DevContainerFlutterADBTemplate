import 'package:auto_route/auto_route.dart';
import 'package:cariri/presentation/components/loading.dart';
import 'package:cariri/presentation/components/scaled_padding.dart';
import 'package:cariri/presentation/components/scaled_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cariri/presentation/providers/theme/theme_provider.dart';
import 'package:cariri/presentation/utils.dart';
import 'package:cariri/domain/entities/expense.dart';
import 'package:cariri/application/controller/expenses_controller/expenses_controller.dart';

part 'list_state.dart';
part 'list_view_model.dart';

part 'widgets/list_expense_list.dart';

part 'list_screen_phone.dart';
part 'list_screen_tablet.dart';

part 'list_screen.freezed.dart';
part 'list_screen.g.dart';

/// 画面V02のルートウィジェット
///
/// リスト画面。
@RoutePage()
class ListScreen extends ConsumerWidget {
  /// コンストラクタ
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (hasValue, hasError) = ref.watch(
      _viewModelProvider.select((s) => (s.hasValue, s.hasError)),
    );
    if (!hasValue) {
      return const Loading();
    }
    if (hasError) {
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
