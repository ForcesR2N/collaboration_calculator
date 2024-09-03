import 'package:equatable/equatable.dart';

abstract class CircleCalculatorState extends Equatable {
  const CircleCalculatorState();

  @override
  List<Object> get props => [];
}

class CircleCalculatorInitial extends CircleCalculatorState {}

class CircleCalculatorLoading extends CircleCalculatorState {}

class CircleCalculatorResult extends CircleCalculatorState {
  final double area;
  final double circumference;

  const CircleCalculatorResult(this.area, this.circumference);

  @override
  List<Object> get props => [area, circumference];
}
