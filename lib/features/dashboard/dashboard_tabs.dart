import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_colors.dart';
import 'package:cyberpay_mobile_2/features/dashboard/dashboard_home.dart';
import 'package:cyberpay_mobile_2/features/dashboard/dashboard_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/utils/app_strings.dart';
import '../../common/widgets/bottom_tab_widget.dart';
import 'dashboard_help.dart';
import 'dashboard_trasactions.dart';

///  DashboardTabs
class DashboardTabs extends StatefulWidget {
  /// Main screen of the app that enable navigation with tabs
  final int tabIndex;

  ///  DashboardTabs
  const DashboardTabs({Key? key, this.tabIndex = 0}) : super(key: key);

  @override
  State<DashboardTabs> createState() => _DashboardTabsState();
}

class _DashboardTabsState extends State<DashboardTabs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedTab(0);
        },
        backgroundColor: AppColors.white,
        child: const Icon(
          Icons.qr_code,
          size: 25,
          color: AppColors.primary,
        ),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        DashboardHome(),
        Transactions(),
        DashBoardHelp(),
        Profile(),
      ],
    );
  }
  Widget getFooter() {
    return AnimatedBottomNavigationBar.builder(
      splashColor: const Color(0xff747B84),
      activeIndex: pageIndex,
      itemCount: tabItems.length,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      leftCornerRadius:  10,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      tabBuilder: (int index, bool isActive) {
        final color =
            isActive ? const Color(0xFF000000) : Colors.black.withOpacity(0.5);

        return TabWidget(color: color, item: tabItems[index],
        );
      },
      backgroundColor: AppColors.ligthBlue,
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}



