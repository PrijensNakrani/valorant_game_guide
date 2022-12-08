import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/controller/ability_controller.dart';
import 'package:valorant_game_guide/controller/pages_Controller.dart';
import 'package:valorant_game_guide/model/agent_model.dart';
import 'package:valorant_game_guide/view/utils/image.dart';
import 'package:valorant_game_guide/view/utils/text.dart';

import '../utils/color.dart';

class DetailScreen extends StatefulWidget {
  final image;
  final name;
  final role;
  final icon;
  final discription;
  final List<Ability>? ability;
  const DetailScreen({
    Key? key,
    this.image,
    this.name,
    this.role,
    this.icon,
    this.discription,
    this.ability,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);
  PagesController pagesController = Get.put(PagesController());
  AbilityController abilityController = Get.put(AbilityController());
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: widget.ability!.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: height * 0.1,
              pinned: true,
              backgroundColor: AppColor.backDrop,
              expandedHeight: height * 0.6,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: '${widget.image}',
                  child: ImageLoading(
                    url: '${widget.image}',
                    boxFit: BoxFit.cover,
                    height: height * 0.6,
                    width: width,
                  ),
                ),
              ),
              bottom: PreferredSize(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ts(
                        text: '${widget.name}',
                        size: height * 0.04,
                        weight: FontWeight.w900,
                        color: AppColor.white,
                      ),
                      Row(
                        children: [
                          Image.network(
                            '${widget.icon}',
                            height: height * 0.022,
                          ),
                          Ts(
                            text: '    ${widget.role}',
                            size: height * 0.018,
                            weight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  width: double.maxFinite,
                ),
                preferredSize: const Size.fromHeight(20),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Ts(
                          text: '${widget.discription}',
                          size: height * 0.018,
                          color: AppColor.white,
                          maxLine: 6,
                          overFlow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Ts(
                          text: 'ABILITY',
                          size: height * 0.028,
                          color: AppColor.white,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        TabBar(
                          controller: tabController,
                          isScrollable: true,
                          indicatorColor: Colors.transparent,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: (value) {
                            abilityController.selectedAbility(value);
                          },
                          tabs: List.generate(
                            widget.ability!.length,
                            (index) => Obx(
                              () => Container(
                                height: height * 0.08,
                                width: height * 0.08,
                                decoration: BoxDecoration(
                                  color:
                                      abilityController.Ability.value == index
                                          ? AppColor.peach
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColor.white),
                                ),
                                child: Center(
                                  child: ImageLoading(
                                    url:
                                        '${widget.ability![index].displayIcon}',
                                    height: height * 0.04,
                                    width: height * 0.04,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        SizedBox(
                          height: height * 0.2,
                          child: TabBarView(
                            controller: tabController,
                            children: List.generate(
                              widget.ability!.length,
                              (index) => Container(
                                // height: height * 0.08,
                                // width: height * 0.08,
                                margin: EdgeInsets.only(right: width * 0.05),
                                padding: EdgeInsets.all(height * 0.04),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColor.white),
                                ),
                                child: Center(
                                  child: Ts(
                                    color: AppColor.white,
                                    height: 1.5,
                                    size: height * 0.020,
                                    text:
                                        '${widget.ability![index].description}',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
