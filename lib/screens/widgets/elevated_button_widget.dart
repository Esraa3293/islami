import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final String text;

  const ElevatedButtonWidget(
      {super.key, required this.onClicked, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black),
      ),
    );
  }
}
