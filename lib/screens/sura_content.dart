import 'package:flutter/material.dart';
import 'package:islami_new/models/sura_model.dart';
import 'package:islami_new/providers/sura_content_provider.dart';
import 'package:islami_new/screens/widgets/app_background.dart';
import 'package:islami_new/screens/widgets/content_text.dart';
import 'package:provider/provider.dart';

class SuraContent extends StatelessWidget {
  static const String routeName = "suraContent";

  const SuraContent({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => SuraContentProvider()
        ..loadFile(args.index)
        ..loadSuraAudio(args.index + 1),
      builder: (context, child) {
        var provider = Provider.of<SuraContentProvider>(context);
        return AppBackground(
          appBarTitle: args.title,
          titleColor: Theme.of(context).colorScheme.secondary,
          actions: [
            if (provider.isLoadingAudio)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (provider.errorMessage != null)
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.error,
              )
            else
              IconButton(
                onPressed: () {
                  provider.toggleAudio();
                },
                icon: Icon(provider.isPlayingAll
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled),
                color: Theme.of(context).colorScheme.primary,
              )
          ],
          body: provider.verses.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Card(
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => ContentText(
                                text: provider.verses[index],
                              ),
                          separatorBuilder: (context, index) => const Divider(
                                indent: 40,
                                endIndent: 40,
                              ),
                          itemCount: provider.verses.length),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
