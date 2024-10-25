import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../presenter/bloc/counter_bloc.dart';
import '../presenter/counter_controller.dart';

class HomeRoute extends GoRoute {
  static const routePath = '/home';

  HomeRoute()
      : super(
    path: routePath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider(
        create: (context) => context.read<CounterBloc>(),
        child: const CounterController(),
      );
    },
    routes: <RouteBase>[
      // TODO Other child routes
    ],
  );
}