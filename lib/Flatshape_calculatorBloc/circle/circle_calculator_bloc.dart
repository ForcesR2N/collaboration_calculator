import 'package:bloc/bloc.dart';
import 'circle_calculator_event.dart';
import 'circle_calculator_state.dart';
import 'dart:math';

class CircleCalculatorBloc extends Bloc<CircleCalculatorEvent, CircleCalculatorState> {
  CircleCalculatorBloc() : super(CircleCalculatorInitial()) {
    on<CalculateCircleArea>((event, emit) async {
     
      emit(CircleCalculatorLoading());

     
      await Future.delayed(const Duration(milliseconds: 500));

     
      final double area = pi * pow(event.radius, 2);
      final double circumference = 2 * pi * event.radius;

    
      emit(CircleCalculatorResult(area, circumference));
    });
  }
}
