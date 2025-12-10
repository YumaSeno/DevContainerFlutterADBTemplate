// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 経費一覧と追加/クリアをまとめて扱う Controller
/// - ドメイン層の UseCase (ListExpenses / AddExpense) を利用
/// - UI はこの Provider を watch するだけで、追加・クリア時も自動更新される

@ProviderFor(ExpensesController)
const expensesControllerProvider = ExpensesControllerProvider._();

/// 経費一覧と追加/クリアをまとめて扱う Controller
/// - ドメイン層の UseCase (ListExpenses / AddExpense) を利用
/// - UI はこの Provider を watch するだけで、追加・クリア時も自動更新される
final class ExpensesControllerProvider
    extends $AsyncNotifierProvider<ExpensesController, List<Expense>> {
  /// 経費一覧と追加/クリアをまとめて扱う Controller
  /// - ドメイン層の UseCase (ListExpenses / AddExpense) を利用
  /// - UI はこの Provider を watch するだけで、追加・クリア時も自動更新される
  const ExpensesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expensesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expensesControllerHash();

  @$internal
  @override
  ExpensesController create() => ExpensesController();
}

String _$expensesControllerHash() =>
    r'aec3d4057ca0caf795d80d0bdf42785bd701a003';

/// 経費一覧と追加/クリアをまとめて扱う Controller
/// - ドメイン層の UseCase (ListExpenses / AddExpense) を利用
/// - UI はこの Provider を watch するだけで、追加・クリア時も自動更新される

abstract class _$ExpensesController extends $AsyncNotifier<List<Expense>> {
  FutureOr<List<Expense>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Expense>>, List<Expense>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Expense>>, List<Expense>>,
              AsyncValue<List<Expense>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
