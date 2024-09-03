import 'package:equatable/equatable.dart';

class CalculatorState extends Equatable {
  final String display;
  const CalculatorState(this.display);

  @override
  List<Object> get props => [display];
}
