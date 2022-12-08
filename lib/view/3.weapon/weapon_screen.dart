import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/controller/weapon_controller.dart';
import 'package:valorant_game_guide/model/weapon_model.dart';
import 'package:valorant_game_guide/view/3.weapon/weapon_detail_screen.dart';
import 'package:valorant_game_guide/view/utils/color.dart';
import 'package:valorant_game_guide/view/utils/image.dart';

import '../../api/api_response.dart';
import '../utils/text.dart';

class WeaponScreen extends StatelessWidget {
  WeaponScreen({Key? key}) : super(key: key);

  WeaponController weaponController = Get.put(WeaponController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      body: GetBuilder<WeaponController>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {
            WeaponResponseModel weaponResponseModel =
                controller.apiResponse.data;
            return MasonryGridView.count(
              physics: BouncingScrollPhysics(),
              itemCount: weaponResponseModel.data!.length - 1,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => WeaponDetailScreen(
                        imageUrl: weaponResponseModel.data![index].displayIcon,
                        title: weaponResponseModel.data![index].displayName,
                        newImage:
                            weaponResponseModel.data![index].killStreamIcon,
                        category:
                            weaponResponseModel.data![index].shopData?.category,
                        fireRate: weaponResponseModel
                            .data![index].weaponStats?.fireRate,
                        reloadTime: weaponResponseModel
                            .data![index].weaponStats!.reloadTimeSeconds,
                        magazine: weaponResponseModel
                            .data![index].weaponStats!.magazineSize,
                        headDamge: weaponResponseModel.data![index].weaponStats!
                            .damageRanges![0].headDamage,
                        bodyDamge: weaponResponseModel.data![index].weaponStats!
                            .damageRanges![0].bodyDamage,
                        legDamge: weaponResponseModel.data![index].weaponStats!
                            .damageRanges![0].legDamage,
                        rangeEnd: weaponResponseModel.data![index].weaponStats!
                            .damageRanges![0].rangeEndMeters,
                        cost: weaponResponseModel.data![index].shopData!.cost,
                        skins: weaponResponseModel.data![index].skins
                            as List<Skin>,
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
                          tag:
                              '${weaponResponseModel.data![index].displayIcon}',
                          child: ImageLoading(
                            height: height * 0.1,
                            width: width,
                            url:
                                '${weaponResponseModel.data![index].displayIcon}',
                          ),
                        ),
                        Ts(
                          text:
                              '${weaponResponseModel.data![index].displayName}',
                          size: height * 0.021,
                          weight: FontWeight.w500,
                        ),
                        Ts(
                          text:
                              '${weaponResponseModel.data![index].shopData?.category}',
                          size: height * 0.014,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            if (controller.apiResponse.status == Status.ERROR) {
              return Center(
                child: Ts(
                  text: 'Somthing went wrong',
                  color: AppColor.white,
                ),
              );
            }
            return Center(
              child: Image.asset(
                'assets/image/Frame 826.png',
                height: height * 0.15,
                width: height * 0.15,
              ),
            );
          }
        },
      ),
    );
  }
}
