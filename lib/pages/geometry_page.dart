import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/balok_bloc.dart';
import '../bloc/balok_event.dart';
import '../bloc/balok_state.dart';

<<<<<<< HEAD
class GeometryPage extends StatelessWidget {
=======
class BalokPage extends StatelessWidget {
>>>>>>> c9b57f40ed7f1f6a8d9c3567b9ba3efc6b639643
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Volume Balok'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: panjangController,
              decoration: InputDecoration(labelText: 'Panjang'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: lebarController,
              decoration: InputDecoration(labelText: 'Lebar'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tinggiController,
              decoration: InputDecoration(labelText: 'Tinggi'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final panjang = double.tryParse(panjangController.text);
                final lebar = double.tryParse(lebarController.text);
                final tinggi = double.tryParse(tinggiController.text);

                if (panjang != null && lebar != null && tinggi != null && panjang > 0 && lebar > 0 && tinggi > 0) {
                  context.read<BalokBloc>().add(HitungVolume(panjang, lebar, tinggi));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Masukkan nilai yang valid!'),
                  ));
                }
              },
              child: Text('Hitung Volume'),
            ),
            SizedBox(height: 20),
            BlocBuilder<BalokBloc, BalokState>(
              builder: (context, state) {
                if (state is BalokVolumeCalculated) {
                  return Text('Volume Balok: ${state.volume}');
                } else {
                  return Text('Masukkan nilai untuk menghitung volume.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
