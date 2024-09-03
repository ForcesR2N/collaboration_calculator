import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/square/square_calculator_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/square/square_calculator_state.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/square/square_calculator_event.dart';
import '../widgets/reusable_text_field.dart';

class SquareCalculatorScreen extends StatelessWidget {
  const SquareCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController sideController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Square Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReusableTextField(
                label: 'Enter Side Length',
                controller: sideController,
              ),
              const SizedBox(height: 20),
              BlocBuilder<SquareCalculatorBloc, SquareCalculatorState>(
                builder: (context, state) {
                  if (state is SquareCalculatorInitial) {
                    return Text(
                      'Please enter the side length to calculate.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade800,
                      ),
                    );
                  } else if (state is SquareCalculatorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SquareCalculatorResult) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Area: ${state.area.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                          ),
                        ),
                        Text(
                          'Perimeter: ${state.perimeter.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final double sideLength = double.parse(sideController.text);
                  context.read<SquareCalculatorBloc>().add(
                    CalculateSquareArea(sideLength),
                  );
                },
                child: const Text('Calculate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
