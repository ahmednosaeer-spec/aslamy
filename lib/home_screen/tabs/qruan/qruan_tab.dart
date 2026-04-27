import 'package:aslimy/home_screen/tabs/qruan/widget/Saua_itme_eidget.dart';
import 'package:aslimy/modle/QuranResources.dart';
import 'package:aslimy/utlis/appAssets.dart';
import 'package:aslimy/utlis/appColors.dart';
import 'package:aslimy/utlis/app_routes.dart';
import 'package:aslimy/utlis/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QruanTab extends StatelessWidget {
  const QruanTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          TextField(
            cursorColor: AppColors.primarColor,
            style: Appstyles.bold16White,
            decoration: InputDecoration(
              enabledBorder: builtDecorationBordr(),
              focusedBorder: builtDecorationBordr(),
              prefix: Image.asset(Appassets.vector),
              hintText: 'Sura Name',
              hintStyle: Appstyles.bold16White,
            ),
          ),
          Text('Most Recently', style: Appstyles.bold16White),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primarColor,
                    ),
                    child: Row(
                      spacing: width * 0.04,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Text('Al-Anbiya', style: Appstyles.bold24black),
                            Text('الأنبياء', style: Appstyles.bold24black),
                            Text('112 Verses', style: Appstyles.bold14black),
                          ],
                        ),
                        Image.asset(Appassets.mostRecent),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: 10,
            ),
          ),
          Text('Suras List', style: Appstyles.bold16White),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailRouteName,
                      arguments: index,
                    );
                  },
                  child: SauaItmeWidget(index: index),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: Divider(
                    indent: width * 0.06,
                    endIndent: width * 0.06,
                    color: AppColors.whiteColor,
                    thickness: 2,
                  ),
                );
              },
              itemCount: Quranresources.versesList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder builtDecorationBordr() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primarColor, width: 2),
    );
  }
}
