import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/address/model/address_model.dart';
import '../provider/address/repo/mock_address_repo.dart';

///----------------repo provider---------------///
final addressRepositoryProvider = Provider((ref) => MockAddressRepo());
///-------------------listen data--------------///
final addressControllerProvider = FutureProvider<List<AddressModel>>((ref) async {
  final repository = ref.read(addressRepositoryProvider);
  return repository.fetchData();
});
