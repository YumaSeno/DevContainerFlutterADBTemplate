import 'package:cariri/application/components/scaled_padding.dart';
import 'package:cariri/application/components/scaled_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cariri/application/providers/theme_provider.dart';
import 'package:cariri/application/components/counter_card.dart';
import 'package:cariri/application/components/expense_card.dart';
import 'package:cariri/infrastructure/providers.dart';
import 'package:decimal/decimal.dart';
import 'package:cariri/domain/entities/expense.dart';
import 'package:cariri/application/utils.dart';

part 'vm01.dart';

part 'v01_phone.dart';
part 'v01_tablet.dart';

part 'v01.freezed.dart';
part 'v01.g.dart';

class V01 extends StatelessWidget {
  const V01({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const _TabletBody();
        } else {
          return const _PhoneBody();
        }
      },
    );
  }
}
