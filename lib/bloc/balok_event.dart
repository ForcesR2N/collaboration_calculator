import 'package:equatable/equatable.dart';

abstract class BalokEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HitungVolume extends BalokEvent {
  final double panjang;
  final double lebar;
  final double tinggi;

  HitungVolume(this.panjang, this.lebar, this.tinggi);

  @override
  List<Object> get props => [panjang, lebar, tinggi];
}
