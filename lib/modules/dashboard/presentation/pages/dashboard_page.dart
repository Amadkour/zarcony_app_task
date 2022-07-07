import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../../core/constant/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widget/my_image.dart';
import '../../controller/dashboard_controller.dart';
import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context,
          T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
        return context.read(dashboardControllerProvider).when(
            data: (data) {
              return CurvedNavBar(
                actionButton: CurvedActionBar(
                    onTab: (value) {
                      context.read(dashboardControllerIndex).state = 2;
                    },
                    activeIcon: Container(
                      padding: const EdgeInsets.all(20),
                      decoration:  BoxDecoration(
                          color: AppColors.primaryColor, shape: BoxShape.circle),
                      child: const MyImage(
                        url: 'assets/images/navbar/center.svg',
                        height: 20,
                        width: 20,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    text: ""),
                activeColor:AppColors.primaryColor,
                navBarBackgroundColor: Colors.white,
                inActiveColor: Colors.black45,
                appBarItems: List.generate(
                    data.length,
                    (index) => FABBottomAppBarItem(
                        activeIcon: MyImage(
                          url: 'assets/images/navbar/${data[index].title}.svg',
                          height: 20,
                          width: 20,
                          color: AppColors.primaryColor,
                          fit: BoxFit.fitHeight,
                        ),
                        inActiveIcon: MyImage(
                          url: 'assets/images/navbar/${data[index].title}.svg',
                          height: 20,
                          width: 20,
                          color: AppColors.darkGreyColor,
                          fit: BoxFit.fitHeight,
                        ),
                        text: data[index].title)),
                bodyItems: _buildScreens(),
                actionBarView: const Text('Cart'),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (i, e) => const Text('error'));
      },
    );
  }

  List<Widget> _buildScreens() {
    return const [
      Text('home'),
      Text('news'),
      Text('favorite'),
      Text('wallet'),
    ];
  }
}
