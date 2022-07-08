import 'package:flutter/material.dart';

import '../model/bottom_navigator_model.dart';

class BottomNavigatorRepo {
  final List<BottomNavigatorModel> _items = [];

  BottomNavigatorRepo() {
    _items.add(
      BottomNavigatorModel(
        title: 'grocery',
        image: Image.asset('assets/images/navbar/grocery.svg'),
        onTab: () {},
      ),
    );
    _items.add(
      BottomNavigatorModel(
        title: 'news',
        image: Image.asset('assets/images/navbar/news.svg'),
        onTab: () {},
      ),
    );
    _items.add(
      BottomNavigatorModel(
        title: 'favorite',
        image: Image.asset('assets/images/navbar/favorite.svg'),
        onTab: () {},
      ),
    );
    _items.add(
      BottomNavigatorModel(
        title: 'cart',
        image: Image.asset('assets/images/navbar/cart.svg'),
        onTab: () {},
      ),
    );
  }

  List<BottomNavigatorModel> fetchItems() => _items;
}
