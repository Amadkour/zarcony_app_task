
 import '../model/deal_model.dart';
 import 'package:flutter_riverpod/flutter_riverpod.dart';
abstract class  DealRepoInterface{
  Future<AsyncValue<List<DealModel>>> fetchData();
}