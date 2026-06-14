import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double width;
  final double height;
  final String text;

  const ContainerWidget(
      {required this.width,
      required this.height,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).brightness == Brightness.light
              ? Theme.of(context).colorScheme.primary.withAlpha(57)
              : Theme.of(context).colorScheme.onSecondary.withAlpha(80)),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
