import 'package:aslimy/modle/hadeeth.dart';
import 'package:aslimy/modle/hadeth_details.dart';
import 'package:aslimy/utlis/appAssets.dart';
import 'package:aslimy/utlis/appColors.dart';
import 'package:aslimy/utlis/app_routes.dart';
import 'package:aslimy/utlis/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadethItem extends StatefulWidget {
  final int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Appassets.bac)),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primarColor,
      ),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(color: AppColors.blackColor),
            )
          : InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.hadethDetailRouteName,
                  arguments: HadethDetails(
                    hadeth: hadeth!,
                    index: widget.index,
                  ),
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.02,
                    ),
                    child: Row(
                      children: [
                        Image.asset(Appassets.clift, width: width * 0.16),
                        Expanded(
                          child: Text(
                            hadeth?.title ?? "",
                            textAlign: TextAlign.center,
                            style: Appstyles.bold24black,
                          ),
                        ),
                        Image.asset(Appassets.cright, width: width * 0.16),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth?.content ?? '',
                        textAlign: TextAlign.center,
                        style: Appstyles.bold16White.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    Appassets.mos1,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
    );
  }

  void loadHadethFile(int index) async {
    String fileCon = await rootBundle.loadString(
      'assets/files/Hadeeth/h$index.txt',
    );
    int fileIndex = fileCon.indexOf('\n');
    String title = fileCon.substring(0, fileIndex);
    String content = fileCon.substring(fileIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
