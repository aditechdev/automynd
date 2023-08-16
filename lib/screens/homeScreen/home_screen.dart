import 'package:automynd/component/homeScreenComponent/body_mass_index.dart';
import 'package:automynd/component/homeScreenComponent/buy_test_list.dart';
import 'package:automynd/component/homeScreenComponent/todays_target.dart';
import 'package:automynd/component/homeScreenComponent/workout_progress.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticatSpace(20),
              const BodyMassIndex(),
              verticatSpace(20),
              const TodayTarget(),
              verticatSpace(
                MediaQuery.of(context).size.width * 0.05,
              ),
              const WorkoutProgressComponent(),
              verticatSpace(
                media.width * 0.05,
              ),
              const BuyTestList(),
            ],
          ),
        ),
      ),
    );
  }
}
