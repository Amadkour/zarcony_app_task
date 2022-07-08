import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zarcony_app_task/modules/cart/provider/model/cartModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_repo.dart';

class MockCartRepo implements CartRepo{
  @override
  Future<AsyncValue<List<CartModel>>> fetchData() async {
    String data = await rootBundle
        .loadString('assets/mocks/cart_mock.json');

    return AsyncData((json.decode(data)as List).map((e)=>CartModel.fromJson(e)).toList());

  }


}