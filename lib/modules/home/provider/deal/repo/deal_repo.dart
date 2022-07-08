
import '../model/deal_model.dart';
import 'deal_repo_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class DealRepo implements DealRepoInterface{
  @override
  Future<AsyncValue<List<DealModel>>> fetchData() async {
    return AsyncData([]);
  }

}