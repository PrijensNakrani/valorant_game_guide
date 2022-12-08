import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../controller/agent_controller.dart';
import '../../model/agent_model.dart';
import '../utils/common_data.dart';

///
///
///
///
///  ALLLLLLLLLLLLLLLLLLL
class All extends StatelessWidget {
  final AgentResponseModel? data;

  AgentController agentController = Get.put(AgentController());

  All({this.data});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MasonryGridView.count(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      itemCount: data?.data?.length,
      crossAxisSpacing: width * 0.07,
      itemBuilder: (context, index) {
        return Data(
          index: index,
          height: height,
          width: width,
          data: data,
        );
      },
    );
  }
}

///
///
///
///
///  DUELIST
class Duelist extends StatelessWidget {
  final AgentResponseModel? data;

  AgentController agentController = Get.put(AgentController());

  Duelist({this.data});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MasonryGridView.count(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      crossAxisCount: 2,
      itemCount: data?.data?.length,
      crossAxisSpacing: width * 0.07,
      itemBuilder: (context, index) {
        if (data!.data![index].role?.displayName == 'Duelist') {
          return Data(index: index, height: height, width: width, data: data);
        } else {
          return SizedBox();
        }
      },
    );
  }
}

///
///
///
///
///  SENTINEL
class Sentinel extends StatelessWidget {
  final AgentResponseModel? data;

  AgentController agentController = Get.put(AgentController());

  Sentinel({this.data});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MasonryGridView.count(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      crossAxisCount: 2,
      itemCount: data?.data?.length,
      crossAxisSpacing: width * 0.07,
      itemBuilder: (context, index) {
        if (data!.data![index].role?.displayName == 'Sentinel') {
          return Data(index: index, height: height, width: width, data: data);
        } else {
          return SizedBox();
        }
      },
    );
  }
}

///
///
///
///
///  Initiator
class Initiator extends StatelessWidget {
  final AgentResponseModel? data;

  AgentController agentController = Get.put(AgentController());

  Initiator({this.data});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MasonryGridView.count(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      crossAxisCount: 2,
      itemCount: data?.data?.length,
      crossAxisSpacing: width * 0.07,
      itemBuilder: (context, index) {
        if (data!.data![index].role?.displayName == 'Initiator') {
          return Data(index: index, height: height, width: width, data: data);
        } else {
          return SizedBox();
        }
      },
    );
  }
}

///
///
///
///
///  CONTROLLER
class Controller extends StatelessWidget {
  final AgentResponseModel? data;

  AgentController agentController = Get.put(AgentController());

  Controller({this.data});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MasonryGridView.count(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      crossAxisCount: 2,
      itemCount: data?.data?.length,
      crossAxisSpacing: width * 0.07,
      itemBuilder: (context, index) {
        if (data!.data![index].role?.displayName == 'Controller') {
          return Data(index: index, height: height, width: width, data: data);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
