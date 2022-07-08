import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarcony_app_task/modules/home/controller/address.dart';
import 'package:zarcony_app_task/modules/home/presentation/widget/deal/deal_list_design.dart';
import 'package:zarcony_app_task/modules/home/provider/deal/repo/mock_deal_repo.dart';
import '../../../../core/widget/app_bar.dart';
import '../../controller/add.dart';
import '../../controller/category.dart';
import '../../controller/deal.dart';
import '../../provider/deal/model/deal_model.dart';
import '../widget/add/slider.dart';
import '../widget/address/address_list_design.dart';
import '../widget/category/category_list_design.dart';
import '../widget/search_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: Consumer(builder: (BuildContext context,
            T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
          return Column(
            children: [
              ///---------------search
              const SearchWidget(),

              ///---------------addresses
              watch(addressControllerProvider).when(
                  data: (data) => AddressListWidget(
                        addresses: data,
                      ),
                  loading: () => const CircularProgressIndicator(),
                  error: (i, e) => const Text('data')),

              ///---------------categories
              watch(categoryControllerProvider).when(
                  data: (data) => CategoryListWidget(
                    categories: data,
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (i, e) => const Text('data')),

              ///---------------deals
              watch(dealNotifierProvider).when(
                  data: (List<DealModel> data) => DealListWidget(
                      deals: data,
                      onTap: (int index) {
                        if (data[index].isFavorite == false) {
                          context.read(dealNotifierProvider.notifier).state =
                              AsyncData(data..[index].isFavorite = true);
                        } else {
                          context.read(dealNotifierProvider.notifier).state =
                              AsyncData(data..[index].isFavorite = false);
                        }
                      }),
                  loading: () => const CircularProgressIndicator(),
                  error: (i, e) => const Text('data')),

              ///---------------add
              watch(addControllerProvider).when(
                  data: (data) => SliderWidget(
                    news: data,
                    isSlider: true,
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (i, e) => const Text('data')),
            ],
          );
        }));
  }
}
