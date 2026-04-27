import 'package:flutter/material.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  final PageController _controller =
  PageController(viewportFraction: 0.38);

  double currentPage = 0;

  final List<Prayer> prayers = [
    Prayer("Fajr", "04:10 AM"),
    Prayer("Dhuhr", "01:01 PM"),
    Prayer("ASR", "04:38 PM"),
    Prayer("Maghrib", "07:57 PM"),
    Prayer("Isha", "09:15 PM"),
  ];

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // 🔥 الخلفية
          Positioned.fill(
            child: Image.asset(
              "assets/images/time2.png",
              fit: BoxFit.cover,
            ),
          ),

          // 🔥 overlay خفيف
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        const SizedBox(height: 15),

                        // 🔥 الكارت الرئيسي (أطول)
                        Container(
                          height: 280, // 🔥 أطول
                          decoration: BoxDecoration(
                            color: const Color(0xFFE2BE7F).withOpacity(0.85),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFFE2BE7F),
                              width: 1.5,
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "16 Jul, 2024",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "09 Muh, 1446",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),

                              const Text(
                                "Pray Time\nTuesday",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),

                              // 🔥 الكاروسيل
                              SizedBox(
                                height: 130, // مناسب بدون overflow
                                child: PageView.builder(
                                  controller: _controller,
                                  itemCount: prayers.length,
                                  itemBuilder: (context, index) {
                                    double diff =
                                    (currentPage - index).abs();

                                    double scale =
                                        1 - (diff * 0.25).clamp(0.0, 0.25);

                                    return Transform.scale(
                                      scale: scale,
                                      child: PrayerItem(
                                        prayers[index].name,
                                        prayers[index].time,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const Text(
                                "Next Pray - 02:32",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Azkar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: const [
                            Expanded(
                              child: AzkarCard(
                                title: "Evening Azkar",
                                image: "assets/images/moon.png",
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: AzkarCard(
                                title: "Morning Azkar",
                                image: "assets/images/masg.png",
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 🔥 Model
class Prayer {
  final String name;
  final String time;

  Prayer(this.name, this.time);
}

// 🔥 Prayer Item (طويل + border + خط كبير)
class PrayerItem extends StatelessWidget {
  final String name;
  final String time;

  const PrayerItem(this.name, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 85,
      height: 125,
      // 🔥 أطول مش أعرض
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2BE7F),
          width: 1.5,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.black.withOpacity(0.25),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            name,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            time.split(" ")[0],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            time.split(" ")[1],
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// 🔶 Azkar Card
class AzkarCard extends StatelessWidget {
  final String title;
  final String image;

  const AzkarCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff202020).withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2BE7F),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}