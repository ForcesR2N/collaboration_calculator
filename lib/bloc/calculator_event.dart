import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class NumberPressed extends CalculatorEvent {
  final String number;
  const NumberPressed(this.number);

  @override
  List<Object> get props => [number];
}

class OperatorPressed extends CalculatorEvent {
  final String operator;
  const OperatorPressed(this.operator);

  @override
  List<Object> get props => [operator];
}

class ClearPressed extends CalculatorEvent {}

class CalculatePressed extends CalculatorEvent {}
