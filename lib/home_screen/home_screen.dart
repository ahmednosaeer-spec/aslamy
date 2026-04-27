import 'package:aslimy/home_screen/tabs/hadeth/hadeth_tab.dart';
import 'package:aslimy/home_screen/tabs/qruan/qruan_tab.dart';
import 'package:aslimy/home_screen/tabs/radio/radio_tab.dart';
import 'package:aslimy/home_screen/tabs/sebha/sebha_tab.dart';
import 'package:aslimy/home_screen/tabs/time/time_tab.dart';
import 'package:aslimy/utlis/appAssets.dart';
import 'package:aslimy/utlis/appColors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget>tabsList = [
    QruanTab(), SebhaTab(), HadethTab(), RadioTab(), TimeTab()
  ];
  List<String> backgroundImages = [
    Appassets.quranBg,
    Appassets.hadethBg,
    Appassets.sebhaBg,
    Appassets.radioBg,
    Appassets.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,),
        SafeArea(
          child: Scaffold(
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: AppColors.primarColor
              ),
              child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {

                    });
                  },
                  backgroundColor: AppColors.primarColor,
                  items: [
                    buliltBottomNavBar(iconName: Appassets.iconquran,
                        label: 'Quran',
                        index: 0),
                    buliltBottomNavBar(iconName: Appassets.iconhadeth,
                        label: 'Hadeth',
                        index: 1),
                    buliltBottomNavBar(iconName: Appassets.iconsebha,
                        label: 'Sebha',
                        index: 2),
                    buliltBottomNavBar(iconName: Appassets.iconradio,
                        label: 'Radio',
                        index: 3),
                    buliltBottomNavBar(
                        iconName: Appassets.icontime, label: 'Time', index: 4),

                  ]
              ),
            ),
            body: Column(
              spacing: height * 0.01,
              children: [
                Image.asset(Appassets.logo),
                Expanded(child: tabsList[selectedIndex]),
              ],
            ),
          ),
        )
      ],

    );
  }

  BottomNavigationBarItem buliltBottomNavBar({required String iconName,
    required String label, required int index}) {
    return BottomNavigationBarItem(
        icon: selectedIndex == index ?
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor)

            , child: ImageIcon(AssetImage(iconName))) : ImageIcon(
            AssetImage(iconName)),
        label: label);
  }
}
