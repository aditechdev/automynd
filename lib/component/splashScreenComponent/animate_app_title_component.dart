import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedAppNameComponent extends StatelessWidget {
  const AnimatedAppNameComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const colorizeColors1 = [
      Colors.black,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];
    const colorizeColors2 = [
      Color(0xff46a6c0),
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 20.0,
      fontFamily: 'Schyler',
    );
    int totalRepatation = 100;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextComponent(
          colors: colorizeColors1,
          text: "Auto",
          textStyle: colorizeTextStyle,
          totalRepeatCount: totalRepatation,
        ),
        AnimatedTextComponent(
          colors: colorizeColors2,
          text: "Mynd",
          textStyle: colorizeTextStyle,
          totalRepeatCount: totalRepatation,
        ),
      ],
    );
  }
}

class AnimatedTextComponent extends StatelessWidget {
  final TextStyle textStyle;
  final List<Color> colors;
  final int totalRepeatCount;
  final String text;

  const AnimatedTextComponent(
      {super.key,
      required this.textStyle,
      required this.colors,
      required this.totalRepeatCount,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          text,
          textStyle: textStyle,
          colors: colors,
        ),
      ],
      totalRepeatCount: totalRepeatCount,
      pause: const Duration(milliseconds: 1000),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
