// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_expenses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 経費一覧取得ユースケース用のProvider

@ProviderFor(listExpensesUseCase)
const listExpensesUseCaseProvider = ListExpensesUseCaseProvider._();

/// 経費一覧取得ユースケース用のProvider

final class ListExpensesUseCaseProvider
    extends $FunctionalProvider<ListExpenses, ListExpenses, ListExpenses>
    with $Provider<ListExpenses> {
  /// 経費一覧取得ユースケース用のProvider
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
    r'd2cbf25090c429abded348d880cbbfb34e213a72';
