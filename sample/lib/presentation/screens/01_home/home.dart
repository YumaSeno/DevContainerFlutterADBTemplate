import 'package:cariri/presentation/components/loading.dart';
import 'package:cariri/presentation/components/scaled_padding.dart';
import 'package:cariri/presentation/components/scaled_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cariri/presentation/providers/theme_provider.dart';
import 'package:cariri/presentation/components/counter_card.dart';
import 'package:cariri/presentation/components/expense_card.dart';
import 'package:cariri/infrastructure/providers.dart';
import 'package:decimal/decimal.dart';
import 'package:cariri/domain/entities/expense.dart';
import 'package:cariri/presentation/utils.dart';
import 'package:cariri/application/add_expense/add_expense_provider.dart';
import 'package:cariri/application/list_expenses/list_expenses_provider.dart';
import 'package:cariri/application/monthly_total/monthly_total_provider.dart';

part 'home_state.dart';
part 'home_view_model.dart';

part 'home_phone.dart';
part 'home_tablet.dart';

part 'home.freezed.dart';
part 'home.g.dart';

/// 画面V01のルートウィジェット
///
/// ホーム画面。
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasValue = ref.watch(_viewModelProvider.select((s) => s.hasValue));
    final hasError = ref.watch(_viewModelProvider.select((s) => s.hasError));
    if (!hasValue) {
      return const Loading();
    } else if (hasError) {
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
          return _TabletBody(
            nameController: nameController,
          );
        } else {
          return _PhoneBody(
            nameController: nameController,
          );
        }
      },
    );
  }
}
