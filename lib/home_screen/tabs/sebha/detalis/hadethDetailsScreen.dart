import 'package:aslimy/home_screen/tabs/qruan/details/widget/suraCon1.dart';
import 'package:aslimy/modle/QuranResources.dart';
import 'package:aslimy/modle/hadeth_details.dart';
import 'package:aslimy/utlis/appAssets.dart';
import 'package:aslimy/utlis/appColors.dart';
import 'package:aslimy/utlis/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../qruan/details/widget/suraCon.dart';

class Hadethdetailsscreen extends StatefulWidget {
  const Hadethdetailsscreen({super.key});

  @override
  State<Hadethdetailsscreen> createState() => _SuradetailsscreenState();
}

class _SuradetailsscreenState extends State<Hadethdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    HadethDetails args =
        ModalRoute.of(context)?.settings.arguments as HadethDetails;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text('Hadith${args.index}', style: Appstyles.bold20Primary),
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
                    Text(args.hadeth.title, style: Appstyles.bold24Primry),
                    Image.asset(Appassets.righ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Suracon1(suraContent: args.hadeth.content),
                ),
              ),
              Image.asset(Appassets.mo),
            ],
          ),
        ],
      ),
    );
  }
}
