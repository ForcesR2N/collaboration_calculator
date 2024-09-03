import 'package:equatable/equatable.dart';

abstract class SquareCalculatorEvent extends Equatable {
  const SquareCalculatorEvent();

  @override
  List<Object> get props => [];
}

class CalculateSquareArea extends SquareCalculatorEvent {
  final double sideLength;

  const CalculateSquareArea(this.sideLength);

  @override
  List<Object> get props => [sideLength];
}
