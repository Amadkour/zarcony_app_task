import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/deal_model.dart';
import 'deal_repo_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class MockDealRepo implements DealRepoInterface{
  @override
  Future<AsyncValue<List<DealModel>>> fetchData() async {
    String data = await rootBundle
        .loadString('assets/mocks/deal_mock.json');
    return AsyncData((json.decode(data)as List).map((e)=>DealModel.fromJson(e)).toList());
  }

}