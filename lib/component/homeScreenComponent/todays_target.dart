import 'package:automynd/component/commonComponent/round_button.dart';
import 'package:flutter/material.dart';

class TodayTarget extends StatelessWidget {
  const TodayTarget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xff9DCEFF).withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Today Target",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: 70,
            height: 25,
            child: RoundButton(
              title: "Check",
              type: RoundButtonType.bgGradient,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
