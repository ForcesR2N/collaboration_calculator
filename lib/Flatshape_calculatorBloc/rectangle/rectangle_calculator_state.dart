import 'package:equatable/equatable.dart';

abstract class RectangleCalculatorState extends Equatable {
  const RectangleCalculatorState();

  @override
  List<Object> get props => [];
}

class RectangleCalculatorInitial extends RectangleCalculatorState {}

class RectangleCalculatorLoading extends RectangleCalculatorState {}

class RectangleCalculatorResult extends RectangleCalculatorState {
  final double area;
  final double perimeter;

  const RectangleCalculatorResult(this.area, this.perimeter);

  @override
  List<Object> get props => [area, perimeter];
}
