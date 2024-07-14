import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constants/routes.dart';
import 'package:untitled1/features/service/app_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppService().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "Ubuntu"),
      initialRoute: '/auth',
      getPages: AppRoutes.pages,
    );
  }
}

