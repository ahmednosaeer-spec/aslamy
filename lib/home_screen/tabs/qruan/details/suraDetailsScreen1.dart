import 'package:aslimy/home_screen/tabs/qruan/details/widget/suraCon.dart';
import 'package:aslimy/modle/QuranResources.dart';
import 'package:aslimy/utlis/appAssets.dart';
import 'package:aslimy/utlis/appColors.dart';
import 'package:aslimy/utlis/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Suradetailsscreen1 extends StatefulWidget {
  Suradetailsscreen1({super.key});

  @override
  State<Suradetailsscreen1> createState() => _Suradetailsscreen1State();
}

class _Suradetailsscreen1State extends State<Suradetailsscreen1> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
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
      body: Container(
        alignment: Alignment.center,
        // width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Appassets.bk),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.013),
          child: Column(
            spacing: height * 0.04,
            children: [
              Text(
                Quranresources.arabicQuranSuraList[index],
                style: Appstyles.bold24Primry,
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primarColor,
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.only(top: height * 0.03),
                        itemBuilder: (context, index) {
                          return Suracon(
                            suraContent: verses[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.02);
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/qruan/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');

    verses = lines;
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
