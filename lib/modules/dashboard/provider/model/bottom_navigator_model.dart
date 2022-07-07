import 'package:flutter/cupertino.dart';

class BottomNavigatorModel {
  late final String title;
  late final String? imageURL;
  late final IconData? icon;
  late final Image? image;
  late final bool open;
  late final Function onTab;

  BottomNavigatorModel({
    required this.title,
     this.icon,
     this.image,
    required this.onTab,
    this.imageURL,
    this.open = true,
  });
}
