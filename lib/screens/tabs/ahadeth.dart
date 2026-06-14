import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_new/models/hadeth_model.dart';
import 'package:islami_new/providers/ahadeth_provider.dart';
import 'package:islami_new/screens/hadeth_content.dart';
import 'package:islami_new/screens/widgets/table_content.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => AhadethProvider()..loadAhadeth(),
      builder: (context, child) {
        var provider = Provider.of<AhadethProvider>(context);

        return Column(
          children: [
            Image.asset(
              "assets/images/basmala.png",
              width: width * 0.6,
              height: height * 0.2,
            ),
            const Divider(),
            Text(
              "الأحاديث",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Divider(),
            provider.allAhadeth.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, HadethContent.routeName,
                                    arguments: provider.allAhadeth[index]);
                              },
                              child: TableContent(
                                  title: provider.allAhadeth[index].title),
                            ),
                        separatorBuilder: (context, index) => const Divider(
                              indent: 35,
                              endIndent: 35,
                              thickness: 1,
                            ),
                        itemCount: provider.allAhadeth.length),
                  )
          ],
        );
      },
    );
  }
}
