import 'package:collaboration_calculator/Flatshape_calculatorBloc/Flatshapecalculatorscreen/circle_calculator_screen.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/Flatshapecalculatorscreen/rectangle_calculator_screen.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/Flatshapecalculatorscreen/square_calculator.dart';
import 'package:collaboration_calculator/bloc/balok_bloc.dart';
import 'package:collaboration_calculator/bloc/calculator_bloc.dart';
import 'package:collaboration_calculator/bloc/counter_bloc.dart';
import 'package:collaboration_calculator/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/circle/circle_calculator_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/square/square_calculator_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/rectangle/rectangle_calculator_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SquareCalculatorBloc()),
        BlocProvider(create: (context) => RectangleCalculatorBloc()),
        BlocProvider(create: (context) => CircleCalculatorBloc()),
        BlocProvider(create: (context) => BalokBloc()),
        BlocProvider(create: (context) => CalculatorBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/square': (context) => const SquareCalculatorScreen(),
          '/rectangle': (context) => const RectangleCalculatorScreen(),
          '/circle': (context) => const CircleCalculatorScreen(),
        },
      ),
    );
  }
}
