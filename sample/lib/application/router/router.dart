import 'package:cariri/application/screens/v01_home/v01.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => const V01()),
    ],
  );
});
