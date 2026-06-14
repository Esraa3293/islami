import 'package:flutter/material.dart';

class TableContent extends StatelessWidget {
  final String title;

  const TableContent({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
