import 'package:flutter/material.dart';
import 'package:islami_new/providers/settings_provider.dart';
import 'package:islami_new/screens/widgets/language_bottom_sheet.dart';
import 'package:islami_new/screens/widgets/settings_item.dart';
import 'package:islami_new/screens/widgets/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        SettingsItem(
          title: "Theming",
          option: provider.themeMode == ThemeMode.light ? "Light" : "Dark",
          onTab: () {
            showThemeBottomSheet();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        SettingsItem(
          title: "Language",
          option: "English",
          onTab: () {
            showLanguageBottomSheet();
          },
        )
      ],
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ThemeBottomSheet();
      },
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const LanguageBottomSheet();
      },
    );
  }
}
