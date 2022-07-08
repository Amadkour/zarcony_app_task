
 import 'package:zarcony_app_task/modules/cart/provider/model/cartModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 abstract class  CartRepo {
  Future<AsyncValue<List<CartModel>>> fetchData();
 }