import 'package:flutter/material.dart';
import 'package:islami_new/screens/widgets/container_widget.dart';
import 'package:islami_new/screens/widgets/elevated_button_widget.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر"
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                  angle: angle,
                  child: GestureDetector(
                    onTap: onClicked,
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
              width: width * 0.15, height: height * 0.1, text: "$counter"),
          SizedBox(
            height: height * 0.03,
          ),
          ElevatedButtonWidget(onClicked: onClicked, text: azkar[index]),
        ],
      ),
    );
  }

  void onClicked() {
    counter++;
    if (counter == 33) {
      counter = 0;
      index++;
      index %= azkar.length;
    }
    angle += 0.19;
    setState(() {});
  }
}
