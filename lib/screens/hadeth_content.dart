import 'package:flutter/material.dart';
import 'package:islami_new/models/hadeth_model.dart';
import 'package:islami_new/screens/widgets/app_background.dart';
import 'package:islami_new/screens/widgets/content_text.dart';

class HadethContent extends StatelessWidget {
  static const String routeName = "hadethContent";

  const HadethContent({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return AppBackground(
      appBarTitle: args.title,
      titleColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Card(
          child: SingleChildScrollView(
            child: ContentText(text: args.content),
          ),
        ),
      ),
    );
  }
}
