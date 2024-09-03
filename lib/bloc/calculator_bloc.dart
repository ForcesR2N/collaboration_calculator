import 'package:bloc/bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState('')) {
    on<NumberPressed>((event, emit) {
      emit(CalculatorState(state.display + event.number));
    });

    on<OperatorPressed>((event, emit) {
      emit(CalculatorState(state.display + ' ' + event.operator + ' '));
    });

    on<ClearPressed>((event, emit) {
      emit(const CalculatorState(''));
    });

    on<CalculatePressed>((event, emit) {
      try {
        final result = _calculate(state.display);
        emit(CalculatorState(result));
      } catch (_) {
        emit(const CalculatorState('Error'));
      }
    });
  }

  String _calculate(String expression) {
    try {
      final tokens = expression.split(' ');
      if (tokens.length < 3) return expression;

      final num1 = double.parse(tokens[0]); 
      final operator = tokens[1];
      final num2 = double.parse(tokens[2]);

      double result;
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num1 / num2;
          break;
        default:
          return expression;
      }
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }
}
