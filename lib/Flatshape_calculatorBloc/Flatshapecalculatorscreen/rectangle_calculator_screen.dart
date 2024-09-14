import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/rectangle/rectangle_calculator_bloc.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/rectangle/rectangle_calculator_state.dart';
import 'package:collaboration_calculator/Flatshape_calculatorBloc/rectangle/rectangle_calculator_event.dart';
import '../../components/reusable_text_field.dart';

class RectangleCalculatorScreen extends StatelessWidget {
  const RectangleCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController lengthController = TextEditingController();
    final TextEditingController widthController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rectangle Calculator'),
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
                label: 'Enter Length',
                controller: lengthController,
              ),
              const SizedBox(height: 20),
              ReusableTextField(
                label: 'Enter Width',
                controller: widthController,
              ),
              const SizedBox(height: 20),
              BlocBuilder<RectangleCalculatorBloc, RectangleCalculatorState>(
                builder: (context, state) {
                  if (state is RectangleCalculatorInitial) {
                    return Text(
                      'Please enter both dimensions to calculate.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade800,
                      ),
                    );
                  } else if (state is RectangleCalculatorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RectangleCalculatorResult) {
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
                  final double length = double.parse(lengthController.text);
                  final double width = double.parse(widthController.text);
                  context.read<RectangleCalculatorBloc>().add(
                    CalculateRectangleArea(length: length, width: width),
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
