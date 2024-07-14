

import 'package:get/get.dart';
import 'package:untitled1/features/home/logic/home_bindings.dart';

import '../../features/auth/logic/auth_bindings.dart';
import '../../features/auth/presentation/screens/auth_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

abstract class AppRoutes {
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';

  static final List<GetPage> pages =[

    GetPage(name: authRoute, page: () => const AuthScreen(),binding: AuthBindgins()),
    GetPage(name: homeRoute, page: () =>  HomeScreen(),binding: HomeBindings()),
   ];

}