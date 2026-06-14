import 'package:flutter/material.dart';
import 'package:islami_new/l10n/app_localizations.dart';
import 'package:islami_new/screens/tabs/ahadeth.dart';
import 'package:islami_new/screens/tabs/quran.dart';
import 'package:islami_new/screens/tabs/radio.dart';
import 'package:islami_new/screens/tabs/sebha.dart';
import 'package:islami_new/screens/tabs/settings.dart';
import 'package:islami_new/screens/widgets/app_background.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    const SebhaTab(),
    const RadioTab(),
    const AhadethTab(),
    const SettingsTab(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      appBarTitle: AppLocalizations.of(context)!.islami,
      body: tabs[index],
      navigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) {
            index = value;
            setState(() {});
          },
          destinations: [
            NavigationDestination(
                icon: const ImageIcon(AssetImage("assets/images/quran.png")),
                label: AppLocalizations.of(context)!.quran),
            NavigationDestination(
                icon:
                    const ImageIcon(AssetImage("assets/images/sebha_icon.png")),
                label: AppLocalizations.of(context)!.sebha),
            NavigationDestination(
                icon:
                    const ImageIcon(AssetImage("assets/images/radio_icon.png")),
                label: AppLocalizations.of(context)!.radio),
            NavigationDestination(
                icon: const ImageIcon(AssetImage("assets/images/ahadeth.png")),
                label: AppLocalizations.of(context)!.ahadeth),
            NavigationDestination(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ]),
    );
  }
}
