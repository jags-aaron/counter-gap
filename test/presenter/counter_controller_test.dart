import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/data/memory_source.dart';
import 'package:untitled/presenter/bloc/counter_bloc.dart';
import 'package:untitled/presenter/counter_controller.dart';
import 'package:untitled/presenter/widgets/counter_appbar.dart';
import 'package:untitled/presenter/widgets/counter_widget.dart';
import 'package:untitled/repository/counter_repository.dart';

import '../utils/mock_app_wrapper.dart';

void main() {

  testWidgets('Screen Renders show counter 2', (WidgetTester tester) async {
    final router = goRouterTest(
      child: const CounterController(),
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(
            repository: CounterRepositoryImpl(
              memorySource: MemorySourceImpl(),
            ),
          ),
        ),
      ],
    );

    await wrapPumpAndSettle(
      tester: tester,
      goRouter: router,
    );

    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
    expect(find.byType(CounterAppbar), findsOneWidget);
    expect(find.byType(CounterWidget), findsOneWidget);

    const incrementText = 'Increment';
    await tester.ensureVisible(find.text(incrementText));
    await tester.tap(find.text(incrementText));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    await tester.ensureVisible(find.text(incrementText));
    await tester.tap(find.text(incrementText));
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);
  });

}
