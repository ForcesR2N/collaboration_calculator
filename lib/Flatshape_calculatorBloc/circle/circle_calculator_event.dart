import 'package:equatable/equatable.dart';

abstract class CircleCalculatorEvent extends Equatable {
  const CircleCalculatorEvent();

  @override
  List<Object> get props => [];
}

class CalculateCircleArea extends CircleCalculatorEvent {
  final double radius;

  const CalculateCircleArea({required this.radius});

  @override
  List<Object> get props => [radius];
}
