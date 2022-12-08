import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/model/weapon_model.dart';
import 'package:valorant_game_guide/view/utils/text.dart';

import '../utils/color.dart';
import '../utils/image.dart';

class Skins extends StatefulWidget {
  final List<Skin>? skin;
  const Skins({Key? key, this.skin}) : super(key: key);

  @override
  State<Skins> createState() => _SkinsState();
}

class _SkinsState extends State<Skins> {
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
      body: MasonryGridView.count(
        physics: BouncingScrollPhysics(),
        itemCount: widget.skin?.length,
        crossAxisCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => ShowSkins(
                  name: widget.skin![index].displayName,
                  imageSkin: widget.skin![index].displayIcon,
                ),
              );
            },
            child: Container(
              height: height * 0.2,
              width: width * 0.2,
              margin: EdgeInsets.all(width * 0.03),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.weaponColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: '${widget.skin![index].displayIcon}',
                    child: ImageLoading(
                      height: height * 0.1,
                      width: width,
                      url: '${widget.skin![index].displayIcon}',
                    ),
                  ),
                  Ts(
                    text: '${widget.skin![index].displayName}',
                    size: height * 0.021,
                    weight: FontWeight.w500,
                    maxLine: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShowSkins extends StatelessWidget {
  final imageSkin;
  final name;
  const ShowSkins({Key? key, this.imageSkin, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backDrop,
        title: Ts(
          text: '$name',
          size: height * 0.030,
          weight: FontWeight.w700,
        ),
      ),
      body: Center(
        child: Transform.rotate(
            angle: 7,
            child: Hero(
              tag: '${imageSkin}',
              child: ImageLoading(
                  url: '$imageSkin', height: height * 0.1, width: width),
            )),
      ),
    );
  }
}
