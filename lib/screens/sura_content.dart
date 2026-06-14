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
            // FutureBuilder(
            //   future: suraAudioFuture,
            //   // --- 3. استخدام المتغير الثابت لحل مشكلة علامة التحميل ---
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //     if (snapshot.hasError || snapshot.data == null) {
            //       return const Icon(Icons.error_outline, color: Colors.red);
            //     }
            //
            //     //حفظ قائمة الآيات من الـ API بمجرد اكتمال الـ Future بنجاح
            //     var responseData = snapshot.data!.data?.ayahs;
            //     if (responseData != null && apiAyahs.isEmpty) {
            //       apiAyahs = responseData;
            //     }
            //     return IconButton(
            //         onPressed: () async {
            //           if (isPlayingAll) {
            //             // إذا كان يشتغل واضغطنا مجدداً، نقوم بعمل إيقاف مؤقت
            //             await audioPlayer.pause();
            //             isPlayingAll = false;
            //             setState(() {});
            //           } else {
            //             // بدء التشغيل المتتالي من أول آية أو من الآية المتوقفة عندها
            //             playCurrentAyah();
            //           }
            //         },
            //         icon: Icon(
            //           isPlayingAll
            //               ? Icons.pause_circle_filled
            //               : Icons.play_circle_filled,
            //           color: Theme.of(context).colorScheme.primary,
            //         ));
            //   },
            // )
          ],
          body: provider.verses.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Card(
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) =>
                              ContentText(text: provider.verses[index]),
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
