import 'package:automynd/repository/auth_repository.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  onSettingOptionClick(String value) {
    if (value == "logout") {
      AuthRepository.instance.logOut();
    } else {
      Get.snackbar(
        "🚧 🚧 🚧 🚧 🚧",
        "Work in Progress",
      );
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // verticatSpace(20),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.grey, shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Icon(
                  Icons.person,
                  size: 55,
                  color: Colors.white,
                ),

                // child: Image.asset(name),
              ),
            ),
            verticatSpace(10),
            const Text(
              "Name",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "email",
              style: TextStyle(
                fontSize: 15,
                // color: Colors.black,
                // fontWeight: FontWeight.bold,
              ),
            ),
            verticatSpace(5),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  side: BorderSide.none,
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.black),
              onPressed: () {},
              child: const Text("Edit Profile"),
            ),

            const Divider(),

            Expanded(
              child: ListView.builder(
                  itemCount: _settingMenuList.length,
                  itemBuilder: (context, index) {
                    var data = _settingMenuList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          onSettingOptionClick(data["value"]);
                        },
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[100]),
                            child: Icon(
                              data["leftIcon"],
                              color: Colors.blue,
                            ),
                          ),
                          title: Text(data["title"]),
                          trailing: Icon(data["rightIcon"]),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> _settingMenuList = [
  {
    "leftIcon": Icons.settings,
    "rightIcon": Icons.arrow_forward_ios,
    "title": "Settings",
    "value": "setting"
  },
  {
    "leftIcon": Icons.ac_unit_sharp,
    "rightIcon": Icons.arrow_forward_ios,
    "title": "Terms and Condition",
    "value": "setting"
  },
  {
    "leftIcon": Icons.accessibility_outlined,
    "rightIcon": Icons.arrow_forward_ios,
    "title": "Privacy Policy",
    "value": "setting"
  },
  {
    "leftIcon": Icons.logout_outlined,
    "rightIcon": null,
    "title": "Logout",
    "value": "logout"
  },
];
