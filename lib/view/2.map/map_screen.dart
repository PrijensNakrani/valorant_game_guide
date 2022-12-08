import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/controller/map_controller.dart';
import 'package:valorant_game_guide/model/map_model.dart';
import 'package:valorant_game_guide/view/utils/color.dart';

import '../../api/api_response.dart';
import '../utils/text.dart';
import 'map_detail.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);
  MapController mapController = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      body: GetBuilder<MapController>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {
            MapResponseModel mapResponseModel = controller.apiResponse.data;

            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: mapResponseModel.data?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => Map(mapImage: mapResponseModel.data![index].splash),
                    );
                  },
                  child: Hero(
                    tag: '${mapResponseModel.data![index].splash}',
                    child: Container(
                      height: height * 0.15,
                      width: width,
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.02),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black38,
                        image: DecorationImage(
                          image: NetworkImage(mapResponseModel
                                      .data![index].listViewIcon ==
                                  null
                              ? "assets/image/Frame 826.png"
                              : '${mapResponseModel.data![index].listViewIcon}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Ts(
                          text: '${mapResponseModel.data![index].displayName}',
                          color: AppColor.white,
                          size: height * 0.03,
                        ),
                      ),
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
