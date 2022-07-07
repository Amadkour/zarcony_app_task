import 'package:flutter/cupertino.dart';
import 'package:zarcony_app_task/modules/dashboard/presentation/pages/dashboard_page.dart';


import '../../modules/home/presentation/page/home_screen.dart';
import '../widget/full_screen_image.dart';

class Routes {
  static const String dashboard = '/dashboard';
  static const String fullScreen = '/cart';
  static const String cart = '/fullScreen';

  ///---------------------Screens----------------///
  static final Map<String, Widget Function(BuildContext)> pageRoutes = {
    dashboard: (context) =>  DashboardPage(),
    fullScreen: (context) => FullScreenImage(),
    cart: (context) => HomeScreen(),
  };
}
