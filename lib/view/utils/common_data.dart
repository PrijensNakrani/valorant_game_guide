import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/view/utils/image.dart';

import '../../model/agent_model.dart';
import '../1.agent/detail_screen.dart';
import 'color.dart';
import 'text.dart';

class Data extends StatelessWidget {
  const Data({
    Key? key,
    required this.height,
    required this.width,
    required this.data,
    this.index,
    this.categories,
  }) : super(key: key);

  final double height;
  final index;
  final categories;
  final double width;
  final AgentResponseModel? data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailScreen(
            image: data!.data![index].fullPortraitV2,
            name: data!.data![index].displayName,
            role: data!.data![index].role!.displayName,
            icon: data!.data![index].role!.displayIcon,
            discription: data!.data![index].description,
            ability: data!.data![index].abilities as List<Ability>,
            // uid: data!.data![index].uuid,
          ),
        );
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.007)
          ..rotateY(-0.06)
          ..rotateX(-0.1),
        child: Container(
          height: height * 0.2,
          width: width * 0.2,
          margin: EdgeInsets.only(bottom: height * 0.02, top: height * 0.07),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(int.parse(
                    '0xff${data!.data![index].backgroundGradientColors![0]}')),
                Color(int.parse(
                    '0xff${data!.data![index].backgroundGradientColors![1]}')),
                Color(int.parse(
                    '0xff${data!.data![index].backgroundGradientColors![2]}')),
                Color(int.parse(
                    '0xff${data!.data![index].backgroundGradientColors![3]}')),
              ],
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: height * 0.006,
                left: width * 0.02,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ts(
                      text: data!.data![index].role?.displayName == null
                          ? '${data!.data![0].role!.displayName}'
                          : '${data!.data![index].role!.displayName}',
                      size: height * 0.020,
                      weight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                    Ts(
                      text: data!.data![index].displayName == null
                          ? '${data!.data![0].displayName}'
                          : '${data!.data![index].displayName}',
                      size: height * 0.03,
                      weight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -height * 0.060,
                bottom: height * 0.030,
                left: 0,
                right: 0,
                child: Hero(
                  tag: "${data!.data![index].fullPortraitV2}",
                  child: ImageLoading(
                    url: '${data!.data![index].fullPortraitV2}',
                    height: height * 0.1,
                    width: height * 0.1,
                    boxFit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
