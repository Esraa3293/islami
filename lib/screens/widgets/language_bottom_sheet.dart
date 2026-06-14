import 'package:flutter/material.dart';
import 'package:islami_new/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

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
              provider.changeLanguage(const Locale("en"));
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "English",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                if (provider.language == const Locale("en"))
                  const Icon(Icons.done)
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage(const Locale("ar"));
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "Arabic",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                if (provider.language == const Locale("ar"))
                  const Icon(Icons.done),
              ],
            ),
          )
        ],
      ),
    );
  }
}
