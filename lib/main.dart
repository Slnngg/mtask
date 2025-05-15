import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mtest_app/routes/app_router.dart';
import 'package:mtest_app/routes/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/${RouteNames.homePage}', //splash
      getPages: AppRouter.routes,
    );
  }
}
