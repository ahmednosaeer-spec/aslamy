import 'package:flutter/material.dart';
import 'home_screen/home_screen.dart';
import 'intro_model.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final Color primaryColor = const Color(0xFFE2BE7F);

  final List<IntroModel> introData = [
    IntroModel(
      image: 'assets/images/logo.png',
      text: 'Welcome To Islami App',
      extraText: '',
    ),
    IntroModel(
      image: 'assets/images/welcome.png',
      text: 'Welcome To Islami',
      extraText: 'We Are Very Excited To Have You In Our Community',
    ),
    IntroModel(
      image: 'assets/images/quran.png',
      text: 'Reading the Quran',
      extraText: 'Read, and your Lord is the Most Generous',
    ),
    IntroModel(
      image: 'assets/images/sebha.png',
      text: 'Bearish',
      extraText: 'Praise the name of your Lord, the Most High',
    ),
    IntroModel(
      image: 'assets/images/radio.png',
      text: 'Holy Quran Radio',
      extraText:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: Stack(
          children: [
            // اللوجو الثابت فوق كل الصفحات
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/logo1.png',
                  width: 291,
                  height: 171,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 200), // المسافة تحت اللوجو
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: introData.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = introData[index];
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // الصورة الكبيرة
                              Image.asset(
                                item.image,
                                width: 389,
                                height: 425,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 40),
                              // النصوص تحت الصورة
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: Text(
                                  item.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 35),
                              if (item.extraText.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    item.extraText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // منطقة التحكم: Back, Dots, Next
            Positioned(
              bottom: 0,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back button
                  if (currentIndex > 0)
                    TextButton(
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 60), // مساحة لتعويض مكان Back
                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      introData.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentIndex == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? primaryColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  // Next button
                  TextButton(
                    onPressed: () {
                      if (currentIndex == introData.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
