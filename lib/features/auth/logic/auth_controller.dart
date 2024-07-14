
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constants/typedef.dart';
import '../../service/app_service.dart';
import '../data/models/login_model.dart';
import '../data/providers/auth_pro.dart';
import '../data/repositories/auth_repo.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    _authPro = AuthProvider(
        authRepo: AuthRepo(networkService: appService.networkService));
    super.onInit();
  }

  final AppService appService = Get.find();
  late String phone;
  late String password;
  LoginModel? loginModel;
  late AuthProvider _authPro;
  final GlobalKey formKey = GlobalKey<FormState>();
  Future<bool> login() async {
    try {
     parameters params = {"phone": phone, "password": password};
      loginModel = await _authPro.login(params: params);
      print("loginModel $loginModel");
      if (loginModel != null) {
        return true;
      }
    } catch (e) {
      print("error in register $e");
    }
    return false;
  }

}
