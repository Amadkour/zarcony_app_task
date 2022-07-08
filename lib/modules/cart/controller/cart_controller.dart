import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarcony_app_task/modules/cart/provider/model/cartModel.dart';
import 'package:zarcony_app_task/modules/cart/provider/repo/mock_cart_repo.dart';

///-----------deal
//----------------repo provider---------------///
final cartRepositoryProvider = Provider<MockCartRepo>((ref) => MockCartRepo());
//-------------------listen data--------------///
final cartNotifierProvider = StateNotifierProvider<BlogNotifier, AsyncValue<List<CartModel>>>((ref){
  MockCartRepo service = ref.watch(cartRepositoryProvider);
  return BlogNotifier(service);
});

class BlogNotifier extends StateNotifier<AsyncValue<List<CartModel>>> {
  BlogNotifier(this._service) : super(const AsyncLoading()) {
    getData();
  }
  final MockCartRepo _service;

  void getData() async {
    state = await _service.fetchData();
  }
}