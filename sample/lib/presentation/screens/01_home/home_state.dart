part of 'home.dart';

@freezed
sealed class _UiState with _$UiState {
  const factory _UiState({
    required String monthlyTotalLabel,
    required int expenseCount,
    required int localTapCount,
  }) = __UiState;

  // factory _UiState.fromJson(Map<String, dynamic> json) =>
  //     _$UiStateFromJson(json);
}
