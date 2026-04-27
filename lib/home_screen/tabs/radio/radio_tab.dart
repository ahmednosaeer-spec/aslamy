import 'package:flutter/material.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedTab = 0;

  List<String> radios = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokali Mohammad Alalim",
  ];

  // 🔥 صور لكل كارت
  List<String> images = [
    "assets/images/vvv.png",
    "assets/images/vvv.png",
    "assets/images/mosko.png",
    "assets/images/vvv.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔥 Tabs
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: const Color(0xFF202020),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _buildTab("Radio", 0),
              _buildTab("Reciters", 1),
            ],
          ),
        ),

        const SizedBox(height: 5),

        // 🔥 List
        Expanded(
          child: ListView.builder(
            itemCount: radios.length,
            itemBuilder: (context, index) {
              return _buildRadioCard(radios[index], index);
            },
          ),
        ),
      ],
    );
  }

  // 🔥 Tabs
  Widget _buildTab(String text, int index) {
    bool isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFE2BE7F) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔥 الكارت بعد التعديل
  Widget _buildRadioCard(String title, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFE2BE7F),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          // 🔥 الصورة في أسفل الكارت
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
              child: Image.asset(
                images[index],
                height: 70, // 👈 نص الكارت
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔥 المحتوى فوق
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.play_arrow, size: 40),
                    const SizedBox(width: 25),
                    Icon(
                      index == 1 ? Icons.pause : Icons.volume_up,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}