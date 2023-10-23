import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, size: 40, color: Colors.redAccent),
        const SizedBox(height: 20),
        Text(
          message,
          style: themeData.textTheme.displayLarge?.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
