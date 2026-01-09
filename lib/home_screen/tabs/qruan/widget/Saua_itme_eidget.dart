import 'package:aslimy/modle/QuranResources.dart';
import 'package:aslimy/utlis/appAssets.dart';
import 'package:aslimy/utlis/appstores.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utlis/appstyles.dart';

class SauaItmeWidget extends StatelessWidget {
  final int index;

  const SauaItmeWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      spacing: width * 0.06,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(Appassets.vector1),
            Text('${index + 1}', style: Appstyles.bold16White),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Quranresources.englishQuranSuraList[index],
              style: Appstyles.bold20white,
            ),
            Text(
              '${Quranresources.versesList[index]} Verses ',
              style: Appstyles.bold14white,
            ),
          ],
        ),
        Spacer(),
        Text(
          Quranresources.arabicQuranSuraList[index],
          style: Appstyles.bold20white,
        ),
      ],
    );
  }
}
