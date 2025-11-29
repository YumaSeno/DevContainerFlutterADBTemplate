// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v01.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_ViewModel)
const _viewModelProvider = _ViewModelProvider._();

final class _ViewModelProvider extends $NotifierProvider<_ViewModel, _UiState> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(_UiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<_UiState>(value),
    );
  }
}

String _$_viewModelHash() => r'cbcbb990c427eb5dbb982f4b15d1e89af1f54b38';

abstract class _$ViewModel extends $Notifier<_UiState> {
  _UiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<_UiState, _UiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<_UiState, _UiState>,
              _UiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
