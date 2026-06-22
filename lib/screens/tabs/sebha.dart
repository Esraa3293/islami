import 'package:flutter/material.dart';
import 'package:islami_new/providers/sebha_provider.dart';
import 'package:islami_new/screens/widgets/container_widget.dart';
import 'package:islami_new/screens/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => SebhaProvider(),
      builder: (context, child) {
        var provider = Provider.of<SebhaProvider>(context);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.1),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.light
                          ? "assets/images/head_of_seb7a.png"
                          : "assets/images/dark_head_of_seb7a.png",
                      width: width * 0.2,
                      height: height * 0.13,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Transform.rotate(
                      angle: provider.angle,
                      child: GestureDetector(
                        onTap: provider.onClicked,
                        child: Image.asset(
                          Theme.of(context).brightness == Brightness.light
                              ? "assets/images/body_of_seb7a.png"
                              : "assets/images/dark_body_of_seb7a.png",
                          width: width * 0.7,
                          height: height * 0.27,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "عدد التسبيحات",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ContainerWidget(
                  width: width * 0.15,
                  height: height * 0.1,
                  text: "${provider.counter}"),
              SizedBox(
                height: height * 0.03,
              ),
              ElevatedButtonWidget(
                  onClicked: provider.onClicked,
                  text: provider.azkar[provider.index]),
            ],
          ),
        );
      },
    );
  }
}
