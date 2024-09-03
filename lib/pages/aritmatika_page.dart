import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator_bloc.dart';
import 'package:collaboration_calculator/bloc/calculator_event.dart';
import 'package:collaboration_calculator/bloc/calculator_state.dart';

class AritmatikaPage extends StatefulWidget {
  @override
  _AritmatikaPageState createState() => _AritmatikaPageState();
}

class _AritmatikaPageState extends State<AritmatikaPage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _selectedOperator = '+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KALKULATOR')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNumberController,
              decoration: InputDecoration(
                labelText: 'ANGKA PERTAMA',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _secondNumberController,
              decoration: InputDecoration(
                labelText: 'ANGKA KEDUA',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['+', '-', '*', '/'].map((operator) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedOperator = operator;
                    });
                  },
                  child: Text(
                    operator,
                    style: TextStyle(fontSize: 24),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final firstNumber = _firstNumberController.text;
                        final secondNumber = _secondNumberController.text;
                        if (firstNumber.isNotEmpty && secondNumber.isNotEmpty) {
                          final expression =
                              '$firstNumber $_selectedOperator $secondNumber';
                          context.read<CalculatorBloc>().add(NumberPressed(expression));
                          context.read<CalculatorBloc>().add(CalculatePressed());
                        }
                      },
                      child: Text('HITUNG', style: TextStyle(fontSize: 24)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hasil: ${state.display}',
                      style: TextStyle(fontSize: 32),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
