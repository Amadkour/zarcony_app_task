
import '../provider/category/model/CategoryModel.dart';
import '../provider/category/repo/mock_category_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
///-----------category
//----------------repo provider---------------///
final categoryRepositoryProvider = Provider((ref) => MockCategoryRepo());
//-------------------listen data--------------///
final categoryControllerProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repository = ref.read(categoryRepositoryProvider);
  return repository.fetchData();
});
