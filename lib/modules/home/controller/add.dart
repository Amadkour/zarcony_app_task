import '../provider/adds/model/AddModel.dart';
import '../provider/adds/repo/mock_add_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
///-----------add
//----------------repo provider---------------///
final addRepositoryProvider = Provider((ref) => MockAddRepo());
//-------------------listen data--------------///
final addControllerProvider = FutureProvider<List<AddModel>>((ref) async {
  final repository = ref.read(addRepositoryProvider);
  return repository.fetchData();
});