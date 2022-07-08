import 'package:flutter/cupertino.dart';
import 'package:zarcony_app_task/modules/dashboard/presentation/pages/dashboard_page.dart';


class Routes {
  static const String dashboard = '/dashboard';


  ///---------------------Screens----------------///
  static final Map<String, Widget Function(BuildContext)> pageRoutes = {
    dashboard: (context) =>  DashboardPage(),
  };
}
