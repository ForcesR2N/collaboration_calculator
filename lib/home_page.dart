import 'package:collaboration_calculator/pages/bmi_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Calculator"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BmiPage()),
                );
              },
              child: Text('Go to BMI Page'),
            ),
          ],
        ),
      ),
    );
  }
}
