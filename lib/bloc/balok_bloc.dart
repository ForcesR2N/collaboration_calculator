import 'package:flutter_bloc/flutter_bloc.dart';
import 'balok_event.dart';
import 'balok_state.dart';

class Balok {
  final double panjang;
  final double lebar;
  final double tinggi;

  Balok({
    required this.panjang,
    required this.lebar,
    required this.tinggi,
  });

  double volume() => panjang * lebar * tinggi;
}

class BalokBloc extends Bloc<BalokEvent, BalokState> {
  BalokBloc() : super(BalokInitial()) {
    on<HitungVolume>((event, emit) {
      final balok = Balok(
        panjang: event.panjang,
        lebar: event.lebar,
        tinggi: event.tinggi,
      );
      emit(BalokVolumeCalculated(balok.volume()));
    });
  }
}
