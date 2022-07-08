import '../provider/deal/model/deal_model.dart';
import '../provider/deal/repo/mock_deal_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///----------------repo provider---------------///
final dealRepositoryProvider = Provider<MockDealRepo>((ref) => MockDealRepo());

///-------------------listen data--------------///
final dealNotifierProvider = StateNotifierProvider<DealNotifier, AsyncValue<List<DealModel>>>((ref){
  MockDealRepo _service = ref.watch(dealRepositoryProvider);
  return DealNotifier(_service);
});

///-------------------notifier-------------///
class DealNotifier extends StateNotifier<AsyncValue<List<DealModel>>> {
  DealNotifier(this._service) : super(const AsyncLoading()) {
    getPosts();
  }

  final MockDealRepo _service;

  void getPosts() async {
    state = await _service.fetchData();
  }
}
