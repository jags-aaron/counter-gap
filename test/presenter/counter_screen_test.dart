import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/presenter/bloc/counter_bloc.dart';
import 'package:untitled/presenter/bloc/counter_events.dart';
import 'package:untitled/presenter/bloc/counter_state.dart';
import 'package:untitled/presenter/counter_model.dart';
import 'package:untitled/presenter/counter_screen.dart';
import 'package:untitled/presenter/widgets/counter_appbar.dart';
import 'package:untitled/presenter/widgets/counter_widget.dart';

import '../utils/mock_app_wrapper.dart';

class MockCounterBloc extends MockBloc<CounterEvent, CounterState>
    implements CounterBloc {}

Future main() async {
  late MockCounterBloc mockSessionBloc;

  setUpAll(() => {
        mockSessionBloc = MockCounterBloc(),
      });

  testWidgets('Screen Renders initial State Correctly with counter 0',
      (WidgetTester tester) async {
    final router = goRouterTest(
      child: CounterScreen(
          model: CounterModel.build(
        title: 'Nice title',
        countNumber: '0',
        onDecrease: () {},
        onIncrease: () {},
      )),
      providers: [
        BlocProvider<CounterBloc>(
          create: (_) => mockSessionBloc,
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
  });
}
