import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/address/model/address_model.dart';
import '../provider/address/repo/mock_address_repo.dart';
import '../provider/adds/model/AddModel.dart';
import '../provider/adds/repo/mock_add_repo.dart';
import '../provider/category/model/CategoryModel.dart';
import '../provider/category/repo/mock_category_repo.dart';
import '../provider/deal/model/deal_model.dart';
import '../provider/deal/repo/mock_deal_repo.dart';

///--------------addresses
//----------------repo provider---------------///
final addressRepositoryProvider = Provider((ref) => MockAddressRepo());
//-------------------listen data--------------///
final addressControllerProvider = FutureProvider<List<AddressModel>>((ref) async {
  final repository = ref.read(addressRepositoryProvider);
  return repository.fetchData();
});

///-----------category
//----------------repo provider---------------///
final categoryRepositoryProvider = Provider((ref) => MockCategoryRepo());
//-------------------listen data--------------///
final categoryControllerProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repository = ref.read(categoryRepositoryProvider);
  return repository.fetchData();
});

///-----------category
//----------------repo provider---------------///
final addRepositoryProvider = Provider((ref) => MockAddRepo());
//-------------------listen data--------------///
final addControllerProvider = FutureProvider<List<AddModel>>((ref) async {
  final repository = ref.read(addRepositoryProvider);
  return repository.fetchData();
});

///-----------deal
//----------------repo provider---------------///
final dealRepositoryProvider = Provider<MockDealRepo>((ref) => MockDealRepo());
//-------------------listen data--------------///
final dealNotifierProvider = StateNotifierProvider<BlogNotifier, AsyncValue<List<DealModel>>>((ref){
  MockDealRepo _service = ref.watch(dealRepositoryProvider);
  return BlogNotifier(_service);
});

class BlogNotifier extends StateNotifier<AsyncValue<List<DealModel>>> {
  BlogNotifier(this._service) : super(const AsyncLoading()) {
    getPosts();
  }

  final MockDealRepo _service;

  void getPosts() async {
    state = await _service.fetchData();
  }
}
