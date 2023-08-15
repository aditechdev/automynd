import 'package:automynd/utils/empty_box_utils.dart';
import 'package:automynd/viewController/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            onPageChangeCallback: controller.onPageChangeCallback,
            liquidController: controller.controller,
            slideIconWidget: const Icon(Icons.arrow_back),
            enableSideReveal: true,
            pages: List.generate(
              controller.onBoardingPage.length,
              (index) {
                final pageData = controller.onBoardingPage[index];

                return OnBoardingPageComponent(
                  topImage: pageData["topImage"],
                  colors: pageData["colors"],
                  subtitle: pageData["subtitle"],
                  title: pageData["title"],
                  textColor: pageData["textColor"],
                );
              },
            ),
          ),
          Positioned(
            bottom: 70,
            child: ForwardButtonComponent(
              onPressed: () => controller.animateToNextSlide(),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
                onPressed: () => controller.skipToLastPage(),
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ),
          Obx(() => Positioned(
              bottom: 45,
              child: AnimatedSmoothIndicator(
                  effect: const WormEffect(
                    activeDotColor: Colors.black,
                    dotHeight: 5,
                  ),
                  activeIndex: controller.currentPage.value,
                  count: 3))),
        ],
      ),
    );
  }
}

class ForwardButtonComponent extends StatelessWidget {
  final void Function()? onPressed;
  const ForwardButtonComponent({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          side: const BorderSide(color: Colors.white)),
      child: Container(
        // color: Colors.yellow,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xff272727)),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class OnBoardingPageComponent extends StatelessWidget {
  final Color colors;
  final String topImage;
  final String title;
  final String subtitle;
  final Color textColor;

  const OnBoardingPageComponent(
      {super.key,
      required this.colors,
      required this.topImage,
      required this.title,
      required this.subtitle,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: colors,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            topImage,
            height: size.height * 0.4,
          ),
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              verticatSpace(10),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          // Text(pageCount),
          verticatSpace(20)
        ],
      ),
    );
  }
}
