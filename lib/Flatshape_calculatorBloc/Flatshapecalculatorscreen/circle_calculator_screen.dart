import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/circle/circle_calculator_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/circle/circle_calculator_state.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/circle/circle_calculator_event.dart';
import '../../components/reusable_text_field.dart';

class CircleCalculatorScreen extends StatelessWidget {
  const CircleCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Calculator'),
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
                label: 'Enter Radius',
                controller: radiusController,
              ),
              const SizedBox(height: 20),
              BlocBuilder<CircleCalculatorBloc, CircleCalculatorState>(
                builder: (context, state) {
                  if (state is CircleCalculatorInitial) {
                    return Text(
                      'Please enter the radius to calculate.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade800,
                      ),
                    );
                  } else if (state is CircleCalculatorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CircleCalculatorResult) {
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
                          'Circumference: ${state.circumference.toStringAsFixed(2)}',
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
                  final double radius = double.parse(radiusController.text);
                  context.read<CircleCalculatorBloc>().add(
                    CalculateCircleArea(radius: radius),
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
