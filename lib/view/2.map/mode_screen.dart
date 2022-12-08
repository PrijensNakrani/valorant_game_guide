import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/controller/mode_controller.dart';
import 'package:valorant_game_guide/model/mode_model.dart';
import 'package:valorant_game_guide/view/utils/color.dart';

import '../../api/api_response.dart';
import '../utils/image.dart';
import '../utils/text.dart';

class ModeScreen extends StatefulWidget {
  const ModeScreen({Key? key}) : super(key: key);

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {
  ModeController modeController = Get.put(ModeController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backDrop,
        centerTitle: true,
        title: Ts(
          text: 'MODS',
          size: height * 0.030,
          weight: FontWeight.w700,
        ),
      ),
      body: GetBuilder<ModeController>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {
            ModeResponseModel modeResponseModel = controller.apiResponse.data;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: modeResponseModel.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: height * 0.2,
                    width: width,
                    margin: EdgeInsets.all(width * 0.03),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black38,
                    ),
                    child: Row(
                      children: [
                        ImageLoading(
                          height: height * 0.2,
                          width: width * 0.2,
                          url: '${modeResponseModel.data![index].displayIcon}',
                        ),
                        SizedBox(
                          width: width * 0.07,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Ts(
                                  text: 'Mode : ',
                                  size: height * 0.021,
                                  weight: FontWeight.w500,
                                  color: AppColor.peach,
                                ),
                                Ts(
                                  text:
                                      '${modeResponseModel.data![index].displayName}',
                                  size: height * 0.021,
                                  weight: FontWeight.w500,
                                  color: AppColor.white,
                                  maxLine: 2,
                                  overFlow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Ts(
                                  text: 'Duration : ',
                                  size: height * 0.021,
                                  weight: FontWeight.w500,
                                  color: AppColor.peach,
                                ),
                                Ts(
                                  text:
                                      '${modeResponseModel.data![index].duration}',
                                  size: height * 0.021,
                                  weight: FontWeight.w500,
                                  color: AppColor.white,
                                ),
                              ],
                            ),
                          ],
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
