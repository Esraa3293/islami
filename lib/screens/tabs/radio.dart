import 'package:flutter/material.dart';
import 'package:islami_new/providers/radio_provider.dart';
import 'package:islami_new/screens/widgets/radio_item.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => RadioProvider()..fetchRadios(),
      builder: (context, child) {
        var provider = Provider.of<RadioProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/radio.png",
                width: width * 0.2,
                height: height * 0.2,
              ),
            ),
            Expanded(
                flex: 1,
                child: provider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : (provider.errorMessage != null || provider.radios.isEmpty)
                        ? Icon(
                            Icons.error_outline,
                            color: Theme.of(context).colorScheme.error,
                          )
                        : PageView.builder(
                            itemBuilder: (context, index) => RadioItem(
                                radio: provider.radios[index],
                                audioPlayer: provider.audioPlayer),
                            itemCount: provider.radios.length,
                          )),
          ],
        );
      },
    );
  }
}
