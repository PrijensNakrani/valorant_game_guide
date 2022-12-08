import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/api/api_response.dart';
import 'package:valorant_game_guide/controller/agent_controller.dart';
import 'package:valorant_game_guide/controller/tabs_controller.dart';
import 'package:valorant_game_guide/model/agent_model.dart';
import 'package:valorant_game_guide/view/utils/color.dart';
import 'package:valorant_game_guide/view/utils/text.dart';

import 'categories.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({Key? key}) : super(key: key);

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List tab = ['All', 'Duelist', 'Sentinel', 'Initiator', 'Controller'];
  AgentController agentController = Get.put(AgentController());
  @override
  void initState() {
    agentController.getAgentData();
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  TabsController tabsController = Get.put(TabsController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          TabBar(
            isScrollable: true,
            onTap: (value) {
              tabsController.selectedTab(value);
            },
            physics: BouncingScrollPhysics(),
            indicatorColor: Colors.transparent,
            controller: tabController,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            tabs: List.generate(
              5,
              (index) => Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.1),
                  decoration: BoxDecoration(
                    color: tabsController.selectTab.value == index
                        ? AppColor.peach
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Ts(
                    text: tab[index],
                    color: tabsController.selectTab.value == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<AgentController>(
              builder: (controller) {
                if (controller.apiResponse.status == Status.COMPLETE) {
                  AgentResponseModel responseModel =
                      controller.apiResponse.data;

                  return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      All(data: responseModel),
                      Duelist(data: responseModel),
                      Sentinel(data: responseModel),
                      Initiator(data: responseModel),
                      Controller(data: responseModel),
                    ],
                    controller: tabController,
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
          ),
        ],
      ),
    );
  }
}
