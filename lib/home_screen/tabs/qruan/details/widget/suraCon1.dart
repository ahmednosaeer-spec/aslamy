import 'package:aslimy/utlis/appColors.dart';
import 'package:aslimy/utlis/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suracon1 extends StatelessWidget {
  final String suraContent;

  Suracon1({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        suraContent,
        textAlign: TextAlign.center,

        textDirection: TextDirection.rtl,
        style: Appstyles.bold20Primary,
      ),
    );
  }
}
