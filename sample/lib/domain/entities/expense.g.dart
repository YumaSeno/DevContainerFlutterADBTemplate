// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  id: json['id'] as String,
  amount: Decimal.fromJson(json['amount'] as String),
  date: DateTime.parse(json['date'] as String),
  category: json['category'] as String,
  note: json['note'] as String?,
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'date': instance.date.toIso8601String(),
  'category': instance.category,
  'note': instance.note,
};
