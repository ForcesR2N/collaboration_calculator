import 'package:bloc/bloc.dart';
import 'square_calculator_event.dart';
import 'square_calculator_state.dart';

class SquareCalculatorBloc extends Bloc<SquareCalculatorEvent, SquareCalculatorState> {
  SquareCalculatorBloc() : super(SquareCalculatorInitial()) {
    on<CalculateSquareArea>((event, emit) async {
     
      emit(SquareCalculatorLoading());

      await Future.delayed(const Duration(milliseconds: 500));

      final double area = event.sideLength * event.sideLength;
      final double perimeter = 4 * event.sideLength;

      emit(SquareCalculatorResult(area, perimeter));
    });
  }
}
