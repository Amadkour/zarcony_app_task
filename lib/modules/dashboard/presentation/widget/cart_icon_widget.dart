import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarcony_app_task/core/constant/color.dart';
import 'package:zarcony_app_task/modules/cart/controller/cart_controller.dart';

import '../../../../core/widget/my_image.dart';

class CartIconWidget extends ConsumerWidget {
  const CartIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return watch(cartNotifierProvider).when(
        data: (data) {
          double total = 0;
          data.fold(
              total,
              (previousValue, element) =>
                  total += double.parse(element.price!)*double.parse(element.quantity!));

          return Stack(
            children: [
              Positioned(
                // top: 12,
                // left: 5,
                child: SizedBox(
                  width: 39,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(flex: 1,child: SizedBox(),),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "\$${total.floor()==total?total.toInt():total}",
                          textAlign: TextAlign.right,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: AppColors.whiteColor, fontSize: 12),
                        ),
                      ),
                      const Expanded(flex: 2,child: SizedBox(),),

                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: MyImage(
                  url: 'assets/images/navbar/center.svg',
                  height: 40,
                  width: 40,
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          );
        },
        loading: () => const MyImage(
              url: 'assets/images/navbar/center.svg',
              height: 20,
              width: 20,
              fit: BoxFit.fitHeight,
            ),
        error: (i, e) => const MyImage(
              url: 'assets/images/navbar/center.svg',
              height: 20,
              width: 20,
              fit: BoxFit.fitHeight,
            ));
  }
}
