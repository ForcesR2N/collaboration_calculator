import 'package:equatable/equatable.dart';

abstract class RectangleCalculatorEvent extends Equatable {
  const RectangleCalculatorEvent();

  @override
  List<Object> get props => [];
}

class CalculateRectangleArea extends RectangleCalculatorEvent {
  final double length;
  final double width;

  const CalculateRectangleArea({required this.length, required this.width});

  @override
  List<Object> get props => [length, width];
}
