import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String option;
  final VoidCallback onTab;

  const SettingsItem(
      {super.key,
      required this.title,
      required this.option,
      required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: onTab,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
