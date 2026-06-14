import 'package:flutter/material.dart';

class TableTitle extends StatelessWidget {
  final String title;

  const TableTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
