import 'package:flutter/material.dart';
import 'package:islami_new/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "Light",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                if (provider.themeMode == ThemeMode.light)
                  const Icon(Icons.done)
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "Dark",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                if (provider.themeMode == ThemeMode.dark)
                  const Icon(Icons.done),
              ],
            ),
          )
        ],
      ),
    );
  }
}
