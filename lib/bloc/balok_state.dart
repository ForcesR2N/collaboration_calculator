import 'package:equatable/equatable.dart';

abstract class BalokState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BalokInitial extends BalokState {}

class BalokVolumeCalculated extends BalokState {
  final double volume;

  BalokVolumeCalculated(this.volume);

  @override
  List<Object?> get props => [volume];
}
