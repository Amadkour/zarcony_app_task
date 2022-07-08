import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarcony_app_task/core/constant/color.dart';

class QuantityChangeButtonDesign extends StatelessWidget {
  const QuantityChangeButtonDesign({Key? key, required this.onTap, required this.isIncreaseButton}) : super(key: key);
  final void Function() onTap;
  final bool isIncreaseButton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:  BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.quantityButtonBackgroundColor
        ),
        child:  Icon(isIncreaseButton?CupertinoIcons.add:CupertinoIcons.minus,color: AppColors.quantityButtonColor,),
      ),
    );
  }
}
