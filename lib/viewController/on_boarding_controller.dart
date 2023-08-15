import 'package:automynd/config/routes/route_path.dart';
import 'package:automynd/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  onPageChangeCallback(int activeCurrentPage) {
    currentPage.value = activeCurrentPage;
  }

  skipToLastPage() {
    if (currentPage.value == 2) {
      Get.offAndToNamed(RoutePath.welcomeScreen);
    } else {
      onPageChangeCallback(2);
      controller.jumpToPage(page: 2);
    }
  }

  animateToNextSlide() {
    if (currentPage.value == 2) {
      Get.offAndToNamed(RoutePath.welcomeScreen);
    } else {
      int nextPage = controller.currentPage + 1;
      controller.animateToPage(page: nextPage);
    }
  }

  final List<Map<String, dynamic>> onBoardingPage = [
    {
      "topImage": R.ASSETS_IMAGE_ON_BOARDING_IMAGE_ONE_PNG,
      "colors": Colors.red[200],
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
      "pageCount": "1/3",
      "title": "Lorem Ipsum ",
      "textColor": Colors.white
    },
    {
      "topImage": R.ASSETS_IMAGE_ON_BOARDING_IMAGE_2_PNG,
      "colors": Colors.yellow[300],
      "subtitle":
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      "pageCount": '2/3',
      "title": 'Lorem Ipsum',
      "textColor": Colors.black
    },
    {
      "topImage": R.ASSETS_IMAGE_ON_BOARDING_IMAGE_3_PNG,
      "colors": Colors.green[200],
      "subtitle":
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      "pageCount": '3/3',
      "title": 'Lorem Ipsum',
      "textColor": Colors.black
    }
  ];
}
