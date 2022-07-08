import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../provider/model/bottom_navigator_model.dart';
import '../provider/repo/repo.dart';

///----------------repo provider---------------///
final repositoryProvider = Provider((ref) => BottomNavigatorRepo());

///----------------person Id provider---------------///
final dashboardControllerIndex = StateProvider((ref) => 0);
final dashboardController = StateProvider((ref) => PersistentTabController(
    initialIndex: ref.watch(dashboardControllerIndex).state));

///-------------------listen data--------------///
final dashboardControllerProvider =
    FutureProvider<List<BottomNavigatorModel>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return repository.fetchItems();
});
