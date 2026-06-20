import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_new/my_theme.dart';
import 'package:islami_new/providers/settings_provider.dart';
import 'package:islami_new/screens/hadeth_content.dart';
import 'package:islami_new/screens/home_screen.dart';
import 'package:islami_new/screens/sura_content.dart';
import 'package:islami_new/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
    create: (context) => SettingsProvider()..init(),
    child: const MyApplication(),
  ));
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: provider.themeMode,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: provider.language,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraContent.routeName: (context) => const SuraContent(),
        HadethContent.routeName: (context) => const HadethContent(),
      },
    );
  }
}
