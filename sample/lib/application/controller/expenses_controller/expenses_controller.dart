import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cariri/domain/entities/expense.dart';
import 'package:cariri/application/usecase_providers/providers.dart';

part 'expenses_controller.g.dart';

/// 経費一覧と追加/クリアをまとめて扱う Controller
/// - ドメイン層の UseCase (ListExpenses / AddExpense) を利用
/// - UI はこの Provider を watch するだけで、追加・クリア時も自動更新される
@riverpod
class ExpensesController extends _$ExpensesController {
  @override
  Future<List<Expense>> build() async {
    final listUseCase = ref.read(listExpensesUseCaseProvider);
    return listUseCase();
  }

  /// 経費を追加し、最新の一覧で state を更新
  Future<void> add(Expense e) async {
    final addUseCase = ref.read(addExpenseUseCaseProvider);
    await addUseCase(e);

    // 追加後に一覧を再取得して state を更新
    state = await AsyncValue.guard(() async {
      final listUseCase = ref.read(listExpensesUseCaseProvider);
      return listUseCase();
    });
  }

  /// 経費をすべてクリアし、state も空リストにする
  Future<void> clear() async {
    final clearUseCase = ref.read(clearExpensesUseCaseProvider);
    await clearUseCase();

    // クリア後の一覧を再取得して state を更新
    state = await AsyncValue.guard(() async {
      final listUseCase = ref.read(listExpensesUseCaseProvider);
      return listUseCase();
    });
  }

  /// 手動リロード用のメソッド
  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final listUseCase = ref.read(listExpensesUseCaseProvider);
      return listUseCase();
    });
  }
}
