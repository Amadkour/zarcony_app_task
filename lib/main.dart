import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/constant/routes.dart';
import 'core/constant/them.dart';
import 'modules/dashboard/presentation/pages/dashboard_page.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Persons',
      debugShowCheckedModeBanner: false,
      theme:appTheme,
      initialRoute: Routes.dashboard,
      routes:Routes.pageRoutes,

      home:  DashboardPage(),
    );
  }
}
