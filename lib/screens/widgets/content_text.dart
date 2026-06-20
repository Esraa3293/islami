import 'package:flutter/material.dart';

class ContentText extends StatelessWidget {
  final String text;

  const ContentText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            color: Theme.of(context).colorScheme.secondary,
            height: 1.5),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
