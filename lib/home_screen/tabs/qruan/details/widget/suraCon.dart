import 'package:aslimy/utlis/appColors.dart';
import 'package:aslimy/utlis/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suracon extends StatefulWidget {
  final String suraContent;

  final int index;
  bool isSelected;

  Suracon({
    super.key,
    required this.suraContent,
    required this.index,
    this.isSelected = false,
  });

  @override
  State<Suracon> createState() => _SuraconState();
}

class _SuraconState extends State<Suracon> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        widget.isSelected = !widget.isSelected;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.04),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected
              ? AppColors.primarColor
              : AppColors.transparentColor,

          border: Border.all(color: AppColors.primarColor, width: 2),
        ),
        child: Text(
          '${widget.suraContent}[${widget.index + 1}]',
          textAlign: TextAlign.center,

          textDirection: TextDirection.rtl,
          style: widget.isSelected
              ? Appstyles.bold20Primary.copyWith(color: AppColors.blackColor)
              : Appstyles.bold20Primary,
        ),
      ),
    );
  }
}
