import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/model/weapon_model.dart';
import 'package:valorant_game_guide/view/3.weapon/skin.dart';
import 'package:valorant_game_guide/view/utils/image.dart';
import 'package:valorant_game_guide/view/utils/text.dart';

import '../utils/color.dart';

class WeaponDetailScreen extends StatefulWidget {
  final imageUrl, newImage, category, title;
  final List<Skin>? skins;

  final cost,
      legDamge,
      fireRate,
      magazine,
      reloadTime,
      rangeEnd,
      headDamge,
      bodyDamge;
  const WeaponDetailScreen({
    Key? key,
    this.imageUrl,
    this.newImage,
    this.category,
    this.title,
    this.cost,
    this.fireRate,
    this.magazine,
    this.reloadTime,
    this.rangeEnd,
    this.headDamge,
    this.bodyDamge,
    this.legDamge,
    this.skins,
  }) : super(key: key);

  @override
  State<WeaponDetailScreen> createState() => _WeaponDetailScreenState();
}

class _WeaponDetailScreenState extends State<WeaponDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backDrop,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: width,
                padding: EdgeInsets.all(height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: '${widget.imageUrl}',
                      child: ImageLoading(
                        url: '${widget.imageUrl}',
                        height: height * 0.18,
                        width: width,
                      ),
                    ),
                    Ts(
                      text: '${widget.title}',
                      size: height * 0.025,
                      color: AppColor.white,
                      weight: FontWeight.w900,
                      family: 'Roboto',
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * 0.05,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.peach,
                          ),
                          child: Center(
                            child: Ts(
                              text: '${widget.cost}',
                              color: AppColor.white,
                              size: height * 0.025,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                          width: width * 0.2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffDE332A),
                            ),
                            onPressed: () {
                              Get.to(
                                () => Skins(
                                  skin: widget.skins,
                                ),
                              );
                            },
                            child: Ts(
                              text: 'SKINS',
                              color: AppColor.white,
                              size: height * 0.018,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width,
                padding: EdgeInsets.all(height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "killfeed icon".toUpperCase(),
                              style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.005,
                            ),
                            Container(
                              height: height * 0.04,
                              width: width * 0.090,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("${widget.newImage}"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "category".toUpperCase(),
                              style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "${widget.category} ",
                              style: TextStyle(
                                fontSize: height * 0.014,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "wall damage".toUpperCase(),
                              style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "Low",
                              style: TextStyle(
                                fontSize: height * 0.014,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "fire rate".toUpperCase(),
                              style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "${widget.fireRate} / sec",
                              style: TextStyle(
                                fontSize: height * 0.014,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "reload speed".toUpperCase(),
                              style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "${widget.reloadTime} / sec",
                              style: TextStyle(
                                fontSize: height * 0.014,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "magazine speed".toUpperCase(),
                              style: TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "${widget.magazine}",
                              style: TextStyle(
                                fontSize: height * 0.014,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ts(
                          text: '---- DMAGE\n 0 - ${widget.rangeEnd}m',
                          color: Colors.white,
                          weight: FontWeight.w900,
                          size: height * 0.018,
                        ),
                        Image.asset(
                          'assets/image/human_full.png',
                          // height: height * 0.3,
                          width: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Ts(
                              text: '---- HEAD',
                              color: Colors.white,
                              weight: FontWeight.w900,
                              size: height * 0.018,
                            ),
                            Ts(
                              text: '${widget.headDamge}',
                              color: Colors.white,
                              size: height * 0.018,
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Ts(
                              text: '---- BODY',
                              color: Colors.white,
                              weight: FontWeight.w900,
                              size: height * 0.018,
                            ),
                            Ts(
                              text: '${widget.bodyDamge}',
                              color: Colors.white,
                              size: height * 0.018,
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Ts(
                              text: '---- LEG',
                              color: Colors.white,
                              weight: FontWeight.w900,
                              size: height * 0.018,
                            ),
                            Ts(
                              text: '${widget.legDamge}',
                              color: Colors.white,
                              size: height * 0.018,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Ts(
                      text: 'ALT FIRE INFO',
                      size: height * 0.022,
                      weight: FontWeight.w900,
                      color: AppColor.white,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 7,
                          backgroundColor: AppColor.white,
                        ),
                        Ts(
                          text: '  Zoom : 1..5',
                          size: height * 0.015,
                          color: AppColor.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.012,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 7,
                          backgroundColor: AppColor.white,
                        ),
                        Ts(
                          text: '  Fire Rate : 1..5',
                          size: height * 0.015,
                          color: AppColor.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
