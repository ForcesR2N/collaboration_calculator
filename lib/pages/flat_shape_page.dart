import 'package:flutter/material.dart';
import '../components/reusable_button.dart';

class FlatShapePage extends StatefulWidget {
  const FlatShapePage({super.key});

  @override
  State<FlatShapePage> createState() => _FlatShapeHomeState();
}

class _FlatShapeHomeState extends State<FlatShapePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flat Shape Calculator'),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Select Calculator:',
                        style: TextStyle(
                          fontSize: 24, 
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade800, 
                        ),
                      ),
                      const SizedBox(height: 20),
                      ReusableButton(
                        label: 'Square Calculator',
                        onPressed: () {
                          Navigator.pushNamed(context, '/square');
                        },
                      ),
                      const SizedBox(height: 20),
                      ReusableButton(
                        label: 'Rectangle Calculator',
                        onPressed: () {
                          Navigator.pushNamed(context, '/rectangle');
                        },
                      ),
                      const SizedBox(height: 20),
                      ReusableButton(
                        label: 'Circle Calculator',
                        onPressed: () {
                          Navigator.pushNamed(context, '/circle');
                        },
                      ),
                      const SizedBox(height: 20),
                      ReusableButton(
                        label: 'Back to Home',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
