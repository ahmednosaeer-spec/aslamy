import 'package:aslimy/home_screen/tabs/qruan/details/widget/suraCon1.dart';
import 'package:aslimy/modle/QuranResources.dart';
import 'package:aslimy/utlis/appAssets.dart';
import 'package:aslimy/utlis/appColors.dart';
import 'package:aslimy/utlis/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Suradetailsscreen extends StatefulWidget {
  const Suradetailsscreen({super.key});

  @override
  State<Suradetailsscreen> createState() => _SuradetailsscreenState();
}

class _SuradetailsscreenState extends State<Suradetailsscreen> {
  String Suracon = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (Suracon.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          Quranresources.englishQuranSuraList[index],
          style: Appstyles.bold20Primary,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Appassets.lift),
                    Text(
                      Quranresources.arabicQuranSuraList[index],
                      style: Appstyles.bold24Primry,
                    ),
                    Image.asset(Appassets.righ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Suracon1(suraContent: Suracon),
                ),
              ),
              Image.asset(Appassets.mo),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/qruan/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }
    Suracon = lines.join();
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
