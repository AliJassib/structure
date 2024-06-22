import 'package:flutter/material.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/controller/set_data_controller.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({
    super.key,
    required TabController? tabController,
    required this.controller,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final SetDataController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 1,
        ),
      ),
      child: TabBar(
        controller: _tabController,
        dividerColor: Colors.transparent,
        padding: EdgeInsets.zero,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        indicator: BoxDecoration(
          // borderRadius: _tabController!.index == 0
          //     ? const BorderRadius.only(
          //         topLeft: Radius.circular(0),
          //         bottomLeft: Radius.circular(0),
          //         topRight: Radius.circular(25),
          //         bottomRight: Radius.circular(25),
          //       )
          //     : const BorderRadius.only(
          //         topLeft: Radius.circular(25),
          //         bottomLeft: Radius.circular(25),
          //         topRight: Radius.circular(0),
          //         bottomRight: Radius.circular(0),
          //       ),
          color: Theme.of(context).colorScheme.primary,
        ),
        labelPadding: EdgeInsets.zero,
        labelColor: Theme.of(context).colorScheme.surface,
        unselectedLabelColor: Colors.black,
        onTap: (value) {
          controller.tabIndex.value = value;
        },
        tabs: [
          Tab(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text("الكل".tr),
            ),
          ),
          Tab(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text("المدفوعة".tr),
            ),
          ),
          Tab(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text("الغير المدفوعة".tr),
            ),
          ),
        ],
      ),
    );
  }
}
