import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/controller/bottom_controller.dart';
import 'package:valorant_game_guide/view/2.map/mode_screen.dart';
import 'package:valorant_game_guide/view/utils/color.dart';
import 'package:valorant_game_guide/view/utils/text.dart';

import '1.agent/agent_screen.dart';
import '2.map/map_screen.dart';
import '3.weapon/weapon_screen.dart';
import '4.rank/rank_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List menu = [
    Image.asset(
      'assets/image/agent_icon.png',
      height: Get.height * 0.025,
      width: Get.height * 0.025,
    ),
    Icon(
      Icons.map,
      size: Get.height * 0.025,
      color: AppColor.white,
    ),
    Image.asset(
      'assets/image/weapons_icon.png',
      height: Get.height * 0.025,
      width: Get.height * 0.025,
    ),
    Icon(
      Icons.emoji_events_outlined,
      size: Get.height * 0.025,
      color: AppColor.white,
    )
  ];

  List menuName = ['Agent', 'Map', 'Weapon', 'Rank'];

  List screens = [
    AgentScreen(),
    MapScreen(),
    WeaponScreen(),
    RankScreen(),
  ];
  BottomController bottomController = Get.put(BottomController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColor.backDrop,
        child: Column(
          children: [
            Container(
              height: height * 0.22,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColor.backDrop,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/Frame 826.png',
                      height: height * 0.1,
                      width: height * 0.1,
                    ),
                    SizedBox(width: height * 0.03),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Ts(
                          color: AppColor.white,
                          weight: FontWeight.normal,
                          size: height * 0.018,
                          text: 'Welcome',
                        ),
                        SizedBox(height: height * 0.005),
                        Ts(
                          color: AppColor.white,
                          weight: FontWeight.bold,
                          size: height * 0.018,
                          text: 'Players',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            commonListTile(() {
              Get.to(() => ModeScreen());
            }, Icons.star, 'MODS'),
            Divider(
                thickness: 1, indent: height * 0.01, endIndent: height * 0.01),
            commonListTile(() {
              Fluttertoast.showToast(
                  msg: "coming soon",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColor.peach,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }, Icons.star, 'Rate Us'),
            Divider(
                thickness: 1, indent: height * 0.01, endIndent: height * 0.01),
            commonListTile(() {
              Fluttertoast.showToast(
                  msg: "coming soon",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColor.peach,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }, Icons.rate_review, 'Review Us'),
            Divider(
                thickness: 1, indent: height * 0.01, endIndent: height * 0.01),
            commonListTile(() {
              Fluttertoast.showToast(
                  msg: "coming soon",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColor.peach,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }, Icons.privacy_tip, 'Privacy Policy'),
            Divider(
                thickness: 1, indent: height * 0.01, endIndent: height * 0.01),
            SizedBox(height: height * 0.01),
            Ts(
              color: AppColor.white,
              weight: FontWeight.normal,
              size: height * 0.015,
              text: 'App Version 1.0.4',
            ),
            SizedBox(height: height * 0.01),
            Divider(
                thickness: 1, indent: height * 0.01, endIndent: height * 0.01),
          ],
        ),
      ),
      backgroundColor: AppColor.backDrop,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backDrop,
        centerTitle: true,
        title: Obx(
          () => Ts(
            text: bottomController.selectMenu.value == 0
                ? 'AGENTS'
                : bottomController.selectMenu.value == 1
                    ? 'MAPS'
                    : bottomController.selectMenu.value == 2
                        ? 'WEAPONS'
                        : 'RANKS',
            size: height * 0.030,
            weight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: height * 0.08,
        width: width,
        color: AppColor.backDrop,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              menu.length,
              (index) => Obx(
                () => GestureDetector(
                  onTap: () {
                    bottomController.selectedMenu(index);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: bottomController.selectMenu.value == index
                          ? AppColor.peach
                          : Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        menu[index],
                        SizedBox(
                          width: width * 0.02,
                        ),
                        bottomController.selectMenu.value == index
                            ? Ts(
                                text: menuName[index],
                                color: Colors.white,
                                size: height * 0.0170,
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(() => screens[bottomController.selectMenu.value]),
    );
  }
}

ListTile commonListTile(
  GestureTapCallback onTap,
  IconData icon,
  String title,
) {
  return ListTile(
    onTap: onTap,
    leading: Icon(
      icon,
      color: AppColor.peach,
    ),
    title: Ts(
      text: title,
      color: AppColor.white,
    ),
  );
}
