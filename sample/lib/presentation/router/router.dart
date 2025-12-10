import 'package:auto_route/auto_route.dart';
import 'package:cariri/presentation/overlay_shell.dart';
import 'package:cariri/presentation/screens/01_home_screen/home_screen.dart';
import 'package:cariri/presentation/screens/02_list_screen/list_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';
part 'router.gr.dart';

/// アプリケーションのルーターを提供するプロバイダー
@riverpod
Raw<AppRouter> appRouter(Ref ref) => AppRouter();

/// アプリケーションのルーター設定
@AutoRouterConfig(replaceInRouteName: 'Screen|Shell,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: OverlayRoute.page,
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ListRoute.page),
      ],
    ),
  ];
}
