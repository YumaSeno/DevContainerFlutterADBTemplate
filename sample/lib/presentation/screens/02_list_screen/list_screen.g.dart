// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_ViewModel)
const _viewModelProvider = _ViewModelProvider._();

final class _ViewModelProvider
    extends $AsyncNotifierProvider<_ViewModel, _UiState> {
  const _ViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_viewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_viewModelHash();

  @$internal
  @override
  _ViewModel create() => _ViewModel();
}

String _$_viewModelHash() => r'0dfb0ea7c8b4691545f77090b8de81009cb9698c';

abstract class _$ViewModel extends $AsyncNotifier<_UiState> {
  FutureOr<_UiState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<_UiState>, _UiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<_UiState>, _UiState>,
              AsyncValue<_UiState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
