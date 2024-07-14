import 'dart:convert';

import '../../../../core/constants/typedef.dart';
import '../models/login_model.dart';
import '../repositories/auth_repo.dart';

class AuthProvider {
  final AuthRepo _authRepo;

  AuthProvider({required AuthRepo authRepo}) : _authRepo = authRepo;


  Future<LoginModel?> login({required parameters params}) async {
    try {
      parameters? json = await _authRepo.login(data: params);
      print("js $json");
      if(json!= null){
        return LoginModel.fromJson(json);
      }
      } catch (e) {
      print("error in login provider ${e.toString()}");
    }
    return null;
  }
}
