import 'package:flutter/material.dart';
import 'dart:math';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  int count = 0;
  double angle = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  int currentZekrIndex = 0;

  // 🔥 تحكم في مكان النص
  double textAlignY = -0.8;

  // 🔥 تحكم في مكان السبحة (ارفعها/انزلها)
  double tasbeehAlignY = 0.2;

  void increment() {
    setState(() {
      count++;
      angle += 0.2;

      if (count == 33) {
        count = 0;
        currentZekrIndex = (currentZekrIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ❌ لو عايز تلغي خلفية ثانوية من Flutter استخدم ده:
      backgroundColor: Colors.transparent,

      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          // 🔥 الخلفية (تقدر تحط صورة بدلها)
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E1E1E),
              Color(0xFF2C2C2C),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),


          image: DecorationImage(
            image: AssetImage("assets/images/sebha2.png"),
            fit: BoxFit.cover,
          ),

        ),

        child: SafeArea(
          child: Stack(
            children: [
              // ================= TEXT =================
              Align(
                alignment: Alignment(0, textAlignY),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Positioned(
                    top: 3,
                    child: Text(
                      "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 55,
                right: 15,
                child: GestureDetector(
                  onTap: increment,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedRotation(
                        turns: angle / (2 * pi),
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          "assets/images/ss.png",
                          width: 380,
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            azkar[currentZekrIndex],
                            style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "$count",
                            style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}