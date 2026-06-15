import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final List<Widget>? actions;
  final Widget? navigationBar;
  final Color? titleColor;

  const AppBackground(
      {required this.body,
      required this.appBarTitle,
      this.actions,
      this.navigationBar,
      this.titleColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? "assets/images/main_bg.png"
              : "assets/images/dark_main_bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              appBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: titleColor),
            ),
            actions: actions,
          ),
          body: body,
          bottomNavigationBar: navigationBar,
        )
      ],
    );
  }
}
