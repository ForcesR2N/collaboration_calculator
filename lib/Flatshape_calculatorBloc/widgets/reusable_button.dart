import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ReusableButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, 
          foregroundColor: Colors.teal.shade800, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), 
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          elevation: 4, 
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 34, 99, 84)
              ),
        ),
      ),
    );
  }
}
