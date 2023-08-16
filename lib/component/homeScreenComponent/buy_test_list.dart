import 'package:automynd/const/resource.dart';
import 'package:flutter/material.dart';

class BuyTestList extends StatelessWidget {
  const BuyTestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(20, (index) {
        return ListTile(
          leading: Image.asset(R.ASSETS_IMAGE_ON_BOARDING_IMAGE_2_PNG),
          title: const Text("Lorem Ipsum"),
          subtitle: const Text("Lorem Ipsum Lorem Ipsum"),
          trailing: IconButton(
            onPressed: () {},
            icon: const Text("Book"),
          ),
        );
      }),
    );
  }
}
