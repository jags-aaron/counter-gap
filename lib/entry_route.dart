import 'package:go_router/go_router.dart';
import 'package:untitled/navigation/home_router.dart';

final router = GoRouter(
  initialLocation: HomeRoute.routePath,
  routes: _appRoutes,
  debugLogDiagnostics: true,
);

get _appRoutes => [
  HomeRoute(),
  // TODO Other routes
];