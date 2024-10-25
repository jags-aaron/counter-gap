import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

BuildContext? testContext;

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    super.key,
  });

  /// The mock navigator used to mock navigation calls.
  final MockGoRouter goRouter;

  /// The child [Widget] to render.
  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedGoRouter(
        goRouter: goRouter,
        child: child,
      );
}

GoRouter goRouterTest({
  required Widget child,
  required List<SingleChildWidget> providers,
}) {
  return GoRouter(
    initialLocation: '/test',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/test',
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              ...providers,
            ],
            child: Builder(builder: (BuildContext context) {
              testContext = context;
              return child;
            }),
          );
        },
      ),
    ],
  );
}

Widget testApp({
  required GoRouter goRouter,
}) {
  return MaterialApp.router(
    routerConfig: goRouter,
  );
}

Future<void> wrapPumpAndSettle({
  required WidgetTester tester,
  required GoRouter goRouter,
}) async {
  await tester.pumpWidget(testApp(
    goRouter: goRouter,
  ));
  await tester.pumpAndSettle();
}
