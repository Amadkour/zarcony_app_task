import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarcony_app_task/core/widget/address_widget.dart';
import 'package:zarcony_app_task/core/widget/my_image.dart';

import '../constant/color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar() : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor:AppColors.whiteColor ,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        elevation: 0,
        title: Row(
      mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          AddressWidget(),
          MyImage(url: '',width: 60,height: 60,)
        ],),);
  }

  @override
  final Size preferredSize;
}
