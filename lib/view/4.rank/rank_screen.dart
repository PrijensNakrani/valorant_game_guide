import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/controller/rank_controller.dart';
import 'package:valorant_game_guide/model/rank_model.dart';

import '../../api/api_response.dart';
import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/text.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({Key? key}) : super(key: key);

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  RankController rankController = Get.put(RankController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      body: GetBuilder<RankController>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {
            RankResponseModel rankResponseModel = controller.apiResponse.data;
            return MasonryGridView.count(
              physics: BouncingScrollPhysics(),
              itemCount: rankResponseModel.data![3].tiers?.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return rankResponseModel.data![3].tiers![index].largeIcon ==
                        null
                    ? SizedBox()
                    : Container(
                        height: height * 0.2,
                        width: width * 0.2,
                        margin: EdgeInsets.all(width * 0.03),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(
                            int.parse(
                              '0xff${rankResponseModel.data![3].tiers![index].color}',
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ImageLoading(
                              height: height * 0.1,
                              width: width,
                              url:
                                  '${rankResponseModel.data![3].tiers![index].largeIcon}',
                            ),
                            Ts(
                              text:
                                  '${rankResponseModel.data![3].tiers![index].tierName}',
                              size: height * 0.021,
                              weight: FontWeight.w500,
                              color: AppColor.white,
                            ),
                          ],
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
