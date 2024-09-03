import 'package:equatable/equatable.dart';

abstract class SquareCalculatorState extends Equatable {
  const SquareCalculatorState();

  @override
  List<Object> get props => [];
}

class SquareCalculatorInitial extends SquareCalculatorState {}

class SquareCalculatorLoading extends SquareCalculatorState {}

class SquareCalculatorResult extends SquareCalculatorState {
  final double area;
  final double perimeter;

  const SquareCalculatorResult(this.area, this.perimeter);

  @override
  List<Object> get props => [area, perimeter];
}
