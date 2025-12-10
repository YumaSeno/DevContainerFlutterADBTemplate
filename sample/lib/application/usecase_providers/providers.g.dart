// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 経費追加用の UseCase Provider

@ProviderFor(addExpenseUseCase)
const addExpenseUseCaseProvider = AddExpenseUseCaseProvider._();

/// 経費追加用の UseCase Provider

final class AddExpenseUseCaseProvider
    extends $FunctionalProvider<AddExpense, AddExpense, AddExpense>
    with $Provider<AddExpense> {
  /// 経費追加用の UseCase Provider
  const AddExpenseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addExpenseUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addExpenseUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddExpense> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddExpense create(Ref ref) {
    return addExpenseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddExpense value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddExpense>(value),
    );
  }
}

String _$addExpenseUseCaseHash() => r'1d2954ac37cb924f5f07ca46b436017d0fbd6960';

/// 経費全削除用の UseCase Provider

@ProviderFor(clearExpensesUseCase)
const clearExpensesUseCaseProvider = ClearExpensesUseCaseProvider._();

/// 経費全削除用の UseCase Provider

final class ClearExpensesUseCaseProvider
    extends $FunctionalProvider<ClearExpenses, ClearExpenses, ClearExpenses>
    with $Provider<ClearExpenses> {
  /// 経費全削除用の UseCase Provider
  const ClearExpensesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clearExpensesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clearExpensesUseCaseHash();

  @$internal
  @override
  $ProviderElement<ClearExpenses> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClearExpenses create(Ref ref) {
    return clearExpensesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClearExpenses value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClearExpenses>(value),
    );
  }
}

String _$clearExpensesUseCaseHash() =>
    r'fb35595aaf700d5a7bb0b4638114eaec5266bf9f';

/// 経費一覧取得用の UseCase Provider

@ProviderFor(listExpensesUseCase)
const listExpensesUseCaseProvider = ListExpensesUseCaseProvider._();

/// 経費一覧取得用の UseCase Provider

final class ListExpensesUseCaseProvider
    extends $FunctionalProvider<ListExpenses, ListExpenses, ListExpenses>
    with $Provider<ListExpenses> {
  /// 経費一覧取得用の UseCase Provider
  const ListExpensesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listExpensesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listExpensesUseCaseHash();

  @$internal
  @override
  $ProviderElement<ListExpenses> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ListExpenses create(Ref ref) {
    return listExpensesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListExpenses value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListExpenses>(value),
    );
  }
}

String _$listExpensesUseCaseHash() =>
    r'4cbda4c0d277cf6cf5b00816c6916bc190926729';
