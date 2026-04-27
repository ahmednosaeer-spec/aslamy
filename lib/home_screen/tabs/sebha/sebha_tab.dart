import 'package:aslimy/home_screen/tabs/sebha/widget/hadeth_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';


class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return CarouselSlider(
      options: CarouselOptions(height: height * 0.66,
        enlargeCenterPage: true,),

      items: List.generate(50, (int index) => index + 1,)
          .map((index) {
        return HadethItem(index: index,);
      }).toList(),
    );
  }
}

