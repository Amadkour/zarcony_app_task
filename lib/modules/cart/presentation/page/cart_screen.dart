import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarcony_app_task/modules/cart/controller/cart_controller.dart';
import 'package:zarcony_app_task/modules/cart/presentation/widget/cart_list_design.dart';
import 'package:zarcony_app_task/modules/cart/provider/model/cartModel.dart';
import '../../../../core/widget/app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/controller/home_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: Consumer(builder: (BuildContext context,
            T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
          return Center(
            child: watch(cartNotifierProvider).when(
                data: (List<CartModel> data) => CartListWidget(
                    items: data,
                   onIncrease: (index){
                     context.read(cartNotifierProvider.notifier).state=AsyncData(data..[index].quantity=(int.parse(data[index].quantity!)+1).toString());
                   },
                    onDecrease: (index){
                      context.read(cartNotifierProvider.notifier).state=AsyncData(data..[index].quantity=(int.parse(data[index].quantity!)-1).toString());
                    },
                    ),
                loading: () => const CircularProgressIndicator(),
                error: (i, e) => const Text('data')),
          );
        }));
  }
}
