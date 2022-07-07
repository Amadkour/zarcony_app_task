import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widget/app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(

      appBar:
      MyAppBar(
        title:'Populars' ,
        hasBackButton: false,
      ),
      body: Text(''),
    );
  }
}
