import 'package:flutter_bloc/flutter_bloc.dart';
import 'balok_event.dart';
import 'balok_state.dart';
import '../models/balok.dart';

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
