import 'package:bloc/bloc.dart';
import 'rectangle_calculator_event.dart';
import 'rectangle_calculator_state.dart';

class RectangleCalculatorBloc extends Bloc<RectangleCalculatorEvent, RectangleCalculatorState> {
  RectangleCalculatorBloc() : super(RectangleCalculatorInitial()) {
    on<CalculateRectangleArea>((event, emit) async {
     
      emit(RectangleCalculatorLoading());

      await Future.delayed(const Duration(milliseconds: 500));

      final double area = event.length * event.width;
      final double perimeter = 2 * (event.length + event.width);

      emit(RectangleCalculatorResult(area, perimeter));
    });
  }
}
