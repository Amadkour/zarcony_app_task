
import 'package:zarcony_app_task/modules/cart/provider/model/cartModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_repo.dart';

class MyCartRepo implements CartRepo{
  @override
  Future<AsyncValue<List<CartModel>>> fetchData() async {
    return const AsyncData([]);
  }
}